import 'dart:typed_data';
import 'dart:ui' as ui;

import 'package:flame/components.dart';
import 'package:mobiarmy_flutter/features/gameplay/game/map/destructible_terrain.dart';
import 'package:mobiarmy_flutter/features/gameplay/game/map/game_map_definition.dart';

/// Builds a pixel collision mask from brick metadata matching alpha bounds.
abstract final class TerrainMaskBuilder {
  static DestructibleTerrain build(GameMapDefinition map, {int tileSize = 20}) {
    final mask = Uint8List(map.width * map.height);
    for (final layer in map.layers) {
      for (final brick in layer.bricks) {
        final x0 = brick.x.clamp(0, map.width);
        final x1 = (brick.x + tileSize).clamp(0, map.width);
        final y0 = brick.y.clamp(0, map.height);
        final y1 = (brick.y + tileSize).clamp(0, map.height);
        for (var y = y0; y < y1; y++) {
          final row = y * map.width;
          for (var x = x0; x < x1; x++) {
            mask[row + x] = 1;
          }
        }
      }
    }
    return DestructibleTerrain(
      width: map.width,
      height: map.height,
      initialMask: mask,
    );
  }
}

/// Renders the destructible terrain from the collision mask using Nearest-Neighbor filtering.
class TerrainComponent extends PositionComponent {
  TerrainComponent({
    required DestructibleTerrain terrain,
    this.cellSize = 2,
    this.groundColor = const ui.Color(0xFFB0E2FF),
  }) : _terrain = terrain,
       super(
         size: Vector2(terrain.width.toDouble(), terrain.height.toDouble()),
         priority: 0,
       );

  final DestructibleTerrain _terrain;
  final int cellSize;
  final ui.Color groundColor;

  ui.Picture? _cache;

  void makeHole(int centerX, int centerY, int radius) {
    _terrain.makeHole(centerX, centerY, radius);
    _cache = null;
  }

  ui.Picture _buildCache() {
    final recorder = ui.PictureRecorder();
    final canvas = ui.Canvas(recorder);
    final paint = ui.Paint()
      ..color = groundColor
      ..filterQuality = ui.FilterQuality.none;
    final linePaint = ui.Paint()
      ..color = ui.Color(0xFF000000).withValues(alpha: 0.1)
      ..strokeWidth = 1
      ..filterQuality = ui.FilterQuality.none;

    final w = _terrain.width, h = _terrain.height;
    for (var cy = 0; cy < h; cy += cellSize) {
      for (var cx = 0; cx < w; cx += cellSize) {
        if (_terrain.isSolid(cx, cy)) {
          canvas.drawRect(
            ui.Rect.fromLTWH(
              cx.toDouble(),
              cy.toDouble(),
              cellSize.toDouble(),
              cellSize.toDouble(),
            ),
            paint,
          );

          if (cx % 16 == 0 && cy % 8 == 0) {
             canvas.drawLine(
               ui.Offset(cx.toDouble(), cy.toDouble()),
               ui.Offset(cx.toDouble() + 16, cy.toDouble()),
               linePaint,
             );
             canvas.drawLine(
               ui.Offset(cx.toDouble(), cy.toDouble()),
               ui.Offset(cx.toDouble(), cy.toDouble() + 8),
               linePaint,
             );
          }
        }
      }
    }
    return recorder.endRecording();
  }

  @override
  void render(ui.Canvas canvas) {
    _cache ??= _buildCache();
    canvas.drawPicture(_cache!);
  }

  @override
  void onRemove() {
    _cache?.dispose();
    _cache = null;
    super.onRemove();
  }
}
