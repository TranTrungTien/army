import 'package:flame/components.dart';
import 'package:mobiarmy_flutter/features/gameplay/domain/player/player_movement_state.dart';
import 'package:mobiarmy_flutter/features/gameplay/domain/player/movement_intent.dart';

/// Common contract for anything controllable in the sandbox, so that both the
/// placeholder sandbox character and the real [CharacterComponent] can be
/// driven by PlayerMovementSystem / PlayerCollisionSystem.
abstract base class GamePlayer extends PositionComponent {
  PlayerMovementState get movement;
  set movement(PlayerMovementState value);
  void moveTo(double x, double y);
  MovementIntent get intent;
  set intent(MovementIntent value);
  int get hp;
  set hp(int value);
  int get maxHp;
  set maxHp(int value);
}
