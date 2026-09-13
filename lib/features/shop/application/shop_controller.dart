import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mobiarmy_flutter/features/shop/domain/shop_item.dart';

class ShopState {
  const ShopState({
    this.items = const [],
    this.isLoading = false,
  });

  final List<ShopItem> items;
  final bool isLoading;

  ShopState copyWith({
    List<ShopItem>? items,
    bool? isLoading,
  }) {
    return ShopState(
      items: items ?? this.items,
      isLoading: isLoading ?? this.isLoading,
    );
  }
}

class ShopController extends Notifier<ShopState> {
  @override
  ShopState build() {
    return const ShopState();
  }

  void loadShop() {
    state = state.copyWith(isLoading: true);
    // TODO: fetch from server
    Future.delayed(const Duration(milliseconds: 500), () {
      state = state.copyWith(
        isLoading: false,
        items: [
          const ShopItem(id: 0, name: 'Súng cấp 2', priceXu: 5000, priceLuong: 0, type: ShopItemType.equipment),
          const ShopItem(id: 1, name: 'Nón lá', priceXu: 2000, priceLuong: 0, type: ShopItemType.equipment),
          const ShopItem(id: 2, name: 'Hồi máu (x10)', priceXu: 1000, priceLuong: 5, type: ShopItemType.item),
        ],
      );
    });
  }

  Future<void> buyItem(int itemId, bool useLuong) async {
    // TODO: send buy packet
  }
}

final shopControllerProvider = NotifierProvider<ShopController, ShopState>(ShopController.new);
