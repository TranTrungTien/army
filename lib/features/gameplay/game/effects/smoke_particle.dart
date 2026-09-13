import 'package:flame/components.dart';
import 'package:flutter/material.dart';

class SmokeParticle extends PositionComponent {
  SmokeParticle({
    required Vector2 position,
    this.lifespan = 0.5,
  }) : super(position: position, size: Vector2.all(4), anchor: Anchor.center, priority: 15);

  final double lifespan;
  double _elapsed = 0;

  @override
  void update(double dt) {
    super.update(dt);
    _elapsed += dt;
    if (_elapsed >= lifespan) {
      removeFromParent();
    }
  }

  @override
  void render(Canvas canvas) {
    final progress = _elapsed / lifespan;
    final opacity = (0.6 * (1.0 - progress)).clamp(0.0, 1.0);
    final size = 4.0 * (1.0 + progress);

    final paint = Paint()..color = Colors.white.withOpacity(opacity);
    canvas.drawCircle(Offset.zero, size / 2, paint);
  }
}
