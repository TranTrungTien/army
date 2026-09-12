import '../map/destructible_terrain.dart';

class GroundProbe {
  const GroundProbe(this.terrain);

  final DestructibleTerrain terrain;

  /// Returns true if the point [x, y] is on or inside solid terrain.
  bool isSolid(double x, double y) {
    return terrain.isSolid(x.toInt(), y.toInt());
  }

  /// Finds the y-coordinate of the ground directly below [x, startY].
  /// Returns null if no ground is found within [maxDistance].
  double? findGroundBelow(double x, double startY, {double maxDistance = 500}) {
    for (int dy = 0; dy < maxDistance; dy++) {
      final y = startY + dy;
      if (terrain.isSolid(x.toInt(), y.toInt())) {
        return y;
      }
    }
    return null;
  }

  /// Checks if a player of [width] at [x, y] is colliding with terrain.
  bool isColliding(double x, double y, double width, double height) {
    // Basic implementation: check bottom corners and middle
    final left = x - width / 2;
    final right = x + width / 2;
    final bottom = y;

    return isSolid(left, bottom) ||
        isSolid(right, bottom) ||
        isSolid(x, bottom);
  }
}
