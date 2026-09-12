import 'dart:convert';

import 'package:mobiarmy_flutter/features/gameplay/game/map/game_map_definition.dart';

/// Parses MobiArmy2 server-style map JSON (as stored in the `map` table of
/// army.sql). This is the canonical FE map format going forward; the legacy
/// binary .map parser is only needed for asset parity checks.
class MapJsonLoader {
  const MapJsonLoader._();

  static GameMapDefinition parse(
    String source, {
    required int mapId,
    int backgroundId = 7,
    int backgroundY = 0,
    int cloudY = 0,
  }) {
    final value = jsonDecode(source);
    if (value is! Map<String, dynamic>) {
      throw const MapFormatException('Map JSON root must be an object');
    }

    final width = value['width'] as int?;
    final height = value['height'] as int?;
    if (width == null || height == null || width <= 0 || height <= 0) {
      throw const MapFormatException('Map JSON requires positive width/height');
    }

    final bricks = <MapBrickDefinition>[];
    final rawBricks = value['bricks'];
    if (rawBricks is List) {
      for (final raw in rawBricks) {
        final b = raw as Map<String, dynamic>;
        bricks.add(
          MapBrickDefinition(
            tileId: b['id'] as int,
            x: b['x'] as int,
            y: b['y'] as int,
            destructible: true,
          ),
        );
      }
    }

    final spawnPoints = <SpawnPoint>[];
    final rawPoints = value['points'];
    if (rawPoints is List) {
      var index = 0;
      for (final raw in rawPoints) {
        final p = raw as Map<String, dynamic>;
        spawnPoints.add(
          SpawnPoint(
            x: p['x'] as int,
            y: p['y'] as int,
            team: index.isEven ? 0 : 1,
          ),
        );
        index++;
      }
    }

    return GameMapDefinition(
      id: mapId,
      width: width,
      height: height,
      layers: [
        MapLayerDefinition(id: 'terrain', bricks: List.unmodifiable(bricks)),
      ],
      spawnPoints: List.unmodifiable(spawnPoints),
      environment: MapEnvironmentDefinition(
        backgroundId: backgroundId,
        backgroundY: backgroundY,
        cloudY: cloudY,
        waterY: height,
        waterClass: -1,
      ),
    );
  }
}
