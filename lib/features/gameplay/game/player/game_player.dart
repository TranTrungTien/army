import 'package:flame/components.dart';
import 'package:mobiarmy_flutter/features/gameplay/domain/player/player_movement_state.dart';

/// Common contract for anything controllable in the sandbox, so that both the
/// placeholder sandbox character and the real [CharacterComponent] can be
/// driven by PlayerMovementSystem / PlayerCollisionSystem.
abstract base class GamePlayer extends PositionComponent {
  PlayerMovementState get movement;
  set movement(PlayerMovementState value);
  void moveTo(double x, double y);
}
