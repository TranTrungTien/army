import 'package:flutter/material.dart';
import 'package:mobiarmy_flutter/features/gameplay/game/army_game.dart';
import 'package:mobiarmy_flutter/features/gameplay/presentation/widgets/aim_controls.dart';
import 'package:mobiarmy_flutter/features/gameplay/presentation/widgets/movement_controls.dart';
import 'package:mobiarmy_flutter/features/gameplay/presentation/widgets/power_bar.dart';

class GameplayHud extends StatelessWidget {
  const GameplayHud({super.key, required this.game});

  final ArmyGame game;

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: game.inputController,
      builder: (context, _) {
        return Stack(
          children: [
            Positioned(
              left: 20,
              bottom: 20,
              child: MovementControls(game: game),
            ),
            Positioned(
              right: 20,
              bottom: 20,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  AimControls(game: game),
                  const SizedBox(width: 20),
                  _FireButton(game: game),
                ],
              ),
            ),
            Positioned(
              left: 0,
              right: 0,
              bottom: 40,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  _AngleDisplay(game: game),
                  const SizedBox(height: 8),
                  SizedBox(
                    width: 300,
                    // Legacy force range is 1..30; PowerBar expects 0..100.
                    child: PowerBar(
                      power: game.inputController.state.force * (100 / 30),
                    ),
                  ),
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}

class _FireButton extends StatelessWidget {
  const _FireButton({required this.game});
  final ArmyGame game;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (_) => game.inputController.startCharging(),
      onTapUp: (_) {
        final force = game.inputController.stopCharging();
        game.fire(force);
      },
      onTapCancel: () => game.inputController.stopCharging(),
      child: Container(
        width: 80,
        height: 80,
        decoration: BoxDecoration(
          color: Colors.red.withOpacity(0.7),
          shape: BoxShape.circle,
          border: Border.all(color: Colors.white, width: 3),
          boxShadow: const [
            BoxShadow(color: Colors.black26, blurRadius: 10, spreadRadius: 2),
          ],
        ),
        child: const Center(
          child: Text(
            'FIRE',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
        ),
      ),
    );
  }
}

class _AngleDisplay extends StatelessWidget {
  const _AngleDisplay({required this.game});
  final ArmyGame game;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
      decoration: BoxDecoration(
        color: Colors.black54,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Text(
        'Angle: ${game.inputController.state.angle}°',
        style: const TextStyle(
          color: Colors.white,
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
