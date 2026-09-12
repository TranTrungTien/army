class GameplayInputState {
  const GameplayInputState({
    this.angle = 0,
    this.force = 0,
    this.isCharging = false,
    this.movingLeft = false,
    this.movingRight = false,
  });

  final int angle;
  final double force;
  final bool isCharging;
  final bool movingLeft;
  final bool movingRight;

  GameplayInputState copyWith({
    int? angle,
    double? force,
    bool? isCharging,
    bool? movingLeft,
    bool? movingRight,
  }) {
    return GameplayInputState(
      angle: angle ?? this.angle,
      force: force ?? this.force,
      isCharging: isCharging ?? this.isCharging,
      movingLeft: movingLeft ?? this.movingLeft,
      movingRight: movingRight ?? this.movingRight,
    );
  }
}
