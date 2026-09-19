import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logging/logging.dart';
import 'package:mobiarmy_flutter/core/network/command/commands.dart';
import 'package:mobiarmy_flutter/core/network/dispatcher/message_dispatcher.dart';
import 'package:mobiarmy_flutter/core/network/network_provider.dart';
import 'package:mobiarmy_flutter/core/network/protocol/message.dart';
import 'package:mobiarmy_flutter/features/authentication/application/auth_controller.dart';
import 'package:mobiarmy_flutter/features/gameplay/application/chat_controller.dart';
import 'package:mobiarmy_flutter/features/lobby/application/lobby_controller.dart';
import 'package:mobiarmy_flutter/features/lobby/domain/lobby_state.dart';

import 'package:mobiarmy_flutter/features/room/application/room_state_machine.dart';
import 'package:mobiarmy_flutter/features/room/data/room_packet_mapper.dart';
import 'package:mobiarmy_flutter/features/room/data/room_repository.dart';
import 'package:mobiarmy_flutter/features/room/domain/room_session_state.dart';

class RoomController extends Notifier<RoomSessionState?> {
  final _logger = Logger('RoomController');

  late RoomStateMachine _machine;
  late RoomRepository _repository;
  late RoomPacketMapper _mapper;

  @override
  RoomSessionState? build() {
    _machine = RoomStateMachine();
    _mapper = const RoomPacketMapper();
    _repository = RoomRepository(ref.watch(tcpSessionProvider));

    final dispatcher = ref.watch(messageDispatcherProvider);
    _registerHandlers(dispatcher);

    ref.onDispose(() {
      _unregisterHandlers(dispatcher);
    });

    // Check for initial state from Lobby transition
    final lobby = ref.read(lobbyControllerProvider);
    if (lobby.status == LobbyStatus.joined && lobby.initialRoomState != null) {
      _machine.initialized(lobby.initialRoomState!);
    }

    return _machine.state;
  }

  void _registerHandlers(MessageDispatcher dispatcher) {
    dispatcher
      ..register(Commands.joinRoomWait, _onLoadRoomWait)
      ..register(Commands.ready, _onReadySync)
      ..register(Commands.changeTeam, _onTeamSync)
      ..register(Commands.selectMap, _onMapSync)
      ..register(Commands.chat, _onChat)
      ..register(Commands.startGame, _onGameStart)
      ..register(Commands.bet, _onBetSync)
      ..register(Commands.kick, _onKickSync)
      ..register(Commands.leaveRoomWait, _onLeaveSync)
      ..register(Commands.buyGlass, _onGlassSync);
  }

  void _unregisterHandlers(MessageDispatcher dispatcher) {
    dispatcher
      ..unregister(Commands.joinRoomWait, _onLoadRoomWait)
      ..unregister(Commands.ready, _onReadySync)
      ..unregister(Commands.changeTeam, _onTeamSync)
      ..unregister(Commands.selectMap, _onMapSync)
      ..unregister(Commands.chat, _onChat)
      ..unregister(Commands.startGame, _onGameStart)
      ..unregister(Commands.bet, _onBetSync)
      ..unregister(Commands.kick, _onKickSync)
      ..unregister(Commands.leaveRoomWait, _onLeaveSync)
      ..unregister(Commands.buyGlass, _onGlassSync);
  }

  // ---------------------------------------------------------------- commands

  Future<void> toggleReady() => _repository.sendReady();
  Future<void> changeTeam() => _repository.sendChangeTeam();
  Future<void> sendChat(String text) => _repository.sendChat(text);
  Future<void> selectMap(int mapId) => _repository.sendSelectMap(mapId);
  Future<void> startGame() => _repository.sendStartGame();
  Future<void> changeBet(int amount) => _repository.sendBet(amount);
  Future<void> kickPlayer(int playerId) => _repository.sendKick(playerId);
  Future<void> selectGlass(int glassId) => _repository.sendSelectGlass(glassId);

  Future<void> leaveRoom() async {
    await _repository.sendLeave();
    _machine.reset();
    state = null;
  }

  // --------------------------------------------------------------- packets

  void _onLoadRoomWait(Message message) {
    try {
      final roomState = _mapper.decodeLoadRoomWait(message);
      _machine.initialized(roomState);
      state = _machine.state;
    } catch (e, stack) {
      _logger.severe('loadRoomWait parse failed', e, stack);
    }
  }

  void _onReadySync(Message message) {
    try {
      final (playerId, isReady) = _mapper.decodeReady(message);
      _machine.readySynced(playerId, isReady);
      state = _machine.state;
    } catch (e) {
      _logger.warning('readySync parse failed: $e');
    }
  }

  void _onTeamSync(Message message) {
    try {
      final (playerId, teamId) = _mapper.decodeTeam(message);
      _machine.teamSynced(playerId, teamId);
      state = _machine.state;
    } catch (e) {
      _logger.warning('teamSync parse failed: $e');
    }
  }

  void _onMapSync(Message message) {
    try {
      final mapId = message.reader().readByte();
      _machine.mapChanged(mapId);
      state = _machine.state;
    } catch (e) {
      _logger.warning('mapSync parse failed: $e');
    }
  }

  void _onBetSync(Message message) {
    try {
      final bet = _mapper.decodeBet(message);
      _machine.betChanged(bet);
      state = _machine.state;
    } catch (e) {
      _logger.warning('betSync parse failed: $e');
    }
  }

  void _onKickSync(Message message) {
    try {
      final playerId = _mapper.decodeKick(message);
      _machine.playerLeft(playerId);
      state = _machine.state;
    } catch (e) {
      _logger.warning('kickSync parse failed: $e');
    }
  }

  void _onLeaveSync(Message message) {
    try {
      final playerId = message.reader().readInt();
      _machine.playerLeft(playerId);
      state = _machine.state;
    } catch (e) {
      _logger.warning('leaveSync parse failed: $e');
    }
  }

  void _onGlassSync(Message message) {
    try {
      final r = message.reader();
      final playerId = r.readInt();
      final glassId = r.readByte();
      _machine.glassChanged(playerId, glassId);
      state = _machine.state;
    } catch (e) {
      _logger.warning('glassSync parse failed: $e');
    }
  }

  void _onChat(Message message) {
    try {
      final (playerId, text) = _mapper.decodeChat(message);
      final sender = state?.players[playerId]?.name ?? 'System';
      ref.read(chatControllerProvider.notifier).addMessage(sender, text);
    } catch (_) {}
  }

  void _onGameStart(Message message) {
    _logger.info('Game Starting (cmd 20)...');
    // Phase 16 will handle match start navigation
  }

  bool get isMaster {
    final myId = ref.read(authControllerProvider).session?.id;
    return state?.masterId == myId;
  }
}

final roomControllerProvider =
    NotifierProvider<RoomController, RoomSessionState?>(RoomController.new);
