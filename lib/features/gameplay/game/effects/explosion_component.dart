import 'package:flame/components.dart';
import 'package:flutter/material.dart';

class ExplosionComponent extends PositionComponent with HasGameRef {
  ExplosionComponent({
    required Vector2 position,
    required this.radius,
  }) : super(position: position, anchor: Anchor.center, priority: 30);

  final double radius;
  double _elapsed = 0;
  static const double duration = 0.4;

  @override
  void update(double dt) {
    super.update(dt);
    _elapsed += dt;
    if (_elapsed >= duration) {
      removeFromParent();
    }
  }

  @override
  void render(Canvas canvas) {
    final progress = _elapsed / duration;
    final currentRadius = radius * (0.5 + 0.5 * progress);
    final opacity = (1.0 - progress).clamp(0.0, 1.0);

    final paint = Paint()
      ..color = Colors.orange.withOpacity(opacity)
      ..style = PaintingStyle.fill;

    canvas.drawCircle(Offset.zero, currentRadius, paint);

    final corePaint = Paint()
      ..color = Colors.yellow.withOpacity(opacity)
      ..style = PaintingStyle.fill;

    canvas.drawCircle(Offset.zero, currentRadius * 0.6, corePaint);
  }
}
