import 'package:flame/components.dart';
import '../projectile/projectile_component.dart';
import '../map/map_component.dart';

class CombatSystem extends Component with HasGameRef {
  // Logic for managing turns, shooting, and damage
  
  void onShoot(ProjectileComponent projectile) {
    gameRef.add(projectile);
  }
}
