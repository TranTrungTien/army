import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
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
    _game = ArmyGame();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          GameWidget(game: _game),
          // HUD Overlay
          Positioned(bottom: 20, left: 20, child: _buildControls()),
        ],
      ),
    );
  }

  Widget _buildControls() {
    return Row(
      children: [
        IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {},
        ),
        IconButton(
          icon: const Icon(Icons.arrow_forward, color: Colors.white),
          onPressed: () {},
        ),
        const SizedBox(width: 20),
        ElevatedButton(
          onPressed: () {
            // Test shooting
          },
          child: const Text('SHOOT'),
        ),
      ],
    );
  }
}
