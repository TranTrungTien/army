import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logging/logging.dart';
import 'package:mobiarmy_flutter/core/network/command/commands.dart';
import 'package:mobiarmy_flutter/core/network/dispatcher/message_dispatcher.dart';
import 'package:mobiarmy_flutter/core/network/network_provider.dart';
import 'package:mobiarmy_flutter/core/network/protocol/message.dart';
import 'package:mobiarmy_flutter/features/authentication/application/auth_controller.dart';
import 'package:mobiarmy_flutter/features/gameplay/application/chat_controller.dart';
import 'package:mobiarmy_flutter/features/gameplay/data/gameplay_packet_mapper.dart';
import 'package:mobiarmy_flutter/features/gameplay/data/gameplay_repository.dart';
import 'package:mobiarmy_flutter/features/gameplay/domain/match_state.dart';
import 'package:mobiarmy_flutter/features/room/application/room_controller.dart';

class GameplayController extends Notifier<MatchState?> {
  final _logger = Logger('GameplayController');

  late GameplayRepository _repository;
  late GameplayPacketMapper _mapper;
  Timer? _turnTimer;

  @override
  MatchState? build() {
    _mapper = const GameplayPacketMapper();
    _repository = GameplayRepository(ref.watch(tcpSessionProvider));

    final dispatcher = ref.watch(messageDispatcherProvider);
    _registerHandlers(dispatcher);

    ref.onDispose(() {
      _unregisterHandlers(dispatcher);
      _turnTimer?.cancel();
    });

    return null;
  }

  void _registerHandlers(MessageDispatcher dispatcher) {
    dispatcher
      ..register(Commands.startGame, _onStartGame)
      ..register(Commands.setTurn, _onNextTurn)
      ..register(Commands.setWind, _onWind)
      ..register(Commands.move, _onMoveSync)
      ..register(Commands.setXy, _onUpdateXy)
      ..register(Commands.shoot, _onShootSync)
      ..register(Commands.shootResult, _onShootResult)
      ..register(Commands.chat, _onChat)
      ..register(Commands.skipTurn, _onSkipTurn)
      ..register(Commands.useItem, _onUseItem)
      ..register(Commands.getBoss, _onBossSpawn)
      ..register(Commands.bonusMoney, _onBonusMoney)
      ..register(Commands.leaveRoomWait, _onPlayerLeave)
      ..register(Commands.finishMatch, _onFinishMatch);
  }

  void _unregisterHandlers(MessageDispatcher dispatcher) {
    dispatcher
      ..unregister(Commands.startGame, _onStartGame)
      ..unregister(Commands.setTurn, _onNextTurn)
      ..unregister(Commands.setWind, _onWind)
      ..unregister(Commands.move, _onMoveSync)
      ..unregister(Commands.setXy, _onUpdateXy)
      ..unregister(Commands.shoot, _onShootSync)
      ..unregister(Commands.shootResult, _onShootResult)
      ..unregister(Commands.chat, _onChat)
      ..unregister(Commands.skipTurn, _onSkipTurn)
      ..unregister(Commands.useItem, _onUseItem)
      ..unregister(Commands.leaveRoomWait, _onPlayerLeave)
      ..unregister(Commands.finishMatch, _onFinishMatch);
  }

  // ---------------------------------------------------------------- commands

  Future<void> move(int type, int x, int y) async {
    // Local update first? No, server authoritative.
    await _repository.sendMove(type, x, y);
  }

  Future<void> shoot(int angle, int force, int force2, int nShot) async {
    await _repository.sendShoot(angle, force, force2, nShot);
  }

  Future<void> useItem(int itemId) async {
    await _repository.sendUseItem(itemId);
  }

  Future<void> leaveMatch() async {
    await _repository.sendLeave();
    _turnTimer?.cancel();
    state = null;
  }

  // --------------------------------------------------------------- packets

  void _onStartGame(Message message) {
    final roomState = ref.read(roomControllerProvider);
    if (roomState == null) return;

    try {
      state = _mapper.decodeStartGame(message, roomState.players);
      _logger.info('Match started on map ${state?.mapId}');
    } catch (e, stack) {
      _logger.severe('startGame parse failed', e, stack);
    }
  }

  void _onNextTurn(Message message) {
    if (state == null) return;
    try {
      final (playerId, time) = _mapper.decodeNextTurn(message);
      state = state!.copyWith(
        currentTurnPlayerId: playerId,
        turnTimeSeconds: time,
      );

      _turnTimer?.cancel();
      _turnTimer = Timer.periodic(const Duration(seconds: 1), (timer) {
        if (state == null || state!.turnTimeSeconds <= 0) {
          timer.cancel();
          return;
        }
        state = state!.copyWith(turnTimeSeconds: state!.turnTimeSeconds - 1);
      });
    } catch (e) {
      _logger.warning('nextTurn parse failed: $e');
    }
  }

