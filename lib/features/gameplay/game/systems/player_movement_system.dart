import 'package:flame/components.dart';
import 'package:mobiarmy_flutter/features/gameplay/domain/player/player_movement_state.dart';
import 'package:mobiarmy_flutter/features/gameplay/game/army_game.dart';

class PlayerMovementSystem extends Component with HasGameReference<ArmyGame> {
  static const double walkSpeed = 60.0;
  static const double staminaConsumption = 20.0; // per second

  @override
  void update(double dt) {
    super.update(dt);
    final input = game.inputController.state;

    // Sandbox: local player controls player 0. Online mode replaces this
    // with MovementIntent driven by command 21 packets.
    final myPlayer = game.players[0];
    if (myPlayer == null) return;

    var movement = myPlayer.movement;
    if (movement.kind == PlayerMovementKind.dead) return;

    double dx = 0;
    if (input.movingLeft) dx -= 1;
    if (input.movingRight) dx += 1;

    if (dx != 0 && movement.isOnGround && movement.stamina > 0) {
      final velocity = movement.velocity;
      velocity.x = dx * walkSpeed;

      final newStamina = (movement.stamina - staminaConsumption * dt).clamp(
        0.0,
        100.0,
      );

      myPlayer.x += velocity.x * dt;
      myPlayer.movement = movement.copyWith(
        velocity: velocity,
        stamina: newStamina,
        kind: PlayerMovementKind.walking,
      );
    } else {
      final velocity = movement.velocity;
      velocity.x = 0;
      myPlayer.movement = movement.copyWith(
        velocity: velocity,
        kind: movement.isOnGround
            ? PlayerMovementKind.idle
            : PlayerMovementKind.falling,
      );
    }
  }
}
