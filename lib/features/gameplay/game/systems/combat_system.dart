import 'package:flame/components.dart';

import '../projectile/projectile_component.dart';

class CombatSystem extends Component with HasGameReference {
  // Logic for managing turns, shooting, and damage

  void onShoot(ProjectileComponent projectile) {
    game.add(projectile);
  }
}
