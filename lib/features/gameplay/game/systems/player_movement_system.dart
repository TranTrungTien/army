import 'package:flame/components.dart';
import 'package:mobiarmy_flutter/features/gameplay/domain/player/movement_intent.dart';
import 'package:mobiarmy_flutter/features/gameplay/domain/player/player_movement_state.dart';
import 'package:mobiarmy_flutter/features/gameplay/game/army_game.dart';
import 'package:mobiarmy_flutter/features/gameplay/game/player/game_player.dart';
import 'package:mobiarmy_flutter/features/gameplay/game/player/sandbox_character_component.dart';

class PlayerMovementSystem extends Component with HasGameReference<ArmyGame> {
  static const double walkSpeed = 60.0;
  static const double staminaConsumption = 25.0; // matches legacy feel
  static const int maxSlopeClimb = 4;

  @override
  void update(double dt) {
    super.update(dt);
    final terrain = game.terrain;
    if (terrain == null) return;

    final input = game.inputController.state;

    // 1. Bridge Input to Intent (for local sandbox or active turn player)
    final localPlayer = game.players[0] ?? game.players[game.activePlayerId];
    if (localPlayer != null) {
      MovementDirection dir = MovementDirection.none;
      if (input.movingLeft) {
        dir = MovementDirection.left;
      } else if (input.movingRight) dir = MovementDirection.right;

      localPlayer.intent = MovementIntent(direction: dir);
    }

    final activePlayer = game.players[game.activePlayerId ?? 0];
    if (activePlayer is SandboxCharacterComponent) {
      activePlayer.aimAngle = input.angle;
    }

    // 2. Process Movement based on Intents
    for (final player in game.players.values) {
      _processPlayerMovement(player, dt);
    }
  }

  void _processPlayerMovement(GamePlayer player, double dt) {
    final terrain = game.terrain;
    if (terrain == null) return;

    var movement = player.movement;
    if (movement.kind == PlayerMovementKind.dead ||
        movement.kind == PlayerMovementKind.frozen) {
      return;
    }

    final intent = player.intent;
    double dx = 0;
    if (intent.direction == MovementDirection.left) dx = -1;
    if (intent.direction == MovementDirection.right) dx = 1;

    if (dx != 0 && movement.isOnGround && movement.stamina > 0) {
      final deltaX = dx * walkSpeed * dt;
      final nextX = player.x + deltaX;

      // Slope climbing: check if we need to step up
      double nextY = player.y;
      bool blocked = false;

      if (terrain.isSolid(nextX.toInt(), nextY.toInt())) {
        blocked = true;
        // Try to climb up
        for (int i = 1; i <= maxSlopeClimb; i++) {
          if (!terrain.isSolid(nextX.toInt(), (nextY - i).toInt())) {
            nextY -= i;
            blocked = false;
            break;
          }
        }
      }

      if (!blocked) {
        final newStamina = (movement.stamina - staminaConsumption * dt).clamp(0.0, 100.0);

        player.x = nextX;
        player.y = nextY;

        player.movement = movement.copyWith(
          velocity: Vector2(deltaX / dt, 0),
          stamina: newStamina,
          kind: PlayerMovementKind.walking,
        );
      } else {
        // Blocked by wall
        player.movement = movement.copyWith(
          velocity: Vector2.zero(),
          kind: PlayerMovementKind.idle,
        );
      }
    } else {
      // No horizontal intent or no stamina
      final velocity = movement.velocity;
      velocity.x = 0;
      player.movement = movement.copyWith(
        velocity: velocity,
        kind: movement.isOnGround
            ? PlayerMovementKind.idle
            : PlayerMovementKind.falling,
      );
    }
  }
}
