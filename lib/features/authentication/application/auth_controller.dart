import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logging/logging.dart';
import 'package:mobiarmy_flutter/core/network/command/commands.dart';
import 'package:mobiarmy_flutter/core/network/dispatcher/message_dispatcher.dart';
import 'package:mobiarmy_flutter/core/network/network_provider.dart';
import 'package:mobiarmy_flutter/core/network/protocol/message.dart';
import 'package:mobiarmy_flutter/core/network/transport/session_state_listener.dart';
import 'package:mobiarmy_flutter/core/network/transport/tcp_session.dart';
import 'package:mobiarmy_flutter/features/authentication/application/auth_state_machine.dart';
import 'package:mobiarmy_flutter/features/authentication/data/account_storage.dart';
import 'package:mobiarmy_flutter/features/authentication/data/auth_repository.dart';
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
      state = _machine.connectionLost('Không kết nối được ${server.endpoint}');
    }
  }

  Future<void> login(
    AccountCredentials credentials, {
    bool remember = false,
  }) async {
    if (state.status != AuthStatus.connected) return;
    state = _machine.loginRequested();
    try {
      await _repository.login(credentials);
      if (remember) {
        await ref.read(accountStorageProvider).save(credentials);
      }
    } catch (e) {
      state = _machine.connectionLost('Gửi yêu cầu đăng nhập thất bại: $e');
    }
  }

  Future<AccountCredentials?> loadRememberedCredentials() =>
      ref.read(accountStorageProvider).load();

  Future<void> disconnect() async {
    try {
      if (_session.isConnected) await _repository.sendQuit();
    } catch (_) {
      // Server may already be gone; dispose below is authoritative.
    }
    await _session.dispose();
    state = _machine.logout();
  }

  // ------------------------------------------------------------- transport

  @override
  void onHandshakeComplete() {
    state = _machine.handshakeComplete();
  }

  @override
  void onDisconnected(String? reason) {
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
      state = _machine.loginSucceeded(session);
    } catch (e, stack) {
      _logger.severe('loadInfoAll parse failed', e, stack);
      state = _machine.connectionLost('Phản hồi đăng nhập không hợp lệ');
    }
  }

  void _onLog(Message message) {
    final text = _mapper.decodeLog(message);
    final next = _machine.logReceived(text);
    if (next != state) {
      state = next;
    } else {
      // General server notice outside the auth flow — surface, don't die.
      _logger.info('Server notice: $text');
    }
  }

  void _onIdNotCollision(Message message) {
    // Phase 12/17 ownership: tile ids that ignore terrain collision.
    _logger.info('idNotCollision: ${_mapper.decodeIdNotCollision(message)}');
  }
}

final accountStorageProvider = Provider<AccountStorage>((ref) {
  return InMemoryAccountStorage();
});

final authControllerProvider =
    NotifierProvider<AuthController, AuthenticationState>(AuthController.new);
