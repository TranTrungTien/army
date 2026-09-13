import 'package:flame/components.dart';
import 'package:mobiarmy_flutter/features/gameplay/domain/camera/camera_mode.dart';
import 'package:mobiarmy_flutter/features/gameplay/game/army_game.dart';
import 'package:mobiarmy_flutter/features/gameplay/game/projectile/projectile_component.dart';
import 'package:mobiarmy_flutter/features/gameplay/game/systems/screen_shake_effect.dart';

class CameraSystem extends Component with HasGameReference<ArmyGame> {
  CameraMode mode = CameraMode.playerFollow;
  Component? _followApplied;
  double _freePanTimeout = 0;

  void shake({double intensity = 5.0, double duration = 0.5}) {
    add(ScreenShakeEffect(intensity: intensity, duration: duration));
  }

  void pan(Vector2 delta) {
    mode = CameraMode.freePan;
    _freePanTimeout = 3.0; // Return to player after 3s of inactivity
    game.camera.viewfinder.position -= delta;
    _followApplied = null;
    game.camera.stop();
  }

  @override
  void update(double dt) {
    super.update(dt);

    if (mode == CameraMode.freePan) {
      _freePanTimeout -= dt;
      if (_freePanTimeout <= 0) {
        mode = CameraMode.playerFollow;
      }
    }

    _updateTarget();
    _applyClamping();
  }

  void _applyFollow(PositionComponent target, double maxSpeed) {
    if (_followApplied == target) return;
    _followApplied = target;
    game.camera.follow(target, maxSpeed: maxSpeed);
  }

  void _updateTarget() {
    if (mode == CameraMode.freePan) return;

    final projectiles = game.gameWorld.children.query<ProjectileComponent>();
    final PositionComponent? target;
    final double maxSpeed;
    if (projectiles.isNotEmpty) {
      mode = CameraMode.bulletFollow;
      target = projectiles.first;
      maxSpeed = 1000;
    } else {
      mode = CameraMode.playerFollow;
      target = game.players[game.activePlayerId ?? 0];
      maxSpeed = 400;
    }
    if (target != null) _applyFollow(target, maxSpeed);
  }

  void _applyClamping() {
    final terrain = game.terrain;
    if (terrain == null) return;

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
}
