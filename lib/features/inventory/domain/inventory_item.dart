enum InventoryItemType { consumable, equipment }

class InventoryItem {
  const InventoryItem({
    required this.id,
    required this.name,
    required this.type,
    this.quantity = 0,
    this.equipmentId,
    this.slot,
  });

  final int id;
  final String name;
  final InventoryItemType type;
  final int quantity;
  final int? equipmentId;
  final String? slot;
}
