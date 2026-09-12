import 'package:flame/components.dart';
import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:mobiarmy_flutter/features/gameplay/game/input/gameplay_input_controller.dart';
import 'package:mobiarmy_flutter/features/gameplay/game/map/background_component.dart';
import 'package:mobiarmy_flutter/features/gameplay/game/map/destructible_terrain.dart';
import 'package:mobiarmy_flutter/features/gameplay/game/map/game_map_definition.dart';
import 'package:mobiarmy_flutter/features/gameplay/game/map/terrain_component.dart';
import 'package:mobiarmy_flutter/features/gameplay/game/player/game_player.dart';
import 'package:mobiarmy_flutter/features/gameplay/game/projectile/projectile_component.dart';
import 'package:mobiarmy_flutter/features/gameplay/game/projectile/projectile_trajectory.dart';
import 'package:mobiarmy_flutter/features/gameplay/game/projectile/trajectory_simulator.dart';
import 'package:mobiarmy_flutter/features/gameplay/game/sandbox/sandbox_scenario.dart';
import 'package:mobiarmy_flutter/features/gameplay/game/systems/camera_system.dart';
import 'package:mobiarmy_flutter/features/gameplay/game/systems/player_collision_system.dart';
import 'package:mobiarmy_flutter/features/gameplay/game/systems/player_movement_system.dart';

class ArmyGame extends FlameGame {
  ArmyGame({this.scenario, this.onLoaded});

  final SandboxScenario? scenario;
  final VoidCallback? onLoaded;

  late final GameplayInputController inputController;
  late final World gameWorld;
  late final CameraSystem cameraSystem;

  DestructibleTerrain? terrain;
  GameMapDefinition? map;
  final Map<int, GamePlayer> players = {};
  TerrainComponent? _terrainComponent;

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

    camera.viewfinder.anchor = Anchor.center;

    final scenario = this.scenario;
    if (scenario != null) {
      map = scenario.map;
      terrain = scenario.terrain;
      await gameWorld.add(
        BackgroundComponent(
          environment: scenario.map.environment,
          mapSize: Vector2(
            scenario.map.width.toDouble(),
            scenario.map.height.toDouble(),
          ),
        ),
      );
      final terrainComponent = TerrainComponent(terrain: scenario.terrain);
      _terrainComponent = terrainComponent;
      await gameWorld.add(terrainComponent);
      for (var i = 0; i < scenario.characters.length; i++) {
        final character = scenario.characters[i];
        await gameWorld.add(character);
        players[i] = character;
      }
    }

    onLoaded?.call();
  }

  /// Entry point for network replay (command 22), reused by offline fire().
  void spawnProjectile(ProjectileTrajectory trajectory) {
    gameWorld.add(
      ProjectileComponent(trajectory: trajectory, onImpact: _onBulletImpact),
    );
  }

  /// Offline shot: legacy force range is 1..30 (charge bar), angle comes from
  /// the input controller, trajectory uses the Q10 legacy math from Phase 2.
  void fire(double rawForce) {
    final me = players[0];
    final terrain = this.terrain;
    final map = this.map;
    if (me == null || terrain == null || map == null) return;

    final force = rawForce.round().clamp(1, 30);
    final trajectories = TrajectorySimulator.simulate(
      bulletId: 0,
      gunX: me.x.round(),
      gunY: (me.y - 12).round(),
      width: 20,
      height: 20,
      ang: inputController.state.angle,
      force: force,
      windX: 0,
      windY: 0,
      mapWidth: map.width,
      mapHeight: map.height,
      isCollision: terrain.isSolid,
    );
    for (final trajectory in trajectories) {
      spawnProjectile(trajectory);
    }
  }

  void _onBulletImpact(int x, int y) {
    _terrainComponent?.makeHole(x, y, 18);
    cameraSystem.shake(intensity: 3, duration: 0.25);
  }

  void pauseSafely() {
    if (!paused) pauseEngine();
  }

  void resumeSafely() {
    if (paused) resumeEngine();
  }

  bool get isEnginePaused => paused;
}
