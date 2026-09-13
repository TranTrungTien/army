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
          normalAsset: 'assets/gui/nut1.png',
          pressedAsset: 'assets/gui/nut1_.png',
          onPressedStart: () => game.inputController.setMovingLeft(true),
          onPressedEnd: () => game.inputController.setMovingLeft(false),
        ),
        const SizedBox(width: 16),
        _MoveButton(
          normalAsset: 'assets/gui/nut2.png',
          pressedAsset: 'assets/gui/nut2_.png',
          onPressedStart: () => game.inputController.setMovingRight(true),
          onPressedEnd: () => game.inputController.setMovingRight(false),
        ),
      ],
    );
  }
}

class _MoveButton extends StatefulWidget {
  const _MoveButton({
    required this.normalAsset,
    required this.pressedAsset,
    required this.onPressedStart,
    required this.onPressedEnd,
  });

  final String normalAsset;
  final String pressedAsset;
  final VoidCallback onPressedStart;
  final VoidCallback onPressedEnd;

  @override
  State<_MoveButton> createState() => _MoveButtonState();
}

class _MoveButtonState extends State<_MoveButton> {
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
        width: 46,
        height: 46,
        fit: BoxFit.contain,
        errorBuilder: (context, error, stackTrace) {
          // Fallback to generic shape if asset fails
          return Container(
            width: 46,
            height: 46,
            decoration: BoxDecoration(
              color: _isPressed ? Colors.white24 : Colors.black45,
              shape: BoxShape.circle,
              border: Border.all(color: Colors.white24),
            ),
            child: Icon(
              widget.normalAsset.contains('nut1') ? Icons.arrow_back : Icons.arrow_forward,
              color: Colors.white,
            ),
          );
        },
      ),
    );
  }
}
