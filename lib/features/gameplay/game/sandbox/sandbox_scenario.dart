import 'dart:ui';

import 'package:mobiarmy_flutter/features/gameplay/game/map/destructible_terrain.dart';
import 'package:mobiarmy_flutter/features/gameplay/game/map/game_map_definition.dart';
import 'package:mobiarmy_flutter/features/gameplay/game/map/map_json_loader.dart';
import 'package:mobiarmy_flutter/features/gameplay/game/map/terrain_component.dart';
import 'package:mobiarmy_flutter/features/gameplay/game/player/sandbox_character_component.dart';
import 'package:mobiarmy_flutter/features/gameplay/game/sandbox/sandbox_equipment_data.dart';
import 'package:mobiarmy_flutter/features/gameplay/game/systems/ground_probe.dart';

/// Self-contained offline scenario: real map data + real equipment geometry,
/// no server, no assets required. This is Mốc A from the migration plan.
class SandboxScenario {
  SandboxScenario._({
    required this.map,
    required this.terrain,
    required this.characters,
  });

  final GameMapDefinition map;
  final DestructibleTerrain terrain;
  final List<SandboxCharacterComponent> characters;

  static SandboxScenario build({required int heroIndex}) {
    final map = MapJsonLoader.parse(
      SandboxMaps.cayCauBang,
      mapId: 0,
      backgroundId: 7,
    );
    final terrain = TerrainMaskBuilder.build(
      map,
      tileSize: SandboxMaps.tileSize,
    );
    final probe = GroundProbe(terrain);

    SandboxCharacterComponent spawn(
      int spawnIndex,
      List<dynamic> equipment,
      Color bodyColor,
      int classId,
    ) {
      final point = map.spawnPoints[spawnIndex % map.spawnPoints.length];
      final groundY =
          probe.findGroundBelow(point.x.toDouble(), point.y.toDouble()) ??
          point.y.toDouble();
      final character = SandboxCharacterComponent(
        slotEquipment: {for (final e in equipment) e.slot as dynamic: e},
        bodyColor: bodyColor,
        classId: classId,
      );
      character.moveTo(point.x.toDouble(), groundY);
      return character;
    }

    final heroes = [
      {'color': const Color(0xFFF97316), 'equips': SandboxEquipmentData.gunnerSet(), 'classId': 1},
      {'color': const Color(0xFF22D3EE), 'equips': SandboxEquipmentData.miss6Set(), 'classId': 2},
    ];

    final hero = heroes[heroIndex % heroes.length];

    final characters = [
      spawn(4, hero['equips'] as List<dynamic>, hero['color'] as Color, hero['classId'] as int),
    ];

    return SandboxScenario._(
      map: map,
      terrain: terrain,
      characters: characters,
    );
  }

  static SandboxScenario buildDefault() {
    return build(heroIndex: 0);
  }
}

abstract final class SandboxMaps {
  /// Approximate brick size; real per-tile widths vary (ManagerTile parity
  /// is a Phase-4 item).
  static const int tileSize = 20;

  /// Server map id 0 — "Cây cầu băng" (`map` table, army.sql).
  /// TODO(phase-3): move to assets/maps/map_0.json once the asset pipeline
  /// exists; embedded here so the slice runs with zero asset setup.
  static const String cayCauBang =
      r'''{"width":480,"height":320,"bricks":[{"id":1,"x":0,"y":300},{"id":1,"x":20,"y":300},{"id":1,"x":40,"y":300},{"id":1,"x":60,"y":300},{"id":1,"x":80,"y":300},{"id":1,"x":100,"y":300},{"id":1,"x":120,"y":300},{"id":1,"x":140,"y":300},{"id":1,"x":160,"y":300},{"id":1,"x":180,"y":300},{"id":1,"x":200,"y":300},{"id":1,"x":220,"y":300},{"id":1,"x":240,"y":300},{"id":1,"x":260,"y":300},{"id":1,"x":280,"y":300},{"id":1,"x":300,"y":300},{"id":1,"x":320,"y":300},{"id":1,"x":340,"y":300},{"id":1,"x":360,"y":300},{"id":1,"x":380,"y":300},{"id":1,"x":400,"y":300},{"id":1,"x":420,"y":300},{"id":1,"x":440,"y":300},{"id":1,"x":460,"y":300}],"points":[{"x":120,"y":280},{"x":360,"y":280},{"x":80,"y":280},{"x":400,"y":280},{"x":160,"y":280},{"x":320,"y":280}]}''';
}
