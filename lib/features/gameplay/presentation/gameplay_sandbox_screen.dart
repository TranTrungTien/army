import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mobiarmy_flutter/app/lifecycle/app_lifecycle_coordinator.dart';
import 'package:mobiarmy_flutter/core/audio/audio_provider.dart';
import 'package:mobiarmy_flutter/core/network/connection_lifecycle.dart';
import 'package:mobiarmy_flutter/features/gameplay/application/gameplay_provider.dart';
import 'package:mobiarmy_flutter/features/gameplay/application/gameplay_controller.dart';
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
    final matchState = ref.read(gameplayControllerProvider);
    final audio = ref.read(audioServiceProvider);

    if (matchState != null) {
      _game = ArmyGame(audio: audio);
    } else {
      final scenario = SandboxScenario.buildDefault();
      _game = ArmyGame(scenario: scenario, audio: audio);
    }

    _lifecycle = AppLifecycleCoordinator(
      game: _game,
      connection: NoopConnectionLifecycle(),
    )..start();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(gameplayHandlerProvider).attachGame(_game);
      if (matchState != null) {
        _game.setupMatch(matchState);
      }
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
  Widget build(BuildContext context) {
    final matchState = ref.watch(gameplayControllerProvider);
    final isOnline = matchState != null;

    return Scaffold(
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
            Positioned(
              top: 12,
              left: 12,
              child: DecoratedBox(
                decoration: const BoxDecoration(
                  color: Color(0xAA000000),
                  borderRadius: BorderRadius.all(Radius.circular(12)),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Text(
                    isOnline
                        ? 'MobiArmy Online — Live Match'
                        : 'Gameplay sandbox — offline vertical slice',
                    style: const TextStyle(color: Colors.white, fontSize: 12),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
