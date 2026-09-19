import 'dart:convert';
import 'dart:io';
import 'package:flutter_test/flutter_test.dart';
import 'package:mobiarmy_flutter/core/legacy_math/fixed_point.dart';
import 'package:mobiarmy_flutter/core/legacy_math/legacy_angle.dart';
import 'package:mobiarmy_flutter/core/legacy_math/legacy_collision_math.dart';
import 'package:mobiarmy_flutter/core/legacy_math/legacy_trigonometry.dart';
import 'package:mobiarmy_flutter/core/legacy_math/java_random.dart';

void main() {
  final fixture =
      jsonDecode(
            File('test/fixtures/legacy_math_golden.json').readAsStringSync(),
          )
          as Map<String, dynamic>;
  test('all 360 sin/cos values match Java oracle', () {
    for (final row in fixture['trigonometry'] as List<dynamic>) {
      final value = row as Map<String, dynamic>;
      final angle = value['angle'] as int;
      expect(
        LegacyTrigonometry.sin(angle),
        value['sin'],
        reason: 'sin($angle)',
      );
      expect(
        LegacyTrigonometry.cos(angle),
        value['cos'],
        reason: 'cos($angle)',
      );
    }
  });
  test('quadrant angles match Java oracle', () {
    for (final row in fixture['angles'] as List<dynamic>) {
      final v = row as Map<String, dynamic>;
      expect(LegacyAngle.fromDelta(v['dx'] as int, v['dy'] as int), v['angle']);
    }
  });
  test('distance matches Java oracle', () {
    for (final row in fixture['distances'] as List<dynamic>) {
      final v = row as Map<String, dynamic>;
      expect(
        LegacyCollisionMath.distance(
          v['x1'] as int,
          v['y1'] as int,
          v['x2'] as int,
          v['y2'] as int,
        ),
        v['distance'],
      );
    }
  });
  test('fixOnce preserves legacy one-step behavior', () {
    expect(LegacyAngle.fixOnce(360), 0);
    expect(LegacyAngle.fixOnce(-1), 359);
    expect(LegacyAngle.fixOnce(721), 361);
  });
  test('Java int32 wraps', () {
    expect(JavaInt32.add(JavaInt32.maxValue, 1), JavaInt32.minValue);
    expect(JavaInt32.shiftLeft(0x40000000, 1), JavaInt32.minValue);
  });
  test('collision edge rules preserve Java inclusivity', () {
    expect(LegacyCollisionMath.pointInRect(10, 10, 10, 10, 1, 1), isTrue);
    expect(LegacyCollisionMath.pointInRect(11, 10, 10, 10, 1, 1), isFalse);
    expect(
      LegacyCollisionMath.rectanglesHit(0, 0, 10, 10, 10, 10, 2, 2),
      isTrue,
    );
  });

  test('Comprehensive Phase 4 Numeric Boundary Semantics', () {
    // 1. Signed/Unsigned byte boundary checks
    // Java byte bounds are -128 to 127. Unsigned values 128 -> -128, 255 -> -1
    expect(JavaInt32.wrap(128), -128);
    expect(JavaInt32.wrap(255), -1);
    expect(JavaInt32.wrap(0), 0);
    expect(JavaInt32.wrap(127), 127);

    // 2. Int32 Overflow boundaries
    expect(JavaInt32.add(JavaInt32.maxValue, 1), JavaInt32.minValue);
    expect(JavaInt32.subtract(JavaInt32.minValue, 1), JavaInt32.maxValue);
    expect(JavaInt32.multiply(0x40000000, 2), JavaInt32.minValue);

    // 3. Division toward zero & negative remainders
    expect(JavaInt32.divide(-5, 2), -2); // Truncates toward zero
    expect(JavaInt32.remainder(-5, 2), -1); // Negative remainder behavior
    expect(JavaInt32.divide(JavaInt32.minValue, -1), JavaInt32.minValue); // Overflow exception guard

    // 4. Angle normalization boundaries
    expect(LegacyAngle.normalized(360), 0);
    expect(LegacyAngle.normalized(725), 5);
    expect(LegacyAngle.normalized(-90), 270);
    expect(LegacyAngle.normalized(0), 0);
    expect(LegacyAngle.normalized(90), 90);
    expect(LegacyAngle.normalized(180), 180);
    expect(LegacyAngle.normalized(270), 270);

    // 5. Q10 Fixed Point validation
    // 1 << 10 = 1024
    expect(LegacyFixedPoint.one, 1024);
    final multiplied = LegacyFixedPoint.multiplyQ10(2048, 2048); // 2.0 * 2.0 = 4.0 (4096)
    expect(multiplied, 4096);
  });

  test('JavaInt32.abs matches JVM Integer.MIN_VALUE semantics', () {
    expect(JavaInt32.abs(-10), 10);
    expect(JavaInt32.abs(10), 10);
    expect(JavaInt32.abs(0), 0);
    // CRITICAL: Math.abs(MIN_VALUE) is still MIN_VALUE in Java
    expect(JavaInt32.abs(JavaInt32.minValue), JavaInt32.minValue);
  });

  test('JavaRandom parity with java.util.Random(12345L)', () {
    final rand = JavaRandom(12345);
    expect(rand.nextInt(), 1553932502);
    expect(rand.nextInt(), -2090749135);
    expect(rand.nextInt(100), 82);
  });
}
