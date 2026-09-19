import 'dart:math' as math;
import 'package:mobiarmy_flutter/core/legacy_math/fixed_point.dart';
import 'package:mobiarmy_flutter/core/legacy_math/legacy_trigonometry.dart';

abstract final class LegacyAngle {
  /// Exact CRes.fixangle behavior. It adjusts only once and is intentionally
  /// not a general modulo normalization function.
  static int fixOnce(int angle) {
    var result = angle;
    if (result >= 360) result -= 360;
    if (result < 0) result += 360;
    return result;
  }

  static int normalized(int angle) {
    final value = JavaInt32.remainder(angle, 360);
    return value < 0 ? value + 360 : value;
  }

  static int difference(int from, int to) {
    final value = to - from;
    if (value < -180) return value + 360;
    return value > 180 ? value - 360 : value;
  }

  static int fromDelta(int dx, int dy) {
    int angle;
    if (dx != 0) {
      final shifted = JavaInt32.shiftLeft(dy, 10);
      final tangent = JavaInt32.abs(JavaInt32.divide(shifted, dx));
      angle = LegacyTrigonometry.atan(tangent);
      if (dy >= 0 && dx < 0) angle = 180 - angle;
      if (dy < 0 && dx < 0) angle += 180;
      if (dy < 0 && dx >= 0) angle = 360 - angle;
    } else {
      angle = dy > 0 ? 90 : 270;
    }
    return angle;
  }

  static int myAngle(int dx, int dy) {
    var value = fromDelta(dx, dy);
    if (value >= 315) value = 360 - value;
    return value;
  }

  static double uiRadians(int degrees) => degrees * math.pi / 180.0;
}
