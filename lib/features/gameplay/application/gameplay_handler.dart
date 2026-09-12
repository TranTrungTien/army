import 'package:logging/logging.dart';
import 'package:mobiarmy_flutter/core/network/command/commands.dart';
import 'package:mobiarmy_flutter/core/network/dispatcher/message_dispatcher.dart';
import 'package:mobiarmy_flutter/core/network/protocol/message.dart';

import '../game/army_game.dart';
import '../game/projectile/projectile_trajectory.dart';

class GameplayHandler {
  GameplayHandler(this._dispatcher);
  final MessageDispatcher _dispatcher;
  final _logger = Logger('GameplayHandler');

  ArmyGame? _game;

  void attachGame(ArmyGame game) {
    _game = game;
  }

  void detachGame() {
    _game = null;
  }

  void init() {
    _dispatcher.register(Commands.shoot, _handleShoot);
    _dispatcher.register(Commands.move, _handleMove);
    _dispatcher.register(Commands.setTurn, _handleSetTurn);
  }

  void _handleSetTurn(Message message) {
    final reader = message.reader();
    final nextPlayer = reader.readByte();
    _logger.info('Next turn: player $nextPlayer');
    // TODO: Update HUD and active player marker
  }

  void _handleShoot(Message message) {
    final reader = message.reader();
    final typeShoot = reader.readByte();
    final isPow = reader.readByte();
    final playerIndex = reader.readByte();
    final bulletId = reader.readByte();
    final gunX = reader.readShort();
    final gunY = reader.readShort();
    final angle = reader.readShort();

    // ... handle special bullets ...

    final nShoot = reader.readByte();
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
    }

    _logger.info(
      'Received shoot message for player $playerIndex, $numBullets bullets',
    );

    for (final trajectory in allTrajectories) {
      _game?.spawnProjectile(trajectory);
    }
  }

  void _handleMove(Message message) {
    final reader = message.reader();
    final whoMove = reader.readByte();
    final x = reader.readShort();
    final y = reader.readShort();
    _logger.info('Player $whoMove moved to ($x, $y)');

    _game?.players[whoMove]?.moveTo(x.toDouble(), y.toDouble());
  }
}
