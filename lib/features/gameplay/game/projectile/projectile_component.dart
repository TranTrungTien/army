import 'dart:ui';

import 'package:flame/components.dart';
import 'package:mobiarmy_flutter/features/gameplay/game/effects/smoke_particle.dart';
import 'package:mobiarmy_flutter/features/gameplay/game/projectile/projectile_trajectory.dart';

/// Plays back a server-computed (or offline-simulated) trajectory frame list.
class ProjectileComponent extends PositionComponent {
  ProjectileComponent({
    required this.trajectory,
    this.onImpact,
    this.stepsPerSecond = 60,
  }) : super(anchor: Anchor.center, priority: 20);

  final ProjectileTrajectory trajectory;
  final void Function(int x, int y, int radius)? onImpact;
  final double stepsPerSecond;

  int _frame = 0;
  double _accumulator = 0;

  @override
  Future<void> onLoad() async {
    await super.onLoad();
    if (trajectory.frames.isNotEmpty) {
      final first = trajectory.frames.first;
      position.setValues(first.x.toDouble(), first.y.toDouble());
    }
  }

  @override
  void update(double dt) {
    super.update(dt);
    _accumulator += dt * stepsPerSecond;
    while (_accumulator >= 1) {
      _accumulator -= 1;
      _frame++;
      if (_frame >= trajectory.frames.length) {
        final frames = trajectory.frames;
        if (frames.isNotEmpty) {
          onImpact?.call(
            frames.last.x,
            frames.last.y,
            trajectory.explosionRadius,
          );
        }
        removeFromParent();
        return;
      }
      final frame = trajectory.frames[_frame];
      position.setValues(frame.x.toDouble(), frame.y.toDouble());

      // Spawn smoke trail
      parent?.add(SmokeParticle(position: position.clone()));
    }
  }

  @override
  void render(Canvas canvas) {
    // TODO(phase-3): replace with the real bullet sprite from assets.
    canvas.drawCircle(Offset.zero, 3, Paint()..color = const Color(0xFFFFEB3B));
  }
}
