import 'package:flame/components.dart';
import 'package:flutter/foundation.dart';

import 'gameplay_input_state.dart';

class GameplayInputController extends Component with ChangeNotifier {
  GameplayInputState _state = const GameplayInputState();
  GameplayInputState get state => _state;

  /// Speed of charging, 100 units in 2 seconds
  static const double chargeSpeed = 50.0;

  void updateAngle(int delta) {
    // Legacy MobiArmy2 angle often cycles or clamps.
    // Let's cycle it for a better feel.
    var newAngle = _state.angle + delta;
    if (newAngle < 0) newAngle += 360;
    if (newAngle >= 360) newAngle -= 360;

    _state = _state.copyWith(angle: newAngle);
    notifyListeners();
  }

  void startCharging() {
    _state = _state.copyWith(isCharging: true, force: 0);
    notifyListeners();
  }

  /// Returns the final force when charging stops.
  double stopCharging() {
    final finalForce = _state.force;
    _state = _state.copyWith(isCharging: false);
    notifyListeners();
    return finalForce;
  }

  void setMovingLeft(bool active) {
    _state = _state.copyWith(movingLeft: active);
    notifyListeners();
  }

  void setMovingRight(bool active) {
    _state = _state.copyWith(movingRight: active);
    notifyListeners();
  }

  @override
  void update(double dt) {
    if (_state.isCharging) {
      final newForce = (_state.force + dt * chargeSpeed).clamp(0.0, 100.0);
      _state = _state.copyWith(force: newForce);
      notifyListeners();
    }
  }
}
