class GlassSlotData {
  const GlassSlotData({
    required this.hasData,
    required this.data,
    required this.equipIds,
  });

  final bool hasData;
  final List<int> data;
  final List<int> equipIds;
}

class ItemStock {
  const ItemStock({required this.num, required this.xu, required this.luong});

  final int num;
  final int xu;
  final int luong;
}

class GlassShopEntry {
  const GlassShopEntry({
    required this.isOpen,
    required this.xu,
    required this.luong,
  });

  final bool isOpen;
  final int xu;
  final int luong;
}

class UserSession {
  const UserSession({
    required this.id,
    required this.xu,
    required this.luong,
    required this.selectGlass,
    required this.glasses,
    required this.items,
    required this.glassShop,
  });

  final int id;
  final int xu;
  final int luong;
  final int selectGlass;
  final List<GlassSlotData> glasses;
  final List<ItemStock> items;
  final List<GlassShopEntry> glassShop;
}
