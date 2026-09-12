import 'package:flame/components.dart';
import 'package:flutter/material.dart';
import 'projectile_trajectory.dart';

class ProjectileComponent extends PositionComponent with HasGameRef {
  ProjectileComponent({
    required this.trajectory,
  }) : super(anchor: Anchor.center);

  final ProjectileTrajectory trajectory;
  int _currentFrame = 0;

  @override
  Future<void> onLoad() async {
    await super.onLoad();
    if (trajectory.frames.isNotEmpty) {
      position.setValues(
        trajectory.frames[0].x.toDouble(),
        trajectory.frames[0].y.toDouble(),
      );
    }
  }

  @override
  void update(double dt) {
    super.update(dt);
    if (_currentFrame < trajectory.frames.length) {
      final frame = trajectory.frames[_currentFrame];
      position.setValues(frame.x.toDouble(), frame.y.toDouble());
      _currentFrame++;
    } else {
      _onExplode();
      removeFromParent();
    }
  }

  void _onExplode() {
    // Notify map of explosion to make hole
    // Trigger explosion animation
  }

  @override
  void render(Canvas canvas) {
    // TODO: Use actual bullet sprite from assets
    canvas.drawCircle(Offset.zero, 3, Paint()..color = Colors.yellow);
  }
}
