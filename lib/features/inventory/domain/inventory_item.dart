import 'equipment_stats.dart';

class InventoryItem {
  final int dbKey;
  final int id;
  final int icon;
  final int type;
  final int glass;
  final String name;
  final int date;
  final int slot;
  final int vip;
  final int level;
  final int level2;
  final bool isMaterial;
  final String strDetail;
  final int quantity;
  final int bullet;
  final EquipmentStats stats;

  const InventoryItem({
    required this.dbKey,
    required this.id,
    required this.icon,
    required this.type,
    required this.glass,
    required this.name,
    required this.date,
    required this.slot,
    required this.vip,
    required this.level,
    required this.level2,
    required this.isMaterial,
    required this.strDetail,
    required this.quantity,
    required this.bullet,
    required this.stats,
  });

  static const empty = InventoryItem(
    dbKey: -1,
    id: -1,
    icon: -1,
    type: -1,
    glass: -1,
    name: '',
    date: 0,
    slot: 0,
    vip: 0,
    level: 0,
    level2: 0,
    isMaterial: false,
    strDetail: '',
    quantity: 0,
    bullet: -1,
    stats: EquipmentStats.empty,
  );

  /// Compatibility factory for consumable items.
  factory InventoryItem.consumable({
    required int id,
    required String name,
    int quantity = 0,
  }) {
    return InventoryItem(
      dbKey: -1,
      id: id,
      icon: -1,
      type: 0,
      glass: 0,
      name: name,
      date: 0,
      slot: 0,
      vip: 0,
      level: 0,
      level2: 0,
      isMaterial: false,
      strDetail: '',
      quantity: quantity,
      bullet: -1,
      stats: EquipmentStats.empty,
    );
  }
}
