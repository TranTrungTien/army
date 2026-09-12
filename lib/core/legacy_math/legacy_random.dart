import 'dart:math';
import 'package:mobiarmy_flutter/core/legacy_math/fixed_point.dart';

class LegacyRandom {
  LegacyRandom([Random? random]) : _random = random ?? Random();
  final Random _random;

  int between(int minInclusive, int maxExclusive) =>
      minInclusive + _random.nextInt(maxExclusive - minInclusive);

  /// Mirrors Java `nextInt() % bound`, including negative results.
  int signedRemainder(int bound) {
    final high = _random.nextInt(1 << 16);
    final low = _random.nextInt(1 << 16);
    final value = JavaInt32.wrap((high << 16) | low);
    return JavaInt32.remainder(value, bound);
  }
}
