import 'package:flutter/material.dart';
import '../../game/army_game.dart';

class AimControls extends StatelessWidget {
  const AimControls({super.key, required this.game});

  final ArmyGame game;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _AimButton(
          icon: Icons.keyboard_arrow_up,
          onPressedStart: () => game.inputController.setAngleDelta(1),
          onPressedEnd: () => game.inputController.setAngleDelta(0),
        ),
        const SizedBox(height: 8),
        _AimButton(
          icon: Icons.keyboard_arrow_down,
          onPressedStart: () => game.inputController.setAngleDelta(-1),
          onPressedEnd: () => game.inputController.setAngleDelta(0),
        ),
      ],
    );
  }
}

class _AimButton extends StatelessWidget {
  const _AimButton({
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
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: Colors.black45,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: Colors.white24),
        ),
        child: Icon(icon, color: Colors.white, size: 24),
      ),
    );
  }
}
