import 'package:flame/components.dart';
import '../army_game.dart';
import '../projectile/projectile_component.dart';
import '../../domain/camera/camera_mode.dart';

class CameraSystem extends Component with HasGameReference<ArmyGame> {
  CameraMode mode = CameraMode.playerFollow;
  Component? followTarget;
  
  static const double followSpeed = 5.0; // Lerp factor

  @override
  void update(double dt) {
    super.update(dt);
    
    _updateMode();
    _applyClamping();
  }

  void _updateMode() {
    final projectiles = game.gameWorld.children.query<ProjectileComponent>();
    
    if (projectiles.isNotEmpty) {
      mode = CameraMode.bulletFollow;
      followTarget = projectiles.first;
    } else {
      mode = CameraMode.playerFollow;
      // In sandbox, follow player 0
      followTarget = game.players[0];
    }

    if (followTarget != null) {
      if (mode == CameraMode.bulletFollow) {
        // Instant follow for bullets usually
        game.camera.follow(followTarget!, maxSpeed: 1000);
      } else {
        // Smooth follow for players
        game.camera.follow(followTarget!, maxSpeed: 400);
      }
    }
  }

  void _applyClamping() {
    final terrain = game.terrain;
    if (terrain == null) return;

    // Use Flame's built-in bounds rule if not already set
    // Or manually clamp viewfinder position here if we want legacy feel
    // For Phase 7, let's ensure the viewfinder doesn't go outside terrain/2 to width-terrain/2
    
    final viewportSize = game.camera.viewport.size;
    final halfWidth = viewportSize.x / 2;
    final halfHeight = viewportSize.y / 2;

    final minX = halfWidth;
    final maxX = terrain.width - halfWidth;
    final minY = halfHeight;
    final maxY = terrain.height - halfHeight;

    var pos = game.camera.viewfinder.position;
    
    if (maxX > minX) {
      pos.x = pos.x.clamp(minX, maxX);
    } else {
      pos.x = terrain.width / 2;
    }

    if (maxY > minY) {
      pos.y = pos.y.clamp(minY, maxY);
    } else {
      pos.y = terrain.height / 2;
    }

    game.camera.viewfinder.position = pos;
  }
  
  void shake({double intensity = 5.0, double duration = 0.5}) {
    add(ScreenShakeEffect(intensity: intensity, duration: duration));
  }
}
