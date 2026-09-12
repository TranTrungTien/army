import 'package:flutter_test/flutter_test.dart';
import 'package:mobiarmy_flutter/features/gameplay/game/army_game.dart';
void main() {
  test('pause and resume are idempotent', () {
    final game = ArmyGame();
    game.pauseSafely();
    game.pauseSafely();
    expect(game.isEnginePaused, isTrue);
    game.resumeSafely();
    game.resumeSafely();
    expect(game.isEnginePaused, isFalse);
  });
}
