import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mobiarmy_flutter/app/lifecycle/app_lifecycle_coordinator.dart';
import 'package:mobiarmy_flutter/core/network/connection_lifecycle.dart';
import 'package:mobiarmy_flutter/features/gameplay/application/gameplay_provider.dart';
import 'package:mobiarmy_flutter/features/gameplay/game/army_game.dart';
import 'package:mobiarmy_flutter/features/gameplay/game/sandbox/sandbox_scenario.dart';
import 'package:mobiarmy_flutter/shared/overlays/gameplay_hud.dart';

class GameplaySandboxScreen extends ConsumerStatefulWidget {
  const GameplaySandboxScreen({super.key});

  @override
  ConsumerState<GameplaySandboxScreen> createState() =>
      _GameplaySandboxScreenState();
}

class _GameplaySandboxScreenState extends ConsumerState<GameplaySandboxScreen> {
  late final ArmyGame _game;
  late final AppLifecycleCoordinator _lifecycle;

  @override
  void initState() {
    super.initState();
    final scenario = SandboxScenario.buildDefault();
    _game = ArmyGame(scenario: scenario);
    _lifecycle = AppLifecycleCoordinator(
      game: _game,
      connection: NoopConnectionLifecycle(),
    )..start();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(gameplayHandlerProvider).attachGame(_game);
    });
  }

  @override
  void dispose() {
    ref.read(gameplayHandlerProvider).detachGame();
    _lifecycle.dispose();
    _game.pauseSafely();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
    body: SafeArea(
      child: Stack(
        children: [
          Positioned.fill(
            child: GameWidget<ArmyGame>(
              game: _game,
              overlayBuilderMap: {
                'HUD': (context, game) => GameplayHud(game: game),
              },
              initialActiveOverlays: const ['HUD'],
            ),
          ),
          const Positioned(
            top: 12,
            left: 12,
            child: DecoratedBox(
              decoration: BoxDecoration(
                color: Color(0xAA000000),
                borderRadius: BorderRadius.all(Radius.circular(12)),
              ),
              child: Padding(
                padding: EdgeInsets.all(10),
                child: Text('Gameplay sandbox — offline vertical slice'),
              ),
            ),
          ),
        ],
      ),
    ),
  );
}
