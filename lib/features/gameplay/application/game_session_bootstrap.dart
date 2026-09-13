import 'package:mobiarmy_flutter/core/network/data_cache_parsers.dart';
import 'package:mobiarmy_flutter/features/gameplay/application/game_start_handler.dart';
import 'package:mobiarmy_flutter/features/gameplay/game/map/destructible_terrain.dart';
import 'package:mobiarmy_flutter/features/gameplay/game/map/game_map_definition.dart';
import 'package:mobiarmy_flutter/features/gameplay/game/map/map_binary_parser.dart';
import 'package:mobiarmy_flutter/features/gameplay/game/map/terrain_component.dart';

/// Noi GameSessionStart (cmd 20) -> GameMapDefinition + terrain thuc.
/// Map lay tu valuesdata2 da sync (DataCache.mapFiles), parse bang
/// MapBinaryParser — khong can JSON nua.
class OnlineGameSetup {
  OnlineGameSetup({
    required this.session, required this.map,
    required this.terrain, required this.spawnPoints,
  });
  final GameSessionStart session;
  final GameMapDefinition map;
  final DestructibleTerrain terrain;
  final List<SpawnPoint> spawnPoints;
}

abstract final class GameSessionBootstrap {
  static OnlineGameSetup? build(GameSessionStart session) {
    if (session.mapId < 0 || session.mapId >= DataCache.mapFiles.length) {
      return null;
    }
    final entry = DataCache.mapFiles[session.mapId];
    final bin = MapBinaryParser.parse(entry.data);

    // Brick rects tu nhi phan. tileSize approximation 20px —
    // nang cap: rasterize anh tile (pixel alpha) khi co tiledata2.
    final bricks = [
      for (final b in bin.bricks)
        MapBrickDefinition(
          tileId: b.tileId, x: b.x, y: b.y,
          destructible: true, // TODO: dung idNotCollision (cmd 92) de danh dau
        ),
    ];

    final spawnPoints = <SpawnPoint>[];
    for (var i = 0; i < session.playerX.length; i++) {
      if (session.playerX[i] != -1) {
        spawnPoints.add(SpawnPoint(x: session.playerX[i], y: session.playerY[i]));
      }
    }

    final map = GameMapDefinition(
      id: session.mapId,
      width: bin.width,
      height: bin.height,
      layers: [MapLayerDefinition(id: 'terrain', bricks: bricks)],
      spawnPoints: spawnPoints,
      environment: MapEnvironmentDefinition(
        backgroundId: entry.values[0],
        backgroundY: entry.values[1],
        cloudY: entry.values[2],
        waterY: bin.height,
        waterClass: -1,
      ),
    );

    final terrain = TerrainMaskBuilder.build(map, tileSize: 20);
    return OnlineGameSetup(
      session: session, map: map, terrain: terrain, spawnPoints: spawnPoints,
    );
  }
}