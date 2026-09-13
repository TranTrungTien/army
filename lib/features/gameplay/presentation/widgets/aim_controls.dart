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
          normalAsset: 'assets/gui/nut_up.png',
          pressedAsset: 'assets/gui/nut_up_.png',
          fallbackIcon: Icons.keyboard_arrow_up,
          onPressedStart: () => game.inputController.setAngleDelta(1),
          onPressedEnd: () => game.inputController.setAngleDelta(0),
        ),
        const SizedBox(height: 12),
        _AimButton(
          normalAsset: 'assets/gui/nut_down.png',
          pressedAsset: 'assets/gui/nut_down_.png',
          fallbackIcon: Icons.keyboard_arrow_down,
          onPressedStart: () => game.inputController.setAngleDelta(-1),
          onPressedEnd: () => game.inputController.setAngleDelta(0),
        ),
      ],
    );
  }
}

class _AimButton extends StatefulWidget {
  const _AimButton({
    required this.normalAsset,
    required this.pressedAsset,
    required this.fallbackIcon,
    required this.onPressedStart,
    required this.onPressedEnd,
  });

  final String normalAsset;
  final String pressedAsset;
  final IconData fallbackIcon;
  final VoidCallback onPressedStart;
  final VoidCallback onPressedEnd;

  @override
  State<_AimButton> createState() => _AimButtonState();
}

class _AimButtonState extends State<_AimButton> {
  bool _isPressed = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (_) {
        setState(() => _isPressed = true);
        widget.onPressedStart();
      },
      onTapUp: (_) {
        setState(() => _isPressed = false);
        widget.onPressedEnd();
      },
      onTapCancel: () {
        setState(() => _isPressed = false);
        widget.onPressedEnd();
      },
      child: Image.asset(
        _isPressed ? widget.pressedAsset : widget.normalAsset,
        width: 40,
        height: 40,
        fit: BoxFit.contain,
        errorBuilder: (context, error, stackTrace) {
          return Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: _isPressed ? Colors.white24 : Colors.black45,
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: Colors.white24),
            ),
            child: Icon(widget.fallbackIcon, color: Colors.white),
          );
        },
      ),
    );
  }
}
