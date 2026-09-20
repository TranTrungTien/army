import 'package:flame/components.dart';
import 'package:mobiarmy_flutter/features/gameplay/domain/player/player_movement_state.dart';
import 'package:mobiarmy_flutter/features/gameplay/game/army_game.dart';
import 'package:mobiarmy_flutter/features/gameplay/game/systems/ground_probe.dart';

class PlayerCollisionSystem extends Component with HasGameReference<ArmyGame> {
  static const double gravity = 400.0;
  static const double terminalVelocity = 600.0;
  static const int groundSnapDistance = 5;

  @override
  void update(double dt) {
    super.update(dt);
    final terrain = game.terrain;
    if (terrain == null) return;

    final probe = GroundProbe(terrain);

    for (final player in game.players.values) {
      var movement = player.movement;
      if (movement.kind == PlayerMovementKind.dead ||
          movement.kind == PlayerMovementKind.teleport) {
        continue;
      }

      // 1. Apply Gravity if not on ground
      if (!movement.isOnGround) {
        final velocity = movement.velocity;
        velocity.y += gravity * dt;
        if (velocity.y > terminalVelocity) {
          velocity.y = terminalVelocity;
        }
        player.movement = movement.copyWith(velocity: velocity);
        movement = player.movement;

        final nextY = player.y + movement.velocity.y * dt;

        // Check for landing
        if (probe.isSolid(player.x, nextY)) {
          final groundY = probe.findGroundBelow(player.x, player.y);
          if (groundY != null) {
            player.y = groundY;
            player.movement = movement.copyWith(
              velocity: Vector2(movement.velocity.x, 0),
              isOnGround: true,
              kind: movement.velocity.x.abs() > 0.1
                  ? PlayerMovementKind.walking
                  : PlayerMovementKind.idle,
            );
          }
        } else {
          player.y = nextY;
        }
      } else {
        // 2. On ground: snap to ground (handle stepping down slopes)
        final groundY = probe.findGroundBelow(player.x, player.y - 2, maxDistance: groundSnapDistance.toDouble() + 2);

        if (groundY != null) {
          player.y = groundY;
          // Ensure state is correct
          if (movement.kind == PlayerMovementKind.falling) {
             player.movement = movement.copyWith(
               isOnGround: true,
               kind: PlayerMovementKind.idle,
               velocity: Vector2(movement.velocity.x, 0),
             );
          }
        } else {
          // No ground found nearby, start falling
          player.movement = movement.copyWith(
            isOnGround: false,
            kind: PlayerMovementKind.falling,
            velocity: Vector2(movement.velocity.x, 0),
          );
        }
      }

      // 3. Map Boundaries & Death zones
      if (player.x < 0) player.x = 0;
      if (player.x > terrain.width) player.x = terrain.width.toDouble();

      final waterY = game.map?.environment.waterY;
      if (waterY != null && waterY > 0 && player.y > waterY) {
        if (movement.kind != PlayerMovementKind.dead) {
          player.movement = movement.copyWith(
            kind: PlayerMovementKind.dead,
            velocity: Vector2.zero(),
          );
        }
      }

      // Fall out of map (death)
      if (player.y > terrain.height + 64) {
        if (movement.kind != PlayerMovementKind.dead) {
          player.movement = movement.copyWith(
            kind: PlayerMovementKind.dead,
            velocity: Vector2.zero(),
          );
        }
      }
    }
  }
}
