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

  void makeHole(int centerX, int centerY, int radius) {
    final r2 = radius * radius;
    for (int y = centerY - radius; y <= centerY + radius; y++) {
      if (y < 0 || y >= height) continue;
      for (int x = centerX - radius; x <= centerX + radius; x++) {
        if (x < 0 || x >= width) continue;
        final dx = x - centerX;
        final dy = y - centerY;
        if (dx * dx + dy * dy <= r2) {
          _mask[y * width + x] = 0;
        }
      }
    }
  }

  Uint8List get mask => _mask;
}
