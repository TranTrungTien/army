import 'dart:math';
import 'package:flame/components.dart';
import 'package:flame/effects.dart';
import '../army_game.dart';

class ScreenShakeEffect extends Component with HasGameReference<ArmyGame> {
  ScreenShakeEffect({this.intensity = 5.0, this.duration = 0.5});

  final double intensity;
  final double duration;
  double _elapsed = 0.0;
  final Random _random = Random();

  @override
  void update(double dt) {
    super.update(dt);
    _elapsed += dt;

    if (_elapsed < duration) {
      final double currentIntensity = intensity * (1.0 - (_elapsed / duration));
      final double shakeX = (_random.nextDouble() * 2 - 1) * currentIntensity;
      final double shakeY = (_random.nextDouble() * 2 - 1) * currentIntensity;

      // Apply shake to viewfinder offset
      game.camera.viewfinder.position += Vector2(shakeX, shakeY);
    } else {
      removeFromParent();
    }
  }
}
