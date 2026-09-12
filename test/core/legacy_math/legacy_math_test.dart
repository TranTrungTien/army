import 'dart:convert';
import 'dart:io';
import 'package:flutter_test/flutter_test.dart';
import 'package:mobiarmy_flutter/core/legacy_math/fixed_point.dart';
import 'package:mobiarmy_flutter/core/legacy_math/legacy_angle.dart';
import 'package:mobiarmy_flutter/core/legacy_math/legacy_collision_math.dart';
import 'package:mobiarmy_flutter/core/legacy_math/legacy_trigonometry.dart';
void main() {
  final fixture = jsonDecode(File('test/fixtures/legacy_math_golden.json').readAsStringSync()) as Map<String, dynamic>;
  test('all 360 sin/cos values match Java oracle', () {
    for (final row in fixture['trigonometry'] as List<dynamic>) {
      final value = row as Map<String, dynamic>; final angle = value['angle'] as int;
      expect(LegacyTrigonometry.sin(angle), value['sin'], reason: 'sin($angle)');
      expect(LegacyTrigonometry.cos(angle), value['cos'], reason: 'cos($angle)');
    }
  });
  test('quadrant angles match Java oracle', () {
    for (final row in fixture['angles'] as List<dynamic>) { final v=row as Map<String,dynamic>; expect(LegacyAngle.fromDelta(v['dx'] as int,v['dy'] as int),v['angle']); }
  });
  test('distance matches Java oracle', () {
    for (final row in fixture['distances'] as List<dynamic>) { final v=row as Map<String,dynamic>; expect(LegacyCollisionMath.distance(v['x1'] as int,v['y1'] as int,v['x2'] as int,v['y2'] as int),v['distance']); }
  });
  test('fixOnce preserves legacy one-step behavior', () { expect(LegacyAngle.fixOnce(360),0); expect(LegacyAngle.fixOnce(-1),359); expect(LegacyAngle.fixOnce(721),361); });
  test('Java int32 wraps', () { expect(JavaInt32.add(JavaInt32.maxValue,1),JavaInt32.minValue); expect(JavaInt32.shiftLeft(0x40000000,1),JavaInt32.minValue); });
  test('collision edge rules preserve Java inclusivity', () { expect(LegacyCollisionMath.pointInRect(10,10,10,10,1,1),isTrue); expect(LegacyCollisionMath.pointInRect(11,10,10,10,1,1),isFalse); expect(LegacyCollisionMath.rectanglesHit(0,0,10,10,10,10,2,2),isTrue); });
}
