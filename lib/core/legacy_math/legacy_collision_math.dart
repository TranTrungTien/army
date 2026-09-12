import 'package:mobiarmy_flutter/core/legacy_math/fixed_point.dart';

abstract final class LegacyCollisionMath {
  static bool isLand(int argb) => (argb & 0xff000000) != 0;

  static bool pointInRect(
    int x,
    int y,
    int left,
    int top,
    int width,
    int height,
  ) => x >= left && x < left + width && y >= top && y < top + height;

  static bool rectanglesHit(
    int x,
    int y,
    int width,
    int height,
    int targetX,
    int targetY,
    int targetWidth,
    int targetHeight,
  ) =>
      x + width >= targetX &&
      x <= targetX + targetWidth &&
      y + height >= targetY &&
      y <= targetY + targetHeight;

  static int integerSqrt(int value) {
    if (value <= 0) return 0;
    var x = JavaInt32.divide(JavaInt32.add(value, 1), 2);
    int previous;
    do {
      previous = x;
      x = JavaInt32.add(
        JavaInt32.divide(x, 2),
        JavaInt32.divide(value, JavaInt32.multiply(2, x)),
      );
    } while ((previous - x).abs() > 1);
    return x;
  }

  static int distance(int x1, int y1, int x2, int y2) {
    final dx = JavaInt32.subtract(x1, x2);
    final dy = JavaInt32.subtract(y1, y2);
    final squared = JavaInt32.add(
      JavaInt32.multiply(dx, dx),
      JavaInt32.multiply(dy, dy),
    );
    return integerSqrt(squared);
  }
}
