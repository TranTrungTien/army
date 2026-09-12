import 'dart:io';
import 'dart:typed_data';
import 'package:flutter_test/flutter_test.dart';
import 'package:mobiarmy_flutter/features/gameplay/game/map/game_map_definition.dart';
import 'package:mobiarmy_flutter/features/gameplay/game/map/legacy_map_parser.dart';

void main() {
  test('parses big-endian legacy map payload', () {
    final data = File(
      'test/fixtures/legacy_map_parser_fixture.bin',
    ).readAsBytesSync();
    final map = LegacyMapParser(isUndestroyableTile: (id) => id == 2).parse(
      mapId: 7,
      data: data,
      environmentValues: [4, 20, 30, 140, 0],
      spawnPoints: const [SpawnPoint(x: 10, y: 20)],
    );
    expect(map.width, 320);
    expect(map.height, 180);
    expect(map.layers.single.bricks.length, 3);
    expect(map.layers.single.bricks.last.x, -8);
    expect(map.layers.single.bricks[1].destructible, isFalse);
    expect(map.environment.hasWaterOrGlass, isTrue);
  });
  test('rejects truncated payload', () {
    expect(
      () => const LegacyMapParser().parse(
        mapId: 0,
        data: Uint8List.fromList([0, 1, 0, 1, 1]),
        environmentValues: [0, 0, 0, 0, -1],
      ),
      throwsFormatException,
    );
  });
  test('rejects trailing bytes', () {
    final d = Uint8List.fromList([0, 1, 0, 1, 0, 99]);
    expect(
      () => const LegacyMapParser().parse(
        mapId: 0,
        data: d,
        environmentValues: [0, 0, 0, 0, -1],
      ),
      throwsFormatException,
    );
  });
}
