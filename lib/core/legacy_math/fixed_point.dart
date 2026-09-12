abstract final class JavaInt32 {
  static const int minValue = -0x80000000;
  static const int maxValue = 0x7fffffff;
  static const int mask = 0xffffffff;

  static int wrap(int value) {
    final unsigned = value & mask;
    return unsigned >= 0x80000000 ? unsigned - 0x100000000 : unsigned;
  }

  static int add(int a, int b) => wrap(a + b);
  static int subtract(int a, int b) => wrap(a - b);
  static int multiply(int a, int b) => wrap(a * b);
  static int shiftLeft(int value, int bits) => wrap(value << (bits & 0x1f));
  static int divide(int dividend, int divisor) {
    if (divisor == 0) throw IntegerDivisionByZeroException();
    if (dividend == minValue && divisor == -1) return minValue;
    return dividend ~/ divisor;
  }

  static int remainder(int dividend, int divisor) =>
      dividend - divide(dividend, divisor) * divisor;
}

class LegacyFixedPoint {
  const LegacyFixedPoint._();
  static const int trigonometryShift = 10;
  static const int one = 1 << trigonometryShift;
  static int multiplyQ10(int a, int b) =>
      JavaInt32.wrap(JavaInt32.multiply(a, b) >> trigonometryShift);
  static int divideQ10(int numerator, int denominator) => JavaInt32.divide(
    JavaInt32.shiftLeft(numerator, trigonometryShift),
    denominator,
  );
}
