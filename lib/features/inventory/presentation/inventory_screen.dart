import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mobiarmy_flutter/features/inventory/application/inventory_controller.dart';
import 'package:mobiarmy_flutter/features/inventory/domain/inventory_item.dart';

class InventoryScreen extends ConsumerStatefulWidget {
  const InventoryScreen({super.key});

  @override
  ConsumerState<InventoryScreen> createState() => _InventoryScreenState();
}

class _InventoryScreenState extends ConsumerState<InventoryScreen> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    Future.microtask(() => ref.read(inventoryControllerProvider.notifier).loadInventory());
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final inventory = ref.watch(inventoryControllerProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Hành trang'),
        bottom: TabBar(
          controller: _tabController,
          tabs: const [
            Tab(text: 'Trang bị'),
            Tab(text: 'Nguyên liệu'),
          ],
        ),
      ),
      body: inventory.isLoading
          ? const Center(child: CircularProgressIndicator())
          : Column(
              children: [
                _PlayerAttributesBar(stats: inventory.characterStats),
                Expanded(
                  child: TabBarView(
                    controller: _tabController,
                    children: [
                      _InventoryGrid(items: inventory.items),
                      _InventoryGrid(items: inventory.materials),
                    ],
                  ),
                ),
              ],
            ),
    );
  }
}

class _PlayerAttributesBar extends StatelessWidget {
  const _PlayerAttributesBar({required this.stats});
  final dynamic stats;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      color: Colors.black12,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _AttributeItem(label: 'HP', value: stats.ability[0]),
          _AttributeItem(label: 'ATK', value: stats.ability[1]),
          _AttributeItem(label: 'DEF', value: stats.ability[2]),
          _AttributeItem(label: 'LUK', value: stats.ability[3]),
          _AttributeItem(label: 'TEAM', value: stats.ability[4]),
        ],
      ),
    );
  }
}

class _AttributeItem extends StatelessWidget {
  const _AttributeItem({required this.label, required this.value});
  final String label;
  final int value;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(label, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 10)),
        Text('$value', style: const TextStyle(fontSize: 12)),
      ],
    );
  }
}

class _InventoryGrid extends StatelessWidget {
  const _InventoryGrid({required this.items});
  final List<InventoryItem> items;

  @override
  Widget build(BuildContext context) {
    if (items.isEmpty) {
      return const Center(child: Text('Trống'));
    }
    return GridView.builder(
      padding: const EdgeInsets.all(16),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 5,
        mainAxisSpacing: 8,
        crossAxisSpacing: 8,
      ),
      itemCount: items.length,
      itemBuilder: (context, index) {
        final item = items[index];
        return _InventoryItemTile(item: item);
      },
    );
  }
}

class _InventoryItemTile extends StatelessWidget {
  const _InventoryItemTile({required this.item});
  final InventoryItem item;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: item.dbKey != -1 ? Colors.blue.shade50 : null,
      child: InkWell(
        onTap: () {
          // TODO: show item detail
        },
        child: Stack(
          children: [
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(item.isMaterial ? Icons.category : Icons.shield, size: 24),
                  const SizedBox(height: 2),
                  Text(
                    item.name,
                    style: const TextStyle(fontSize: 8),
                    textAlign: TextAlign.center,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
            if (item.quantity > 1)
              Positioned(
                right: 2,
                bottom: 2,
                child: Text(
                  'x${item.quantity}',
                  style: const TextStyle(fontSize: 10, fontWeight: FontWeight.bold),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
