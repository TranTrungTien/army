import 'package:flame/components.dart';
import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'projectile/projectile_component.dart';
import 'projectile/projectile_trajectory.dart';
import 'map/map_component.dart';
import 'map/destructible_terrain.dart';
import 'input/gameplay_input_controller.dart';
import 'systems/camera_system.dart';
import 'systems/player_movement_system.dart';
import 'systems/player_collision_system.dart';
import 'player/character_component.dart';

class ArmyGame extends FlameGame {
  ArmyGame({this.onLoaded});
  final VoidCallback? onLoaded;
  
  late final GameplayInputController inputController;
  late final World gameWorld;
  DestructibleTerrain? terrain;
  
  late final CameraSystem cameraSystem;
  
  final Map<int, CharacterComponent> players = {};

  @override
  Color backgroundColor() => const Color(0xFF0F172A);

  @override
  Future<void> onLoad() async {
    await super.onLoad();
    
    gameWorld = World();
    await add(gameWorld);
    
    inputController = GameplayInputController();
    await add(inputController);
    
    await add(PlayerMovementSystem());
    await add(PlayerCollisionSystem());
    
    cameraSystem = CameraSystem();
    await add(cameraSystem);
    
    // Camera settings
    camera.viewport = FixedResolutionViewport(resolution: Vector2(480, 320));
    camera.viewfinder.anchor = Anchor.center;

    onLoaded?.call();
  }

  void spawnProjectile(ProjectileTrajectory trajectory) {
    gameWorld.add(ProjectileComponent(trajectory: trajectory));
  }

  void pauseSafely() { if (!paused) pauseEngine(); }
  void resumeSafely() { if (paused) resumeEngine(); }
}
