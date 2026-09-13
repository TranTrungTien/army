import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mobiarmy_flutter/features/authentication/application/auth_controller.dart';
import 'package:mobiarmy_flutter/features/gameplay/application/chat_controller.dart';
import 'package:mobiarmy_flutter/features/gameplay/application/gameplay_controller.dart';
import 'package:mobiarmy_flutter/shared/overlays/match_result_overlay.dart';
import 'package:mobiarmy_flutter/features/gameplay/game/army_game.dart';
import 'package:mobiarmy_flutter/features/gameplay/presentation/widgets/aim_controls.dart';
import 'package:mobiarmy_flutter/features/gameplay/presentation/widgets/movement_controls.dart';
import 'package:mobiarmy_flutter/features/gameplay/presentation/widgets/power_bar.dart';
import 'package:mobiarmy_flutter/features/gameplay/presentation/widgets/wind_indicator.dart';

class GameplayHud extends ConsumerWidget {
  const GameplayHud({super.key, required this.game});

  final ArmyGame game;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final chatMessages = ref.watch(chatControllerProvider);
    final myId = ref.watch(authControllerProvider).session?.id;
    final isMyTurn = ref.watch(gameplayControllerProvider.select(
      (s) => s?.currentTurnPlayerId != null && s?.currentTurnPlayerId == myId,
    ));
    final windX = ref.watch(gameplayControllerProvider.select((s) => s?.windX ?? 0));
    final windY = ref.watch(gameplayControllerProvider.select((s) => s?.windY ?? 0));
    final turnTime = ref.watch(gameplayControllerProvider.select((s) => s?.turnTimeSeconds ?? 0));
    final matchResult = ref.watch(gameplayControllerProvider.select((s) => s?.matchResult));

    return ListenableBuilder(
      listenable: game.inputController,
      builder: (context, _) {
        return Stack(
          children: [
            if (isMyTurn && matchResult == null)
              Positioned(
                left: 20,
                bottom: 20,
                child: MovementControls(game: game),
              ),
            if (isMyTurn && matchResult == null)
              Positioned(
                right: 20,
                bottom: 20,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    AimControls(game: game),
                    const SizedBox(width: 20),
                    _SkipButton(game: game),
                    const SizedBox(width: 12),
                    _FireButton(game: game),
                  ],
                ),
              ),
            Positioned(
              left: 0,
              right: 0,
              bottom: 10,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      _AngleDisplay(game: game),
                      const SizedBox(width: 20),
                      SizedBox(
                        width: 240,
                        child: PowerBar(
                          power: game.inputController.state.force * (100 / 30),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            if (matchResult == null)
              Positioned(
                top: 10,
                left: 0,
                right: 0,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    WindIndicator(windX: windX, windY: windY),
                    const SizedBox(height: 4),
                    _TurnTimer(seconds: turnTime),
                  ],
                ),
              ),
            if (matchResult != null)
              MatchResultOverlay(
                game: game,
                result: matchResult,
                onClose: () {
                  // Navigation back to lobby via state change
                  ref.read(gameplayControllerProvider.notifier).leaveMatch();
                },
              ),
            Positioned(
              left: 20,
              top: 60,
              child: SizedBox(
                width: 250,
                height: 150,
                child: ListView.builder(
                  itemCount: chatMessages.length,
                  itemBuilder: (context, index) {
                    final msg = chatMessages[index];
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 2),
                      child: Text(
                        '${msg.sender}: ${msg.text}',
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                          shadows: [Shadow(blurRadius: 2, color: Colors.black)],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}

class _TurnTimer extends StatelessWidget {
  const _TurnTimer({required this.seconds});
  final int seconds;

  @override
  Widget build(BuildContext context) {
    final color = seconds <= 5 ? Colors.red : Colors.white;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 2),
      decoration: BoxDecoration(
        color: Colors.black38,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Text(
        '$seconds',
        style: TextStyle(
          color: color,
          fontSize: 24,
          fontWeight: FontWeight.bold,
          shadows: const [Shadow(blurRadius: 4, color: Colors.black)],
        ),
      ),
    );
  }
}

class _FireButton extends ConsumerWidget {
  const _FireButton({required this.game});
  final ArmyGame game;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return GestureDetector(
      onTapDown: (_) => game.inputController.startCharging(),
      onTapUp: (_) {
        final force = game.inputController.stopCharging();
        // game.fire(force); // This was for offline sandbox
        final angle = game.inputController.state.angle;
        ref.read(gameplayControllerProvider.notifier).shoot(
              angle,
              force.round(),
              0, // force2
              1, // nShot
            );
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

class _SkipButton extends ConsumerWidget {
  const _SkipButton({required this.game});
  final ArmyGame game;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return GestureDetector(
      onTap: () => ref.read(gameplayControllerProvider.notifier).skipTurn(),
      child: Container(
        width: 60,
        height: 60,
        decoration: BoxDecoration(
          color: Colors.orange.withOpacity(0.7),
          shape: BoxShape.circle,
          border: Border.all(color: Colors.white, width: 2),
          boxShadow: const [
            BoxShadow(color: Colors.black26, blurRadius: 6, spreadRadius: 1),
          ],
        ),
        child: const Center(
          child: Text(
            'SKIP',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 14,
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
