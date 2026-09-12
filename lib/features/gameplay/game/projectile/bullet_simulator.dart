import 'package:mobiarmy_flutter/core/legacy_math/fixed_point.dart';
import 'projectile_trajectory.dart';

class BulletSimulator {
  BulletSimulator({
    required this.bulletId,
    required this.x,
    required this.y,
    required this.vx,
    required this.vy,
    required this.ax100,
    required this.ay100,
    required this.g100,
  }) : bX = x,
       bY = y,
       xOld = x,
       yOld = y,
       lastX = x,
       lastY = y;

  final int bulletId;
  int x, y;
  int bX, bY;
  int vx, vy;
  int ax100, ay100, g100;

  int vxTemp = 0;
  int vyTemp = 0;
  int vyTemp2 = 0;
  int xOld, yOld;
  int lastX, lastY;
  bool collect = false;
  int frame = 0;

  final List<TrajectoryFrame> frames = [];

  void nextXY(
    int mapWidth,
    int mapHeight,
    bool Function(int x, int y) isCollision,
  ) {
    frame++;
    frames.add(TrajectoryFrame(x: bX, y: bY));

    if (bX < -100 ||
        bX > mapWidth + 100 ||
        bY > mapHeight + 100 ||
        bY < -999999) {
      collect = true;
      return;
    }

    xOld = bX;
    yOld = bY;
    bX = lastX = bX + vx;
    bY = lastY = bY + vy;

    final collision = _getCollision(xOld, yOld, bX, bY, isCollision);
    if (collision != null) {
      bX = collision[0];
      bY = collision[1];
      frames.add(TrajectoryFrame(x: bX, y: bY));
      collect = true;
    } else {
      vxTemp += ax100.abs();
      vyTemp += ay100.abs();
      vyTemp2 += g100;

      if (vxTemp.abs() >= 100) {
        if (ax100 > 0) {
          vx += vxTemp ~/ 100;
        } else {
          vx -= vxTemp ~/ 100;
        }
        vxTemp %= 100;
      }

      if (vyTemp.abs() >= 100) {
        if (ay100 > 0) {
          vy += vyTemp ~/ 100;
        } else {
          vy -= vyTemp ~/ 100;
        }
        vyTemp %= 100;
      }

      if (vyTemp2.abs() >= 100) {
        vy += vyTemp2 ~/ 100;
        vyTemp2 %= 100;
      }
    }
  }

  List<int>? _getCollision(
    int x1,
    int y1,
    int x2,
    int y2,
    bool Function(int x, int y) isCollision,
  ) {
    int dx = x2 - x1;
    int dy = y2 - y1;
    int xUnit = dx < 0 ? -1 : (dx > 0 ? 1 : 0);
    int yUnit = dy < 0 ? -1 : (dy > 0 ? 1 : 0);
    int xUnit2 = xUnit;
    int yUnit2 = yUnit;

    int k1 = dx.abs();
    int k2 = dy.abs();

    if (k1 > k2) {
      yUnit2 = 0;
    } else {
      k1 = dy.abs();
      k2 = dx.abs();
      xUnit2 = 0;
    }

    int k = k1 >> 1;
    int currX = x1;
    int currY = y1;

    for (int i = 0; i <= k1; i++) {
      if (isCollision(currX, currY)) {
        return [currX, currY];
      }
      k += k2;
      if (k >= k1) {
        k -= k1;
        currX += xUnit;
        currY += yUnit;
      } else {
        currX += xUnit2;
        currY += yUnit2;
      }
    }
    return null;
  }
}
