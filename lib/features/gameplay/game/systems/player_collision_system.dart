import 'package:flame/components.dart';
import '../army_game.dart';
import 'ground_probe.dart';
import '../../domain/player/player_movement_state.dart';

class PlayerCollisionSystem extends Component with HasGameReference<ArmyGame> {
  static const double gravity = 400.0;
  static const double terminalVelocity = 600.0;

  @override
  void update(double dt) {
    super.update(dt);
    final terrain = game.terrain;
    if (terrain == null) return;

    final probe = GroundProbe(terrain);

    for (final player in game.players.values) {
      var movement = player.movement;
      if (movement.kind == PlayerMovementKind.dead) continue;

      // Apply gravity if not on ground
      if (!movement.isOnGround) {
        final velocity = movement.velocity;
        velocity.y += gravity * dt;
        if (velocity.y > terminalVelocity) {
          velocity.y = terminalVelocity;
        }
        player.movement = movement.copyWith(velocity: velocity);
      }

      // Update position based on velocity
      final nextY = player.y + movement.velocity.y * dt;
      
      // Check collision
      if (probe.isSolid(player.x, nextY)) {
        // Snap to ground
        final groundY = probe.findGroundBelow(player.x, player.y);
        if (groundY != null) {
          player.y = groundY;
          player.movement = movement.copyWith(
            velocity: Vector2(movement.velocity.x, 0),
            isOnGround: true,
            kind: movement.velocity.x != 0 ? PlayerMovementKind.walking : PlayerMovementKind.idle,
          );
        }
      } else {
        player.y = nextY;
        if (movement.velocity.y > 0) {
          player.movement = movement.copyWith(
            isOnGround: false,
            kind: PlayerMovementKind.falling,
          );
        }
      }

      // Clamp to map boundaries
      if (player.x < 0) player.x = 0;
      if (player.x > terrain.width) player.x = terrain.width.toDouble();
      if (player.y > terrain.height + 100) {
         // Player fell into water/void
         player.movement = movement.copyWith(kind: PlayerMovementKind.dead);
      }
    }
  }
}
