
import 'package:flame/components.dart';
import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:mobiarmy_flutter/features/authentication/application/auth_controller.dart';
import 'package:mobiarmy_flutter/features/gameplay/application/game_session_bootstrap.dart';
import 'package:mobiarmy_flutter/features/gameplay/application/game_start_handler.dart';
import 'package:mobiarmy_flutter/features/gameplay/application/gameplay_provider.dart';
import 'package:mobiarmy_flutter/features/gameplay/application/online_game_service.dart';
import 'package:mobiarmy_flutter/features/gameplay/application/room_service.dart';
import 'package:mobiarmy_flutter/features/gameplay/game/army_game.dart';
import 'package:mobiarmy_flutter/features/gameplay/game/map/background_component.dart';
import 'package:mobiarmy_flutter/features/gameplay/game/map/terrain_component.dart';
import 'package:mobiarmy_flutter/features/gameplay/game/player/online_character.dart';
import 'package:mobiarmy_flutter/features/gameplay/game/systems/ground_probe.dart';

class OnlineGameScreen extends ConsumerStatefulWidget {
  const OnlineGameScreen({super.key});
  @override
  ConsumerState<OnlineGameScreen> createState() => _OnlineGameScreenState();
}

class _OnlineGameScreenState extends ConsumerState<OnlineGameScreen> {
  ArmyGame? _game;
  String? _error;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) => _start());
  }

  Future<void> _start() async {
    final session = ref.read(gameStartProvider);
    final setup = session == null ? null : GameSessionBootstrap.build(session);
    final activeSession = session;
    if (setup == null || activeSession == null) {
      setState(() => _error = 'Khong khoi tao duoc map (chua sync valuesdata2?)');
      return;
    }
    final game = ArmyGame();
    await game.onLoad();
    game.map = setup.map;
    game.terrain = setup.terrain;
    await game.gameWorld.add(BackgroundComponent(
      environment: setup.map.environment,
      mapSize: Vector2(setup.map.width.toDouble(), setup.map.height.toDouble()),
    ));
    await game.gameWorld.add(TerrainComponent(terrain: setup.terrain));
    game.players.clear();

    // Nhan vat THAT: body PlayerSprites + trang bi theo room players (cmd 8)
    final room = ref.read(roomServiceProvider);
    final probe = GroundProbe(setup.terrain);
    for (var i = 0; i < setup.spawnPoints.length; i++) {
      final sp = setup.spawnPoints[i];
      final gy = probe.findGroundBelow(sp.x.toDouble(), sp.y.toDouble()) ?? sp.y.toDouble();
      final rp = i < room.players.length ? room.players[i] : null;
      final c = OnlineCharacter(
        glassId: rp?.gun ?? 0,
        equipIds: rp?.equipIds ?? const [0, 0, 0, 0, 0],
        name: rp?.name ?? 'P$i',
        maxHp: i < activeSession.maxHp.length ? activeSession.maxHp[i] : 1000,
      );
      await c.load();
      c.hp = c.maxHp;
      c.moveTo(sp.x.toDouble(), gy);
      await game.gameWorld.add(c);
      game.players[i] = c;
    }

    // myIndex dung: match idDB voi UserSession.id
    final myId = ref.read(authControllerProvider).session?.id ?? -1;
    final myIdx = room.players.indexWhere((p) => p.idDb == myId);
    if (myIdx >= 0 && myIdx < setup.spawnPoints.length) {
      final sp = setup.spawnPoints[myIdx];
      await ref.read(onlineGameServiceProvider.notifier).move(sp.x, sp.y);
    }

    // Nhan trajectory (cmd 22) / move (cmd 21) tu nguoi choi khac
    ref.read(gameplayHandlerProvider).attachGame(game);

    setState(() => _game = game);
  }

  @override
  void dispose() {
    ref.read(gameplayHandlerProvider).detachGame();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final hud = ref.watch(onlineGameServiceProvider);
    final game = _game;
    return Scaffold(
      body: Stack(
        children: [
          if (game != null)
            Positioned.fill(child: GameWidget(game: game))
          else if (_error != null)
            Center(child: Text(_error!))
          else
            const Center(child: CircularProgressIndicator()),
          if (game != null) _buildHud(hud),
        ],
      ),
    );
  }

  Widget _buildHud(OnlineGameState hud) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Gio: ${hud.windX}',
                    style: const TextStyle(color: Colors.white, fontSize: 18)),
                const SizedBox(width: 16),
                Text(
                  hud.isMyTurn ? 'LUOT CUA BAN' : 'Doi thu...',
                  style: TextStyle(
                    color: hud.isMyTurn ? Colors.greenAccent : Colors.white70,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Spacer(),
                IconButton(
                  icon: const Icon(Icons.exit_to_app, color: Colors.white),
                  onPressed: () => context.go('/lobby'),
                ),
              ],
            ),
            const Spacer(),
            if (hud.isMyTurn && _game != null)
              FilledButton(
                onPressed: () {
                  final me = _game!.players[0];
                  if (me != null) {
                    ref.read(onlineGameServiceProvider.notifier).shoot(
                      type: 0, gunX: me.x.round(), gunY: (me.y - 20).round(),
                      angle: 45, force: 15,
                    );
                  }
                },
                child: const Text('FIRE (test)'),
              ),
          ],
        ),
      ),
    );
  }
}