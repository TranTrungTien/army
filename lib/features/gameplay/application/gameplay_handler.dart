import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logging/logging.dart';
import 'package:mobiarmy_flutter/core/network/command/commands.dart';
import 'package:mobiarmy_flutter/core/network/dispatcher/message_dispatcher.dart';
import 'package:mobiarmy_flutter/core/network/protocol/message.dart';
import 'package:mobiarmy_flutter/features/gameplay/application/gameplay_controller.dart';
import 'package:mobiarmy_flutter/features/gameplay/data/gameplay_packet_mapper.dart';
import 'package:mobiarmy_flutter/features/gameplay/game/systems/combat_system.dart';

import '../game/army_game.dart';

class GameplayHandler {
  GameplayHandler(this._dispatcher, this._ref);
  final MessageDispatcher _dispatcher;
  final Ref _ref;
  final _logger = Logger('GameplayHandler');
  final _mapper = const GameplayPacketMapper();

  ArmyGame? _game;

  void attachGame(ArmyGame game) {
    _game = game;
  }

  void detachGame() {
    _game = null;
  }

  void init() {
    _dispatcher.register(Commands.startGame, _handleStartGame);
    _dispatcher.register(Commands.shoot, _handleShoot);
    _dispatcher.register(Commands.move, _handleMove);
    _dispatcher.register(Commands.setTurn, _handleSetTurn);
    _dispatcher.register(Commands.setWind, _handleSetWind);
    _dispatcher.register(Commands.shootResult, _handleShootResult);
    _dispatcher.register(Commands.setXy, _handleUpdateXy);
    _dispatcher.register(Commands.leaveRoomWait, _handlePlayerLeave);
  }

  void _handleStartGame(Message message) {
    _logger.info('Game Started packet received by handler');
    Future.microtask(() {
      final matchState = _ref.read(gameplayControllerProvider);
      if (matchState != null && _game != null) {
        _game!.setupMatch(matchState);
      }
    });
  }

  void _handleShootResult(Message message) {
    try {
      final hits = _mapper.decodeShootResult(message);
      for (final hit in hits) {
        _game?.children.query<CombatSystem>().firstOrNull?.applyDamage(
              hit.playerId,
              hit.damage,
              hit.newHp,
              hit.isDead,
            );
      }
    } catch (e) {
      _logger.warning('handleShootResult failed: $e');
    }
  }

  void _handleSetTurn(Message message) {
    try {
      final (nextPlayerId, turnTime) = _mapper.decodeNextTurn(message);
      _logger.info('Next turn: player $nextPlayerId, time: $turnTime');
      if (_game != null) {
        _game!.activePlayerId = nextPlayerId;
        _game!.inputController.reset();
      }
    } catch (e) {
      _logger.warning('handleSetTurn failed: $e');
    }
  }

  void _handleSetWind(Message message) {
    try {
      final (windX, windY) = _mapper.decodeWind(message);
      _logger.info('Wind changed: ($windX, $windY)');
      if (_game != null) {
        _game!.windX = windX;
        _game!.windY = windY;
      }
    } catch (e) {
      _logger.warning('handleSetWind failed: $e');
    }
  }

  void _handleShoot(Message message) {
    final reader = message.reader();
    final typeShoot = reader.readByte();
    reader.readByte();
    final playerIndex = reader.readByte();
    final bulletId = reader.readByte();
    reader.readShort();
    reader.readShort();
    reader.readShort();

    // ... handle special bullets ...

    reader.readByte();
    final numBullets = reader.readByte();

    final allTrajectories = <ProjectileTrajectory>[];

    for (int i = 0; i < numBullets; i++) {
      final numFrames = reader.readShort();
      final frames = <TrajectoryFrame>[];

      int lastX = 0;
      int lastY = 0;

      for (int j = 0; j < numFrames; j++) {
        if (j == 0 || typeShoot == 1) {
          lastX = reader.readShort();
          lastY = reader.readShort();
        } else {
          lastX += reader.readByte();
          lastY += reader.readByte();
        }
        frames.add(TrajectoryFrame(x: lastX, y: lastY));
      }
      allTrajectories.add(
        ProjectileTrajectory(bulletId: bulletId, frames: frames),
      );

      for (final trajectory in data.trajectories) {
        _game?.spawnProjectile(trajectory);
      }
    } catch (e) {
      _logger.warning('handleShoot failed: $e');
    }
  }

  void _handleMove(Message message) {
    try {
      final (whoMoveId, type, x, y) = _mapper.decodeMove(message);
      _logger.info('Player $whoMoveId moved to ($x, $y) with type $type');
      _game?.players[whoMoveId]?.moveTo(x.toDouble(), y.toDouble());
    } catch (e) {
      _logger.warning('handleMove failed: $e');
    }
  }

  void _handleUpdateXy(Message message) {
    try {
      final (playerId, x, y) = _mapper.decodeUpdateXy(message);
      _logger.info('Player $playerId updated XY to ($x, $y)');
      _game?.players[playerId]?.moveTo(x.toDouble(), y.toDouble());
    } catch (e) {
      _logger.warning('handleUpdateXy failed: $e');
    }
  }

  void _handlePlayerLeave(Message message) {
    try {
      final playerId = _mapper.decodeLeave(message);
      _logger.info('Player $playerId left the game engine');
      final player = _game?.players.remove(playerId);
      player?.removeFromParent();
    } catch (e) {
      _logger.warning('handlePlayerLeave failed: $e');
    }
  }
}
