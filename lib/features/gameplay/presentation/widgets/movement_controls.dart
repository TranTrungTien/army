import 'package:flutter/material.dart';
import '../../game/army_game.dart';

class MovementControls extends StatelessWidget {
  const MovementControls({super.key, required this.game});

  final ArmyGame game;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        _MoveButton(
          icon: Icons.arrow_back,
          onPressedStart: () => game.inputController.setMovingLeft(true),
          onPressedEnd: () => game.inputController.setMovingLeft(false),
        ),
        const SizedBox(width: 8),
        _MoveButton(
          icon: Icons.arrow_forward,
          onPressedStart: () => game.inputController.setMovingRight(true),
          onPressedEnd: () => game.inputController.setMovingRight(false),
        ),
      ],
    );
  }
}

class _MoveButton extends StatelessWidget {
  const _MoveButton({
    required this.icon,
    required this.onPressedStart,
    required this.onPressedEnd,
  });

  final IconData icon;
  final VoidCallback onPressedStart;
  final VoidCallback onPressedEnd;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (_) => onPressedStart(),
      onTapUp: (_) => onPressedEnd(),
      onTapCancel: () => onPressedEnd(),
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: Colors.black45,
          shape: BoxShape.circle,
          border: Border.all(color: Colors.white24),
        ),
        child: Icon(icon, color: Colors.white, size: 32),
      ),
    );
  }
}
