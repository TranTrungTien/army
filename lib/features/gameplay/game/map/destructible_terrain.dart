import 'dart:typed_data';

class DestructibleTerrain {
  DestructibleTerrain({
    required this.width,
    required this.height,
    required Uint8List initialMask,
  }) : _mask = initialMask;

  final int width;
  final int height;
  final Uint8List _mask; // 1 byte per pixel: 0 = air, 1 = solid

  bool isSolid(int x, int y) {
    if (x < 0 || x >= width || y < 0 || y >= height) return false;
    return _mask[y * width + x] != 0;
  }

  double? findGroundBelow(double startX, double startY, {double maxDistance = 500}) {
    final ix = startX.toInt();
    final iyStart = startY.toInt();
    for (int dy = 0; dy < maxDistance; dy++) {
      final y = iyStart + dy;
      if (isSolid(ix, y)) {
        return y.toDouble();
      }
    }
    return null;
  }

  void makeHole(int centerX, int centerY, int radius) {
    final r2 = radius * radius;
    for (int y = centerY - radius; y <= centerY + radius; y++) {
      if (y < 0 || y >= height) continue;
      final rowOffset = y * width;
      for (int x = centerX - radius; x <= centerX + radius; x++) {
        if (x < 0 || x >= width) continue;
        final dx = x - centerX;
        final dy = y - centerY;
        if (dx * dx + dy * dy <= r2) {
          _mask[rowOffset + x] = 0;
        }
      }
    }
  }

  Uint8List get mask => _mask;
}
