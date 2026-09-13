import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mobiarmy_flutter/features/inventory/application/inventory_controller.dart';
import 'package:mobiarmy_flutter/features/inventory/domain/inventory_item.dart';

class InventoryScreen extends ConsumerStatefulWidget {
  const InventoryScreen({super.key});

  @override
  ConsumerState<InventoryScreen> createState() => _InventoryScreenState();
}

class _InventoryScreenState extends ConsumerState<InventoryScreen> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() => ref.read(inventoryControllerProvider.notifier).loadInventory());
  }

  @override
  Widget build(BuildContext context) {
    final inventory = ref.watch(inventoryControllerProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Hành trang')),
      body: inventory.isLoading
          ? const Center(child: CircularProgressIndicator())
          : GridView.builder(
              padding: const EdgeInsets.all(16),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 5,
                mainAxisSpacing: 8,
                crossAxisSpacing: 8,
              ),
              itemCount: inventory.items.length,
              itemBuilder: (context, index) {
                final item = inventory.items[index];
                return _InventoryItemTile(item: item);
              },
            ),
    );
  }
}

class _InventoryItemTile extends StatelessWidget {
  const _InventoryItemTile({required this.item});
  final InventoryItem item;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Stack(
        children: [
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.inventory_2, size: 32),
                const SizedBox(height: 4),
                Text(item.name, style: const TextStyle(fontSize: 10), textAlign: TextAlign.center),
              ],
            ),
          ),
          Positioned(
            right: 4,
            bottom: 4,
            child: Text(
              'x${item.quantity}',
              style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }
}
