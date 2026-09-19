
import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mobiarmy_flutter/app/lifecycle/app_lifecycle_coordinator.dart';
import 'package:mobiarmy_flutter/core/audio/audio_provider.dart';
import 'package:mobiarmy_flutter/core/network/connection_lifecycle.dart';
import 'package:mobiarmy_flutter/features/gameplay/application/game_session_bootstrap.dart';
import 'package:mobiarmy_flutter/features/gameplay/application/gameplay_controller.dart';
import 'package:mobiarmy_flutter/features/gameplay/game/army_game.dart';
import 'package:mobiarmy_flutter/features/gameplay/game/map/background_component.dart';
import 'package:mobiarmy_flutter/features/gameplay/game/map/terrain_component.dart';
import 'package:mobiarmy_flutter/features/gameplay/game/player/online_character.dart';
import 'package:mobiarmy_flutter/features/gameplay/game/systems/ground_probe.dart';
import 'package:mobiarmy_flutter/shared/overlays/gameplay_hud.dart';

class OnlineGameScreen extends ConsumerStatefulWidget {
  const OnlineGameScreen({super.key});
  @override
  ConsumerState<OnlineGameScreen> createState() => _OnlineGameScreenState();
}

class _OnlineGameScreenState extends ConsumerState<OnlineGameScreen> {
  ArmyGame? _game;
  AppLifecycleCoordinator? _lifecycle;
  String? _error;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) => _start());
  }

  Future<void> _start() async {
    final match = ref.read(gameplayControllerProvider);
    final setup = match == null ? null : GameSessionBootstrap.build(match);
    final audio = ref.read(audioServiceProvider);

    if (setup == null || match == null) {
      setState(() => _error = 'Không thể khởi tạo trận đấu (thiếu dữ liệu MatchState)');
      return;
    }

    final game = ArmyGame(audio: audio);
    await game.onLoad();
    game.map = setup.map;
    game.terrain = setup.terrain;
    await game.gameWorld.add(BackgroundComponent(
      environment: setup.map.environment,
      mapSize: Vector2(setup.map.width.toDouble(), setup.map.height.toDouble()),
    ));
    await game.gameWorld.add(TerrainComponent(terrain: setup.terrain));
    game.players.clear();

    final probe = GroundProbe(setup.terrain);
    for (final mp in match.players.values) {
      final gy = probe.findGroundBelow(mp.x.toDouble(), mp.y.toDouble()) ?? mp.y.toDouble();
      final c = OnlineCharacter(
        glassId: mp.base.gun,
        equipIds: mp.base.equipIds,
        name: mp.base.name,
        maxHp: mp.maxHp,
      );
      await c.load();
      c.hp = mp.hp;
      c.moveTo(mp.x.toDouble(), gy);
      await game.gameWorld.add(c);
      game.players[mp.base.id] = c;
    }

    _lifecycle = AppLifecycleCoordinator(
      game: game,
      connection: const NoopConnectionLifecycle(), // TODO: Real connection lifecycle
    )..start();

    setState(() => _game = game);
  }

  @override
  void dispose() {
    _lifecycle?.dispose();
    _game?.pauseSafely();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final match = ref.watch(gameplayControllerProvider);
    final game = _game;

    if (match == null) {
      return const Scaffold(body: Center(child: Text('Đang thoát trận...')));
    }

    // Handle one-off events from MatchState
    ref.listen(gameplayControllerProvider.select((s) => s?.lastShoot), (prev, next) {
      if (next != null && game != null) {
        for (final trajectory in next.trajectories) {
          game.spawnProjectile(trajectory);
        }
      }
    });

    return Scaffold(
      body: Stack(
        children: [
          if (game != null)
            Positioned.fill(
              child: GameWidget<ArmyGame>(
                game: game,
                overlayBuilderMap: {
                  'HUD': (context, g) => GameplayHud(game: g),
                },
                initialActiveOverlays: const ['HUD'],
              ),
            )
          else if (_error != null)
            Center(child: Text(_error!))
          else
            const Center(child: CircularProgressIndicator()),
          if (game != null) _buildStatusHeader(match),
        ],
      ),
    );
  }

  Widget _buildStatusHeader(dynamic match) {
    final isMyTurn = ref.watch(gameplayControllerProvider.notifier).isMyTurn;

    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              decoration: BoxDecoration(
                color: Colors.black54,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text('Gió: ${match.windX}',
                      style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                  const SizedBox(width: 16),
                  Text(
                    isMyTurn ? 'LƯỢT CỦA BẠN' : 'Đang chờ...',
                    style: TextStyle(
                      color: isMyTurn ? Colors.greenAccent : Colors.white70,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
