import 'package:mobiarmy_flutter/core/network/data_cache_parsers.dart';
import 'package:mobiarmy_flutter/features/gameplay/domain/match_state.dart';
import 'package:mobiarmy_flutter/features/gameplay/game/map/destructible_terrain.dart';
import 'package:mobiarmy_flutter/features/gameplay/game/map/game_map_definition.dart';
import 'package:mobiarmy_flutter/features/gameplay/game/map/map_binary_parser.dart';
import 'package:mobiarmy_flutter/features/gameplay/game/map/terrain_component.dart';

/// Noi MatchState (from startGame cmd 20) -> GameMapDefinition + terrain thuc.
/// Map lay tu valuesdata2 da sync (DataCache.mapFiles), parse bang
/// MapBinaryParser — khong can JSON nua.
class OnlineGameSetup {
  OnlineGameSetup({
    required this.match, required this.map,
    required this.terrain,
  });
  final MatchState match;
  final GameMapDefinition map;
  final DestructibleTerrain terrain;
}

abstract final class GameSessionBootstrap {
  static OnlineGameSetup? build(MatchState match) {
    if (match.mapId < 0 || match.mapId >= DataCache.mapFiles.length) {
      return null;
    }
    final entry = DataCache.mapFiles[match.mapId];
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
    for (final p in match.players.values) {
      spawnPoints.add(SpawnPoint(x: p.x, y: p.y));
    }

    final map = GameMapDefinition(
      id: match.mapId,
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
      match: match, map: map, terrain: terrain,
    );
  }
}
