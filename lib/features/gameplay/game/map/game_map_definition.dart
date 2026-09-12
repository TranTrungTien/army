import 'dart:collection';

class MapFormatException implements FormatException {
  const MapFormatException(this.message, [this.source, this.offset]);
  @override
  final String message;
  @override
  final dynamic source;
  @override
  final int? offset;
}

class SpawnPoint {
  const SpawnPoint({required this.x, required this.y, this.team});
  final int x, y;
  final int? team;
}

class MapBrickDefinition {
  const MapBrickDefinition({
    required this.tileId,
    required this.x,
    required this.y,
    required this.destructible,
  });
  final int tileId, x, y;
  final bool destructible;
}

class MapLayerDefinition {
  const MapLayerDefinition({required this.id, required this.bricks});
  final String id;
  final List<MapBrickDefinition> bricks;
}

class TileSetDefinition {
  const TileSetDefinition({required this.id, required this.tileCount});
  final int id, tileCount;
}

class MapEnvironmentDefinition {
  const MapEnvironmentDefinition({
    required this.backgroundId,
    required this.backgroundY,
    required this.cloudY,
    required this.waterY,
    required this.waterClass,
  });
  final int backgroundId, backgroundY, cloudY, waterY, waterClass;
  bool get hasWaterOrGlass => waterClass != -1;
}

class GameMapDefinition {
  GameMapDefinition({
    required this.id,
    required this.width,
    required this.height,
    required List<MapLayerDefinition> layers,
    required List<SpawnPoint> spawnPoints,
    required this.environment,
  }) : layers = UnmodifiableListView(layers),
       spawnPoints = UnmodifiableListView(spawnPoints);
  final int id, width, height;
  final List<MapLayerDefinition> layers;
  final List<SpawnPoint> spawnPoints;
  final MapEnvironmentDefinition environment;
}
