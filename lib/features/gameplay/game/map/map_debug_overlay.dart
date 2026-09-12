import 'dart:ui';
import 'package:flame/components.dart';
import 'package:mobiarmy_flutter/features/gameplay/game/map/game_map_definition.dart';

class MapDebugOverlay extends PositionComponent {
  MapDebugOverlay({required this.definition});
  final GameMapDefinition definition;
  @override
  void render(Canvas canvas) {
    final p = Paint()..color = const Color(0xff22c55e);
    for (final s in definition.spawnPoints) {
      canvas.drawCircle(Offset(s.x.toDouble(), s.y.toDouble()), 5, p);
    }
  }
}