  void _onWind(Message message) {
    if (state == null) return;
    try {
      final (wx, wy) = _mapper.decodeWind(message);
      state = state!.copyWith(windX: wx, windY: wy);
      ref.read(chatControllerProvider.notifier).addMessage(
            'System',
            'Wind changed to $wx',
          );
    } catch (e) {
      _logger.warning('setWind parse failed: $e');
    }
  }

  void _onMoveSync(Message message) {
    if (state == null) return;
    try {
      final (playerId, type, x, y) = _mapper.decodeMove(message);
      final player = state!.players[playerId];
      if (player == null) return;

      final players = Map<int, MatchPlayer>.from(state!.players);
      players[playerId] = player.copyWith(x: x, y: y);
      state = state!.copyWith(players: players);

      // Notify Flame Engine via side effect or stream if needed
      _logger.fine('Player $playerId moved to $x, $y');
    } catch (e) {
      _logger.warning('moveSync parse failed: $e');
    }
  }

  void _onUpdateXy(Message message) {
    if (state == null) return;
    try {
      final (playerId, x, y) = _mapper.decodeUpdateXy(message);
      final player = state!.players[playerId];
      if (player == null) return;

      final players = Map<int, MatchPlayer>.from(state!.players);
      players[playerId] = player.copyWith(x: x, y: y);
      state = state!.copyWith(players: players);
    } catch (e) {
      _logger.warning('updateXy parse failed: $e');
    }
  }

  void _onShootSync(Message message) {
    if (state == null) return;
    try {
      final shootData = _mapper.decodeShoot(message);
      state = state!.copyWith(lastShoot: shootData);
    } catch (e, stack) {
      _logger.severe('shootSync parse failed', e, stack);
    }
  }

  void _onShootResult(Message message) {
    if (state == null) return;
    try {
      final hits = _mapper.decodeShootResult(message);
      final players = Map<int, MatchPlayer>.from(state!.players);
      for (final hit in hits) {
        final p = players[hit.playerId];
        if (p != null) {
          players[hit.playerId] = p.copyWith(
            hp: hit.newHp,
            isDead: hit.isDead,
          );
        }
      }
      state = state!.copyWith(players: players);
    } catch (e) {
      _logger.warning('shootResult parse failed: $e');
    }
  }

  void _onChat(Message message) {
    try {
      final r = message.reader();
      final playerId = r.readInt();
      final text = r.readUTF();
      final sender = state?.players[playerId]?.base.name ?? 'System';
      ref.read(chatControllerProvider.notifier).addMessage(sender, text);
    } catch (_) {}
  }

  void _onSkipTurn(Message message) {
    try {
      final playerId = _mapper.decodeSkipTurn(message);
      _logger.info('Player $playerId skipped their turn');
    } catch (_) {}
  }

  void _onUseItem(Message message) {
    try {
      final (playerId, itemId) = _mapper.decodeUseItem(message);
      _logger.info('Player $playerId used item $itemId');
    } catch (e) {
      _logger.warning('useItem parse failed: $e');
    }
  }

  void _onBossSpawn(Message message) {
    if (state == null) return;
    try {
      final newPlayers = _mapper.decodeAddPlayers(message);
      final players = Map<int, MatchPlayer>.from(state!.players);
      for (final p in newPlayers) {
        players[p.base.id] = p;
        _logger.info('Boss spawned: ${p.base.name} at ${p.x}, ${p.y}');
      }
      state = state!.copyWith(players: players);
    } catch (e) {
      _logger.warning('bossSpawn parse failed: $e');
    }
  }

  void _onBonusMoney(Message message) {
    try {
      final (money, reason) = _mapper.decodeBonusMoney(message);
      ref.read(chatControllerProvider.notifier).addMessage(
            'System',
            'Nhận $money xu: $reason',
          );
    } catch (e) {
      _logger.warning('bonusMoney parse failed: $e');
    }
  }

  void _onPlayerLeave(Message message) {
    if (state == null) return;
    try {
      final playerId = _mapper.decodeLeave(message);
      final players = Map<int, MatchPlayer>.from(state!.players);
      players.remove(playerId);
      state = state!.copyWith(players: players);
      _logger.info('Player $playerId left the match');
    } catch (e) {
      _logger.warning('playerLeave parse failed: $e');
    }
  }

  void _onFinishMatch(Message message) {
    if (state == null) return;
    try {
      final result = _mapper.decodeFinishMatch(message);
      state = state!.copyWith(
        isMatchEnded: true,
        matchResult: result,
      );
      _logger.info('Match finished');
    } catch (e) {
      _logger.warning('finishMatch parse failed: $e');
    }
  }

  Future<void> skipTurn() async {
    await _repository.sendSkipTurn();
  }

  bool get isMyTurn {
    final myId = ref.read(authControllerProvider).session?.id;
    return state?.currentTurnPlayerId == myId;
  }
}

final gameplayControllerProvider =
    NotifierProvider<GameplayController, MatchState?>(GameplayController.new);
