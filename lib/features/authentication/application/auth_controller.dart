import 'dart:async';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logging/logging.dart';
import 'package:mobiarmy_flutter/core/network/command/commands.dart';
import 'package:mobiarmy_flutter/core/network/data_sync_service.dart';
import 'package:mobiarmy_flutter/core/network/dispatcher/message_dispatcher.dart';
import 'package:mobiarmy_flutter/core/network/network_provider.dart';
import 'package:mobiarmy_flutter/core/network/ping_heartbeat.dart';
import 'package:mobiarmy_flutter/core/network/protocol/message.dart';
import 'package:mobiarmy_flutter/core/network/transport/session_state_listener.dart';
import 'package:mobiarmy_flutter/core/network/transport/tcp_session.dart';
import 'package:mobiarmy_flutter/features/authentication/application/auth_state_machine.dart';
import 'package:mobiarmy_flutter/features/authentication/data/auth_repository.dart';
import 'package:mobiarmy_flutter/features/authentication/data/post_login_service.dart';
import 'package:mobiarmy_flutter/features/authentication/data/session_packet_mapper.dart';
import 'package:mobiarmy_flutter/features/authentication/domain/account_credentials.dart';
import 'package:mobiarmy_flutter/features/authentication/domain/authentication_state.dart';
import 'package:mobiarmy_flutter/features/authentication/domain/game_server.dart';

class AuthController extends Notifier<AuthenticationState>
    implements SessionStateListener {
  final _logger = Logger('AuthController');

  late final AuthStateMachine _machine;
  late final TcpSession _session;
  late final AuthRepository _repository;
  late final SessionPacketMapper _mapper;
  PingHeartbeat? _ping;
  Timer? _authTimeout;

  @override
  AuthenticationState build() {
    _machine = AuthStateMachine();
    final dispatcher = ref.watch(messageDispatcherProvider);
    _session = ref.watch(tcpSessionProvider);
    _repository = AuthRepository(_session);
    _mapper = const SessionPacketMapper();
    final listenerHolder = ref.watch(sessionListenerHolderProvider);
    listenerHolder.delegate = this;

    _registerHandlers(dispatcher);

    ref.onDispose(() {
      listenerHolder.delegate = null;
      _authTimeout?.cancel();
      _ping?.stop();
    });

    return _machine.state;
  }

  void _registerHandlers(MessageDispatcher dispatcher) {
    dispatcher
      ..register(Commands.loadInfoAll, _onLoadInfoAll)
      ..register(Commands.log, _onLog)
      ..register(Commands.idNotCollision, _onIdNotCollision);
  }

  // ---------------------------------------------------------------- commands

  Future<void> connect(GameServer server) async {
    state = _machine.connectTo(server);
    state = _machine.handshakeStarted();
    try {
      await _session.connect(server.host, server.port);
    } catch (e) {
      state = _machine.connectionLost('Khong ket noi duoc ${server.endpoint}');
    }
  }

  Future<void> login(
    AccountCredentials credentials, {
    bool remember = false,
  }) async {
    if (state.status != AuthStatus.connected) return;
    state = _machine.loginRequested();
    _authTimeout?.cancel();
    _authTimeout = Timer(const Duration(seconds: 20), () {
      if (state.status == AuthStatus.authenticating) {
        state = _machine.connectionLost('Dang nhap qua lau — server khong phan hoi');
      }
    });
    try {
      await _repository.login(credentials);
      // Cho cmd 3 toi qua _onLoadInfoAll — o do moi chay PostLogin + sync.
      _pendingCredentials = (credentials, remember);
    } catch (e) {
      _authTimeout?.cancel();
      state = _machine.connectionLost('Gui yeu cau dang nhap that bai: $e');
    }
  }

  (AccountCredentials, bool)? _pendingCredentials;

  Future<AccountCredentials?> loadRememberedCredentials() async {
    final remembered = await PostLoginService.loadRemembered();
    if (remembered == null) return null;
    return AccountCredentials(
      username: remembered.$1,
      password: remembered.$2,
    );
  }

  Future<void> disconnect() async {
    try {
      if (_session.isConnected) await _repository.sendQuit();
    } catch (_) {}
    await _session.dispose();
    _authTimeout?.cancel();
    _ping?.stop();
    state = _machine.logout();
  }

  // ------------------------------------------------------------- transport

  @override
  void onHandshakeComplete() {
    state = _machine.handshakeComplete();
  }

  @override
  void onDisconnected(String? reason) {
    _authTimeout?.cancel();
    state = _machine.connectionLost(reason);
  }

  @override
  void onSocketError(Object error) {
    _logger.warning('Socket error: $error');
  }

  // --------------------------------------------------------------- packets

  void _onLoadInfoAll(Message message) {
    try {
      final session = _mapper.decodeLoadInfoAll(message);
      final pending = _pendingCredentials;
      _authTimeout?.cancel();

      _logger.info('Login successful, starting data sync chain...');

      // Post-login flow: platform_request + bangxephang + sync chain 90.
      final sync = DataSyncService(_session, ref.read(messageDispatcherProvider));

      if (pending != null) {
        PostLoginService.run(
          _session,
          sync,
          username: pending.$1.username,
          password: pending.$1.password,
          remember: pending.$2,
        );
      } else {
        sync.start();
      }

      sync.done.then((_) {
        _logger.info('Data sync chain completed, transitioning to authenticated state');
        state = _machine.loginSucceeded(session);
        _ping = PingHeartbeat(_session)..start();
      }).catchError((Object e) {
        _logger.severe('Data sync failed: $e');
        state = _machine.connectionLost('Đồng bộ dữ liệu thất bại: $e');
      });
    } catch (e, stack) {
      _logger.severe('loadInfoAll parse failed', e, stack);
      state = _machine.connectionLost('Phản hồi đăng nhập không hợp lệ');
    }
  }

  void _onLog(Message message) {
    final text = _mapper.decodeLog(message);
    final next = _machine.logReceived(text);
    if (next != state) {
      _authTimeout?.cancel();
      state = next;
    } else {
      _logger.info('Server notice: $text');
    }
  }

  void _onIdNotCollision(Message message) {
    _logger.info('idNotCollision: ${_mapper.decodeIdNotCollision(message)}');
  }
}

final authControllerProvider =
    NotifierProvider<AuthController, AuthenticationState>(AuthController.new);