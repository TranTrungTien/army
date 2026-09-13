import 'package:flame/components.dart';
import 'package:flame/events.dart';
import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:mobiarmy_flutter/core/audio/audio_service.dart';
import 'package:mobiarmy_flutter/features/gameplay/domain/match_state.dart';
import 'package:mobiarmy_flutter/features/gameplay/game/effects/explosion_component.dart';
import 'package:mobiarmy_flutter/features/gameplay/game/input/gameplay_input_controller.dart';
import 'package:mobiarmy_flutter/features/gameplay/game/map/background_component.dart';
import 'package:mobiarmy_flutter/features/gameplay/game/map/destructible_terrain.dart';
import 'package:mobiarmy_flutter/features/gameplay/game/map/game_map_definition.dart';
import 'package:mobiarmy_flutter/features/gameplay/game/map/map_json_loader.dart';
import 'package:mobiarmy_flutter/features/gameplay/game/map/terrain_component.dart';
import 'package:mobiarmy_flutter/features/gameplay/game/player/game_player.dart';
import 'package:mobiarmy_flutter/features/gameplay/game/player/sandbox_character_component.dart';
import 'package:mobiarmy_flutter/features/gameplay/game/projectile/projectile_component.dart';
import 'package:mobiarmy_flutter/features/gameplay/game/projectile/projectile_trajectory.dart';
import 'package:mobiarmy_flutter/features/gameplay/game/projectile/trajectory_simulator.dart';
import 'package:mobiarmy_flutter/features/gameplay/game/sandbox/sandbox_scenario.dart';
import 'package:mobiarmy_flutter/features/gameplay/game/systems/camera_system.dart';
import 'package:mobiarmy_flutter/features/gameplay/game/systems/combat_system.dart';
import 'package:mobiarmy_flutter/features/gameplay/game/systems/player_collision_system.dart';
import 'package:mobiarmy_flutter/features/gameplay/game/systems/player_movement_system.dart';

class ArmyGame extends FlameGame with DragCallbacks {
  ArmyGame({this.scenario, this.onLoaded, this.audio});

  final SandboxScenario? scenario;
  final VoidCallback? onLoaded;
  final AudioService? audio;

  late final GameplayInputController inputController;
  late final World gameWorld;
  late final CameraSystem cameraSystem;

  DestructibleTerrain? terrain;
  GameMapDefinition? map;
  final Map<int, GamePlayer> players = {};
  int? activePlayerId;
  int windX = 0;
  int windY = 0;
  TerrainComponent? _terrainComponent;

  Future<void> setupMatch(MatchState matchState) async {
    // 1. Clear existing
    gameWorld.removeAll(gameWorld.children);
    players.clear();

    // 2. Load Map (Placeholder until Phase 3 complete)
    // For now, we reuse the Sandbox maps logic
    map = scenario?.map ??
        MapJsonLoader.parse(
          SandboxMaps.cayCauBang,
          mapId: matchState.mapId,
          backgroundId: 7,
        );
    terrain = TerrainMaskBuilder.build(map!, tileSize: SandboxMaps.tileSize);

    await gameWorld.add(
      BackgroundComponent(
        environment: map!.environment,
        mapSize: Vector2(map!.width.toDouble(), map!.height.toDouble()),
      ),
    );

    final terrainComponent = TerrainComponent(terrain: terrain!);
    _terrainComponent = terrainComponent;
    await gameWorld.add(terrainComponent);

    // 3. Spawn Players
    for (final entry in matchState.players.entries) {
      final id = entry.key;
      final p = entry.value;
      final color = p.base.team == 0 ? const Color(0xFF2563EB) : const Color(0xFFDC2626);
      final character = SandboxCharacterComponent(
        slotEquipment: const {},
        bodyColor: color,
        classId: p.base.team == 0 ? 1 : 2,
      );
      character.moveTo(p.x.toDouble(), p.y.toDouble());
      await gameWorld.add(character);
      players[id] = character;
    }

    windX = matchState.windX;
    windY = matchState.windY;
    activePlayerId = matchState.currentTurnPlayerId;
  }

  @override
  Color backgroundColor() => const Color(0xFF87CEEB); // Sky blue background color

  @override
  Future<void> onLoad() async {
    await super.onLoad();

    gameWorld = World();
    world = gameWorld; // Gán world để camera nhìn thấy
    await add(gameWorld);

    inputController = GameplayInputController();
    await add(inputController);

    await add(PlayerMovementSystem());
    await add(PlayerCollisionSystem());
    await add(CombatSystem());
    cameraSystem = CameraSystem();
    await add(cameraSystem);

    camera.viewfinder.anchor = Anchor.center;
    camera.viewfinder.zoom = 2.0; // Zoom in to see characters clearly as in original game

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
      activePlayerId = 0; // Đặt nhân vật đầu tiên làm người chơi hiện tại để Camera follow
    }

    onLoaded?.call();
  }

  /// Entry point for network replay (command 22), reused by offline fire().
  void spawnProjectile(ProjectileTrajectory trajectory) {
    gameWorld.add(
      ProjectileComponent(trajectory: trajectory, onImpact: _onBulletImpact),
    );
    audio?.playSfx('shoot');
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

  void _onBulletImpact(int x, int y, int radius) {
    _terrainComponent?.makeHole(x, y, radius);
    gameWorld.add(ExplosionComponent(
      position: Vector2(x.toDouble(), y.toDouble()),
      radius: radius.toDouble(),
    ));
    cameraSystem.shake(intensity: 3, duration: 0.25);
    audio?.playSfx('explosion');
  }

  @override
  void onDragUpdate(DragUpdateEvent event) {
    super.onDragUpdate(event);
    cameraSystem.pan(event.localDelta);
  }

  void pauseSafely() {
    if (!paused) pauseEngine();
  }

  void resumeSafely() {
    if (paused) resumeEngine();
  }

  bool get isEnginePaused => paused;
}
