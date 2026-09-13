import 'package:flutter/material.dart';
import 'dart:math' as math;

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
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: Colors.black54,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.white24),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Icon(Icons.air, color: Colors.lightBlueAccent, size: 16),
          const SizedBox(width: 8),
          if (isLeft)
            const Icon(Icons.arrow_back, color: Colors.white, size: 14),
          Text(
            '$absWind',
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
          if (!isLeft)
            const Icon(Icons.arrow_forward, color: Colors.white, size: 14),
        ],
      ),
    );
  }
}
