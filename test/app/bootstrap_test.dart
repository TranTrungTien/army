import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mobiarmy_flutter/app/army_app.dart';

void main() {
  testWidgets('app bootstrap mounts router', (tester) async {
    await tester.pumpWidget(const ProviderScope(child: ArmyApp()));
    await tester.pump();
    expect(find.byType(MaterialApp), findsOneWidget);
    expect(find.byType(CircularProgressIndicator), findsOneWidget);
  });
}
