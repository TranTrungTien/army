import 'package:flame/components.dart';
import 'package:flutter/material.dart';

class DamageTextComponent extends PositionComponent {
  DamageTextComponent({
    required Vector2 position,
    required this.damage,
  }) : super(position: position, priority: 50);

  final int damage;
  double _elapsed = 0;
  static const double duration = 1.0;
  static const double upwardSpeed = 40.0;

  @override
  void update(double dt) {
    super.update(dt);
    _elapsed += dt;
    position.y -= upwardSpeed * dt;
    if (_elapsed >= duration) {
      removeFromParent();
    }
  }

  @override
  void render(Canvas canvas) {
    final opacity = (1.0 - _elapsed / duration).clamp(0.0, 1.0);
    final textPainter = TextPainter(
      text: TextSpan(
        text: '-$damage',
        style: TextStyle(
          color: Colors.red.withOpacity(opacity),
          fontSize: 16,
          fontWeight: FontWeight.bold,
          shadows: const [Shadow(blurRadius: 2, color: Colors.black)],
        ),
      ),
      textDirection: TextDirection.ltr,
    );
    textPainter.layout();
    textPainter.paint(canvas, Offset(-textPainter.width / 2, -textPainter.height / 2));
  }
}
