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

    // MobiArmy2 Gun constants (approximate for Phase 17 parity)
    int ax100 = 0;
    int ay100 = 0;
    int g100 = 100;

    switch (bulletId) {
      case 0: // Gunner
        ax100 = (windX * 80) ~/ 100;
        ay100 = (windY * 80) ~/ 100;
        g100 = 100;
        break;
      case 1: // Miss 6
        ax100 = (windX * 90) ~/ 100;
        ay100 = (windY * 90) ~/ 100;
        g100 = 80;
        break;
      case 2: // Apache
        ax100 = (windX * 40) ~/ 100;
        ay100 = (windY * 40) ~/ 100;
        g100 = 120;
        break;
      case 5: // Tazan (Boomerang effect simulated by high wind sensitivity)
        ax100 = (windX * 250) ~/ 100;
        ay100 = (windY * 150) ~/ 100;
        g100 = 90;
        break;
      case 7: // Chicky (Egg)
        ax100 = (windX * 60) ~/ 100;
        ay100 = (windY * 60) ~/ 100;
        g100 = 70;
        break;
      default:
        ax100 = (windX * 80) ~/ 100;
        ay100 = (windY * 80) ~/ 100;
        g100 = 100;
    }

    if (bulletId == 1) { // Miss 6 example
      for (int i = -1; i <= 1; i++) {
        final spreadAng = ang + i * 5;
        final spreadVx = force * LegacyTrigonometry.cos(spreadAng) >> 10;
        final spreadVy = -(force * LegacyTrigonometry.sin(spreadAng) >> 10);

        final bullet = BulletSimulator(
          bulletId: bulletId,
          x: bx,
          y: by,
          vx: spreadVx,
          vy: spreadVy,
          ax100: ax100,
          ay100: ay100,
          g100: g100,
        );
        while (!bullet.collect && bullet.frame < 1000) {
          bullet.nextXY(mapWidth, mapHeight, isCollision);
        }
        trajectories.add(
          ProjectileTrajectory(
            bulletId: bulletId,
            frames: bullet.frames,
            explosionRadius: _getExplosionRadius(bulletId),
          ),
        );
      }
    } else {
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
        ProjectileTrajectory(
          bulletId: bulletId,
          frames: bullet.frames,
          explosionRadius: _getExplosionRadius(bulletId),
        ),
      );
    }

    return trajectories;
  }

  static int _getExplosionRadius(int bulletId) {
    switch (bulletId) {
      case 0: return 18; // Gunner
      case 1: return 15; // Miss 6 (smaller)
      case 2: return 22; // Apache (larger)
      case 5: return 20; // Tazan
      case 7: return 16; // Chicky
      default: return 18;
    }
  }
}
