import 'package:flame/sprite.dart';
import 'package:mobiarmy_flutter/core/assets/sprite_atlas_repository.dart';
import 'package:mobiarmy_flutter/features/gameplay/domain/character/character_definition.dart';
import 'package:mobiarmy_flutter/features/gameplay/domain/character/equipment_definition.dart';

class ResolvedCharacterFrame {
  const ResolvedCharacterFrame({
    required this.sprite,
    required this.offsetX,
    required this.offsetY,
  });
  final Sprite sprite;
  final double offsetX, offsetY;
}

class CharacterSpriteResolver {
  CharacterSpriteResolver({
    required this.atlases,
    required Map<int, CharacterDefinition> characters,
    required Iterable<EquipmentDefinition> equipment,
  }) : characters = Map.unmodifiable(characters),
       equipment = Map.unmodifiable({
         for (final item in equipment)
           _key(item.glassId, item.slot, item.id): item,
       });
  final SpriteAtlasRepository atlases;
  final Map<int, CharacterDefinition> characters;
  final Map<String, EquipmentDefinition> equipment;
  static String _key(int glassId, EquipmentSlot slot, int id) =>
      '$glassId/${slot.name}/$id';

  ResolvedCharacterFrame? resolveEquipment({
    required int glassId,
    required EquipmentSlot slot,
    required int equipmentId,
    required int frame,
  }) {
    final definition = equipment[_key(glassId, slot, equipmentId)];
    if (definition == null) return null;
    final geometry = definition.frame(frame);
    return ResolvedCharacterFrame(
      sprite: atlases.frame(definition.atlasId, '${definition.id}_$frame'),
      offsetX: geometry.offsetX.toDouble(),
      offsetY: geometry.offsetY.toDouble(),
    );
  }
}
