import 'package:flame/components.dart';
import '../army_game.dart';
import '../../domain/player/player_movement_state.dart';

class PlayerMovementSystem extends Component with HasGameReference<ArmyGame> {
  static const double walkSpeed = 60.0;
  static const double staminaConsumption = 20.0; // per second

  @override
  void update(double dt) {
    super.update(dt);
    final input = game.inputController.state;
    
    // For local sandbox, we assume we control the "active" player.
    // In online mode, this will be handled by packets.
    // For now, let's find the player at index 0 or similar.
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
      
      final newStamina = (movement.stamina - staminaConsumption * dt).clamp(0.0, 100.0);
      
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
        kind: movement.isOnGround ? PlayerMovementKind.idle : PlayerMovementKind.falling,
      );
    }
  }
}
