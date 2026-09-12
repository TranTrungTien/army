import 'dart:typed_data';
import 'package:mobiarmy_flutter/features/gameplay/game/map/game_map_definition.dart';
import 'package:mobiarmy_flutter/features/gameplay/game/map/legacy_map_parser.dart';

abstract interface class MapDataSource {
  Future<Uint8List> loadMapBytes(int mapId);
  Future<List<int>> loadEnvironment(int mapId);
  Future<List<SpawnPoint>> loadSpawnPoints(int mapId);
}

class MapRepository {
  MapRepository({
    required this.source,
    LegacyMapParser parser = const LegacyMapParser(),
  }) : _parser = parser;
  final MapDataSource source;
  final LegacyMapParser _parser;
  Future<GameMapDefinition> load(int mapId) async => _parser.parse(
    mapId: mapId,
    data: await source.loadMapBytes(mapId),
    environmentValues: await source.loadEnvironment(mapId),
    spawnPoints: await source.loadSpawnPoints(mapId),
  );
}
