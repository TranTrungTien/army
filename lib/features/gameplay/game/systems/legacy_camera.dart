import 'dart:math' as math;

/// Port effect/Camera.java — camera cua GameScr.
/// Di chuyen bang exponential ease: x -= (x - target) >> rangeBit.
/// Gioi han: restrict(0, mapWidth, -1000, mapHeight - screenH).
/// Shake: type 1 = ±5 x 10 frame; type 2 = ±20 x 10 frame;
///        type 3 = rung doc deltaY giam dan (20 -> 0) x 30 frame.
class LegacyCamera {
  static const int free = 0;
  static const int player = 1;
  static const int bullet = 2;
  static const int airPlane = 3;
  static const int targetPoint = 4;
  static const int targetPointNoRestrict = 5;
  static const int lazer = 6;
  static const int meteor = 7;
  static const int missileRain = 8;

  int mode = free;
  int x = 0, y = 0;
  int startx = 0, starty = 0;
  int mapWidth = 800, mapHeight = 600;
  int screenW = 400, screenH = 240;

  // shake state
  int shaking = 0; // 0 = off, 1/2/3 = type
  int _shakeCount = 0;
  int _deltaY = 20;

  // bullet target
  int bulletX = 0, bulletY = 0;
  int bulletType = 0, bulletAngle = 0;

  // player target
  int playerX = 0, playerY = 0, playerLook = 0;
  bool yourTurn = false;
  int playerState = 0;

  // target point
  int _setIndexX = 0, _setIndexY = 0;
  bool isTrackingBullet = false;

  void setFreeMode() {
    mode = free;
  }

  void setPlayerMode(int px, int py, int look, bool isYourTurn, int state) {
    mode = player;
    playerX = px; playerY = py; playerLook = look;
    yourTurn = isYourTurn; playerState = state;
  }

  void setBulletMode(int bx, int by, int type, int angle, int paintCount) {
    mode = bullet;
    bulletX = bx; bulletY = by; bulletType = type; bulletAngle = angle;
    isTrackingBullet = true;
  }

  void setTargetPointMode(int ix, int iy) {
    mode = targetPoint;
    _setIndexX = ix - screenW ~/ 2;
    _setIndexY = iy - screenH ~/ 2;
  }

  void update() {
    startx = x;
    starty = y;
    var indexX = 0, indexY = 0;
    switch (mode) {
      case player:
        if (playerLook == 0) {
          indexX = playerX - 40 - screenW ~/ 2;
        } else if (playerLook == 2) {
          indexX = playerX + 40 - screenW ~/ 2;
        }
        indexY = playerY - screenH ~/ 2 - 12;
        _checkIndex(indexX, indexY, (yourTurn && playerState != 1) ? 0 : 4);
        break;
      case bullet:
        if (isTrackingBullet &&
            !(bulletType == 37 && (bulletAngle == -90 || bulletAngle == 270) && bulletY > -300)) {
          indexX = bulletX - screenW ~/ 2;
          indexY = bulletY - screenH ~/ 2;
          _checkIndex(indexX, indexY, bulletType == 37 ? 1 : 2);
        }
        break;
      case targetPoint:
        _checkIndex(_setIndexX, _setIndexY, 2);
        break;
      case lazer:
      case meteor:
        _checkIndex(bulletX - screenW ~/ 2, bulletY - screenH ~/ 3, 1);
        break;
      case missileRain:
        _checkIndex(playerX - screenW ~/ 2, bulletY - screenH ~/ 2, 2);
        break;
    }
    _updateShake();
    if (mode != targetPointNoRestrict) {
      restrict();
    }
  }

  void _checkIndex(int indexX, int indexY, int rangeBit) {
    if (x != indexX) x -= (x - indexX) >> rangeBit;
    if (y != indexY) y -= (y - indexY) >> rangeBit;
  }

  void _updateShake() {
    if (shaking == 0) return;
    if (shaking == 1) {
      x += _rnd(-5, 5);
      y += _rnd(-5, 5);
    } else if (shaking == 2) {
      x += _rnd(-20, 20);
      y += _rnd(-20, 20);
    } else if (shaking == 3) {
      y += (_shakeCount % 3 == 0) ? _deltaY : -_deltaY;
      if (_shakeCount % 2 == 0) _deltaY--;
      if (_deltaY < 0) _deltaY = 0;
    }
    _shakeCount++;
    final limit = shaking != 3 ? 10 : 30;
    if (_shakeCount > limit) {
      _deltaY = 20;
      shaking = 0;
      _shakeCount = 0;
    }
  }

  void restrict() {
    if (y < -1000) y = -1000;
    if (y > mapHeight - screenH) y = mapHeight - screenH;
    if (x < 0) x = 0;
    if (x > mapWidth - screenW) x = mapWidth - screenW;
  }

  static int _rnd(int a, int b) => a + math.Random().nextInt(b - a);
}