import 'dart:ui';
import 'package:flame/components.dart';
import 'package:mobiarmy_flutter/features/gameplay/game/map/game_map_definition.dart';

class MapComponent extends PositionComponent {
  MapComponent({
    required this.definition,
    required this.tileSize,
    this.debug = false,
  }) : super(
         size: Vector2(
           definition.width.toDouble(),
           definition.height.toDouble(),
         ),
       );
  final GameMapDefinition definition;
  final Vector2 tileSize;
  final bool debug;
  final Paint _fallback = Paint()..color = const Color(0xff64748b);
  @override
  void render(Canvas canvas) {
    super.render(canvas);
    for (final layer in definition.layers) {
      for (final brick in layer.bricks) {
        canvas.drawRect(
          Rect.fromLTWH(
            brick.x.toDouble(),
            brick.y.toDouble(),
            tileSize.x,
            tileSize.y,
          ),
          _fallback,
        );
      }
    }
    if (debug) {
      final p = Paint()
        ..color = const Color(0xffff00ff)
        ..style = PaintingStyle.stroke;
      canvas.drawRect(Rect.fromLTWH(0, 0, size.x, size.y), p);
    }
  }
}
