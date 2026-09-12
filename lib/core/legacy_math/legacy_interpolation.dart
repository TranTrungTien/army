abstract final class LegacyInterpolation {
  static double lerp(double start, double end, double time) =>
      start + time * (end - start);
  static double clamp01(double value) =>
      value < 0 ? 0 : (value > 1 ? 1 : value);
  static int clampInt(int value, int min, int max) =>
      value < min ? min : (value > max ? max : value);
}
