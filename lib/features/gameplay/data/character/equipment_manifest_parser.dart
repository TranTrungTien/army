import 'dart:convert';
import 'package:mobiarmy_flutter/features/gameplay/domain/character/equipment_definition.dart';

class EquipmentManifestParser {
  const EquipmentManifestParser();
  List<EquipmentDefinition> parse(String source) {
    final value = jsonDecode(source);
    if (value is! Map<String, dynamic> || value['schemaVersion'] != 1)
      throw const FormatException('Unsupported equipment manifest schema');
    final ids = <String>{};
    return (value['equipment'] as List<dynamic>)
        .map((raw) {
          final map = raw as Map<String, dynamic>;
          final id = map['id'] as int;
          final glassId = map['glassId'] as int;
          final key = '$glassId/${map['slot']}/$id';
          if (!ids.add(key)) throw FormatException('Duplicate equipment: $key');
          final frames = (map['frames'] as List<dynamic>)
              .map((frameRaw) {
                final frame = frameRaw as Map<String, dynamic>;
                final geometry = EquipmentFrameGeometry(
                  sourceX: frame['x'] as int,
                  sourceY: frame['y'] as int,
                  width: frame['w'] as int,
                  height: frame['h'] as int,
                  offsetX: frame['dx'] as int,
                  offsetY: frame['dy'] as int,
                );
                if (geometry.width <= 0 || geometry.height <= 0)
                  throw FormatException('Invalid frame size: $key');
                return geometry;
              })
              .toList(growable: false);
          return EquipmentDefinition(
            id: id,
            slot: EquipmentSlot.values.byName(map['slot'] as String),
            glassId: glassId,
            atlasId: map['atlasId'] as String,
            frames: frames,
            bulletId: map['bulletId'] as int? ?? -1,
          );
        })
        .toList(growable: false);
  }
}
