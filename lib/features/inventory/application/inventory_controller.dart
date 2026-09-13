import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mobiarmy_flutter/features/inventory/domain/inventory_item.dart';

class InventoryState {
  const InventoryState({
    this.items = const [],
    this.isLoading = false,
  });

  final List<InventoryItem> items;
  final bool isLoading;

  InventoryState copyWith({
    List<InventoryItem>? items,
    bool? isLoading,
  }) {
    return InventoryState(
      items: items ?? this.items,
      isLoading: isLoading ?? this.isLoading,
    );
  }
}

class InventoryController extends Notifier<InventoryState> {
  @override
  InventoryState build() {
    return const InventoryState();
  }

  void loadInventory() {
    state = state.copyWith(isLoading: true);
    // TODO: fetch from server
    Future.delayed(const Duration(milliseconds: 500), () {
      state = state.copyWith(
        isLoading: false,
        items: [
          const InventoryItem(id: 0, name: 'Hồi máu', type: InventoryItemType.consumable, quantity: 5),
          const InventoryItem(id: 1, name: 'Bay', type: InventoryItemType.consumable, quantity: 2),
          const InventoryItem(id: 2, name: 'X2', type: InventoryItemType.consumable, quantity: 3),
        ],
      );
    });
  }
}

final inventoryControllerProvider = NotifierProvider<InventoryController, InventoryState>(InventoryController.new);
