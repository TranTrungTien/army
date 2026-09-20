import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mobiarmy_flutter/features/authentication/application/auth_controller.dart';
import 'package:mobiarmy_flutter/features/gameplay/application/chat_controller.dart';
import 'package:mobiarmy_flutter/features/gameplay/application/gameplay_controller.dart';
import 'package:mobiarmy_flutter/features/gameplay/game/army_game.dart';
import 'package:mobiarmy_flutter/features/gameplay/presentation/widgets/aim_controls.dart';
import 'package:mobiarmy_flutter/features/gameplay/presentation/widgets/movement_controls.dart';
import 'package:mobiarmy_flutter/features/gameplay/presentation/widgets/power_bar.dart';
import 'package:mobiarmy_flutter/features/gameplay/presentation/widgets/wind_indicator.dart';
import 'package:mobiarmy_flutter/shared/overlays/match_result_overlay.dart';

class GameplayHud extends ConsumerWidget {
  const GameplayHud({super.key, required this.game});

  final ArmyGame game;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final gameplayState = ref.watch(gameplayControllerProvider);
    final isOffline = gameplayState == null;

    final chatMessages = ref.watch(chatControllerProvider);
    final myId = ref.watch(authControllerProvider).session?.id;

    final isMyTurn = isOffline || (gameplayState.currentTurnPlayerId != null && gameplayState.currentTurnPlayerId == myId);
    final windX = gameplayState?.windX ?? 0;
    final windY = gameplayState?.windY ?? 0;
    final turnTime = gameplayState?.turnTimeSeconds ?? 0;
    final matchResult = gameplayState?.matchResult;

    return ListenableBuilder(
      listenable: game.inputController,
      builder: (context, _) {
        return Stack(
          children: [
            if (isMyTurn && matchResult == null)
              Positioned(
                left: 10,
                bottom: 10,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    MovementControls(game: game),
                    const SizedBox(height: 4),
                    _AngleDisplay(game: game),
                  ],
                ),
              ),
            if (isMyTurn && matchResult == null)
              Positioned(
                right: 10,
                bottom: 10,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    _SkipButton(game: game, isOffline: isOffline),
                    const SizedBox(height: 8),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        AimControls(game: game),
                        const SizedBox(width: 8),
                        _FireButton(game: game, isOffline: isOffline),
                      ],
                    ),
                  ],
                ),
              ),
            Positioned(
              left: 0,
              right: 0,
              bottom: 5,
              child: Center(
                child: SizedBox(
                  width: 180,
                  height: 12,
                  child: PowerBar(
                    power: game.inputController.state.force * (100 / 30),
                  ),
                ),
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
  const _FireButton({required this.game, this.isOffline = false});
  final ArmyGame game;
  final bool isOffline;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return GestureDetector(
      onTapDown: (_) => game.inputController.startCharging(),
      onTapUp: (_) {
        final force = game.inputController.stopCharging();
        if (isOffline) {
          game.fire(force);
        } else {
          final angle = game.inputController.state.angle;
          ref.read(gameplayControllerProvider.notifier).shoot(
                angle,
                force.round(),
                0, // force2
                1, // nShot
              );
        }
      },
      onTapCancel: () => game.inputController.stopCharging(),
      child: Container(
        width: 60,
        height: 60,
        decoration: BoxDecoration(
          color: Colors.red.withValues(alpha: 0.7),
          shape: BoxShape.circle,
          border: Border.all(color: Colors.white, width: 2),
          boxShadow: const [
            BoxShadow(color: Colors.black26, blurRadius: 5, spreadRadius: 1),
          ],
        ),
        child: const Center(
          child: Text(
            'FIRE',
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

class _SkipButton extends ConsumerWidget {
  const _SkipButton({required this.game, this.isOffline = false});
  final ArmyGame game;
  final bool isOffline;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return GestureDetector(
      onTap: () {
        if (!isOffline) {
          ref.read(gameplayControllerProvider.notifier).skipTurn();
        }
      },
      child: Container(
        width: 45,
        height: 45,
        decoration: BoxDecoration(
          color: Colors.orange.withValues(alpha: 0.7),
          shape: BoxShape.circle,
          border: Border.all(color: Colors.white, width: 1.5),
          boxShadow: const [
            BoxShadow(color: Colors.black26, blurRadius: 4, spreadRadius: 1),
          ],
        ),
        child: const Center(
          child: Text(
            'SKIP',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 10,
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
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
      decoration: BoxDecoration(
        color: Colors.black54,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Text(
        'Góc: ${game.inputController.state.angle}°',
        style: const TextStyle(
          color: Colors.white,
          fontSize: 12,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
