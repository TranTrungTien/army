import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mobiarmy_flutter/core/audio/audio_provider.dart';
import 'package:mobiarmy_flutter/features/gameplay/application/gameplay_provider.dart';
import 'package:mobiarmy_flutter/shared/overlays/gameplay_hud.dart';
import '../game/army_game.dart';

class GameplayPage extends ConsumerStatefulWidget {
  const GameplayPage({super.key});

  @override
  ConsumerState<GameplayPage> createState() => _GameplayPageState();
}

class _GameplayPageState extends ConsumerState<GameplayPage> {
  late final ArmyGame _game;

  @override
  void initState() {
    super.initState();
    final audio = ref.read(audioServiceProvider);
    _game = ArmyGame(audio: audio);

    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(gameplayHandlerProvider).attachGame(_game);
    });
  }

  @override
  void dispose() {
    ref.read(gameplayHandlerProvider).detachGame();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          GameWidget<ArmyGame>(
            game: _game,
            overlayBuilderMap: {
              'HUD': (context, game) => GameplayHud(game: game),
            },
            initialActiveOverlays: const ['HUD'],
          ),
        ],
      ),
    );
  }
}
