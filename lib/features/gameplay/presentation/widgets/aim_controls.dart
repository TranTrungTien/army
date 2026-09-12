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
          onPressed: () => game.inputController.updateAngle(1),
        ),
        const SizedBox(height: 8),
        _AimButton(
          icon: Icons.keyboard_arrow_down,
          onPressed: () => game.inputController.updateAngle(-1),
        ),
      ],
    );
  }
}

class _AimButton extends StatelessWidget {
  const _AimButton({required this.icon, required this.onPressed});

  final IconData icon;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      // For continuous update, we might want GestureDetector longPress or a custom timer,
      // but let's keep it simple for skeleton.
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
