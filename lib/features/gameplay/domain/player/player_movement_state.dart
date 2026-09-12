import 'package:flame/extensions.dart';

enum PlayerMovementKind {
  idle,
  walking,
  falling,
  dead,
}

class PlayerMovementState {
  const PlayerMovementState({
    this.kind = PlayerMovementKind.idle,
    this.velocity = Vector2.zero,
    this.isOnGround = false,
    this.stamina = 100.0,
  });

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
