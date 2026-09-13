enum MovementDirection { none, left, right }

class MovementIntent {
  const MovementIntent({
    this.direction = MovementDirection.none,
    this.jump = false,
  });

  final MovementDirection direction;
  final bool jump;

  static const none = MovementIntent();
}
