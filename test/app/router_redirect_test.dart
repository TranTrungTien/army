import 'package:flutter_test/flutter_test.dart';
import 'package:mobiarmy_flutter/app/router/app_route.dart';

void main() {
  test('route paths are unique', () {
    final paths = AppRoute.values.map((e) => e.path).toSet();
    expect(paths.length, AppRoute.values.length);
  });
}
