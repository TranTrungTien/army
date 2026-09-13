enum ShopItemType { equipment, item }

class ShopItem {
  const ShopItem({
    required this.id,
    required this.name,
    required this.priceXu,
    required this.priceLuong,
    required this.type,
    this.description = '',
  });

  final int id;
  final String name;
  final int priceXu;
  final int priceLuong;
  final ShopItemType type;
  final String description;
}
