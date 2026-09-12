import 'package:mobiarmy_flutter/features/gameplay/domain/character/equipment_definition.dart';

class CharacterAppearance {
  CharacterAppearance({required this.characterType, required Map<EquipmentSlot, int> equipmentIds}) : equipmentIds = Map.unmodifiable(equipmentIds);
  final int characterType;
  final Map<EquipmentSlot, int> equipmentIds;
  int? operator [](EquipmentSlot slot) => equipmentIds[slot];
  CharacterAppearance equip(EquipmentSlot slot, int? id) {
    final next = Map<EquipmentSlot, int>.of(equipmentIds);
    id == null ? next.remove(slot) : next[slot] = id;
    return CharacterAppearance(characterType: characterType, equipmentIds: next);
  }
}
