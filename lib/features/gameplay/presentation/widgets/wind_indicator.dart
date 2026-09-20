import 'package:flutter/material.dart';

class WindIndicator extends StatelessWidget {
  const WindIndicator({
    super.key,
    required this.windX,
    required this.windY,
  });

  final int windX;
  final int windY;

  @override
  Widget build(BuildContext context) {
    final isLeft = windX < 0;
    final absWind = windX.abs();

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
      decoration: BoxDecoration(
        color: Colors.black87,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.orange.withValues(alpha: 0.5), width: 1.5),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (windX != 0)
            Transform.flip(
              flipX: !isLeft, // wind.png usually points left or right, adjust based on convention
              child: Image.asset(
                'assets/wind.png',
                width: 22,
                height: 14,
                fit: BoxFit.contain,
                errorBuilder: (_, _, _) => Icon(
                  isLeft ? Icons.arrow_back : Icons.arrow_forward,
                  color: Colors.lightBlueAccent,
                  size: 16,
                ),
              ),
            ),
          const SizedBox(width: 8),
          Text(
            'WIND: $absWind',
            style: const TextStyle(
              color: Colors.yellow,
              fontWeight: FontWeight.bold,
              fontFamily: 'monospace',
              fontSize: 16,
              shadows: [
                Shadow(blurRadius: 2, color: Colors.black, offset: Offset(1, 1))
              ],
            ),
          ),
        ],
      ),
    );
  }
}
