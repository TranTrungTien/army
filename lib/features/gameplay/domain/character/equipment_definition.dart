enum EquipmentSlot { gun, hat, armor, glasses, wing }

class EquipmentFrameGeometry {
  const EquipmentFrameGeometry({required this.sourceX, required this.sourceY, required this.width, required this.height, required this.offsetX, required this.offsetY});
  final int sourceX, sourceY, width, height, offsetX, offsetY;
}

class EquipmentDefinition {
  EquipmentDefinition({required this.id, required this.slot, required this.glassId, required this.atlasId, required List<EquipmentFrameGeometry> frames, this.bulletId = -1}) : frames = List.unmodifiable(frames) {
    if (frames.isEmpty) throw ArgumentError.value(frames, 'frames', 'must not be empty');
  }
  final int id;
  final EquipmentSlot slot;
  final int glassId;
  final String atlasId;
  final List<EquipmentFrameGeometry> frames;
  final int bulletId;

  EquipmentFrameGeometry frame(int index) => frames[index.clamp(0, frames.length - 1).toInt()];
}
