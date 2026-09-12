import 'dart:typed_data';
import 'package:mobiarmy_flutter/features/gameplay/game/map/game_map_definition.dart';

class LegacyMapParser {
  const LegacyMapParser({this.isUndestroyableTile = neverUndestroyable});
  final bool Function(int tileId) isUndestroyableTile;
  static bool neverUndestroyable(int _) => false;

  GameMapDefinition parse({
    required int mapId,
    required Uint8List data,
    required List<int> environmentValues,
    List<SpawnPoint> spawnPoints = const [],
  }) {
    if (environmentValues.length < 5) {
      throw const MapFormatException('Map environment requires 5 values');
    }
    if (data.length < 5) {
      throw const MapFormatException('Map payload too short');
    }
    final reader = _Reader(data);
    final width = reader.u16();
    final height = reader.u16();
    final count = reader.u8();
    final requiredLength = 5 + count * 5;
    if (data.length < requiredLength) {
      throw MapFormatException('Truncated brick list', data, data.length);
    }
    final bricks = <MapBrickDefinition>[];
    for (var i = 0; i < count; i++) {
      final tileId = reader.u8();
      final x = reader.i16();
      final y = reader.i16();
      bricks.add(
        MapBrickDefinition(
          tileId: tileId,
          x: x,
          y: y,
          destructible: !isUndestroyableTile(tileId),
        ),
      );
    }
    if (reader.offset != data.length) {
      throw MapFormatException(
        'Unexpected trailing map bytes',
        data,
        reader.offset,
      );
    }
    return GameMapDefinition(
      id: mapId,
      width: width,
      height: height,
      layers: [
        MapLayerDefinition(id: 'terrain', bricks: List.unmodifiable(bricks)),
      ],
      spawnPoints: spawnPoints,
      environment: MapEnvironmentDefinition(
        backgroundId: environmentValues[0],
        backgroundY: environmentValues[1],
        cloudY: environmentValues[2],
        waterY: environmentValues[3],
        waterClass: environmentValues[4],
      ),
    );
  }
}

class _Reader {
  _Reader(this.data);
  final Uint8List data;
  int offset = 0;
  int u8() => data[offset++];
  int u16() {
    final v = (data[offset] << 8) | data[offset + 1];
    offset += 2;
    return v;
  }

  int i16() {
    final v = u16();
    return v >= 0x8000 ? v - 0x10000 : v;
  }
}
