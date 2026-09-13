import 'package:flame/extensions.dart';

enum PlayerMovementKind {
  idle,
  walking,
  falling,
  hurt,
  dead,
  frozen,
  teleport,
}

class PlayerMovementState {
  PlayerMovementState({
    this.kind = PlayerMovementKind.idle,
    Vector2? velocity,
    this.isOnGround = false,
    this.stamina = 100.0,
  }) : velocity = velocity ?? Vector2.zero();

  final PlayerMovementKind kind;
  final Vector2 velocity;
  final bool isOnGround;
  final double stamina;

  PlayerMovementState copyWith({
    PlayerMovementKind? kind,
    Vector2? velocity,
    bool? isOnGround,
    double? stamina,
  }) {
    return PlayerMovementState(
      kind: kind ?? this.kind,
      velocity: velocity ?? this.velocity,
      isOnGround: isOnGround ?? this.isOnGround,
      stamina: stamina ?? this.stamina,
    );
  }
}
