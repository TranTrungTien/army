import 'package:mobiarmy_flutter/core/legacy_math/legacy_trigonometry.dart';
import 'bullet_simulator.dart';
import 'projectile_trajectory.dart';

class TrajectorySimulator {
  static List<ProjectileTrajectory> simulate({
    required int bulletId,
    required int gunX,
    required int gunY,
    required int width,
    required int height,
    required int ang,
    required int force,
    required int windX,
    required int windY,
    required int mapWidth,
    required int mapHeight,
    required bool Function(int x, int y) isCollision,
    bool isPow = false,
  }) {
    final trajectories = <ProjectileTrajectory>[];

    // Initial position and velocity
    int bx = gunX + ((width - 4) * LegacyTrigonometry.cos(ang) >> 10);
    int by =
        gunY -
        (height ~/ 2) -
        ((height - 4) * LegacyTrigonometry.sin(ang) >> 10);
    int vx = force * LegacyTrigonometry.cos(ang) >> 10;
    int vy = -(force * LegacyTrigonometry.sin(ang) >> 10);

    // Simplified simulation based on Gun.java for Gunner (bulletId 0)
    // In a full implementation, this switch would cover all bullet types
    final ax100 = (windX * 80) ~/ 100;
    final ay100 = (windY * 80) ~/ 100;
    const g100 = 100;

    final bullet = BulletSimulator(
      bulletId: bulletId,
      x: bx,
      y: by,
      vx: vx,
      vy: vy,
      ax100: ax100,
      ay100: ay100,
      g100: g100,
    );

    while (!bullet.collect && bullet.frame < 1000) {
      bullet.nextXY(mapWidth, mapHeight, isCollision);
    }

    trajectories.add(
      ProjectileTrajectory(bulletId: bulletId, frames: bullet.frames),
    );

    return trajectories;
  }
}
