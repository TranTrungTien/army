import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logging/logging.dart';
import 'package:mobiarmy_flutter/core/network/command/commands.dart';
import 'package:mobiarmy_flutter/core/network/dispatcher/message_dispatcher.dart';
import 'package:mobiarmy_flutter/core/network/network_provider.dart';
import 'package:mobiarmy_flutter/core/network/protocol/message.dart';
import 'package:mobiarmy_flutter/features/inventory/data/inventory_packet_mapper.dart';
import 'package:mobiarmy_flutter/features/inventory/data/inventory_repository.dart';
import 'package:mobiarmy_flutter/features/inventory/domain/inventory_item.dart';
import 'package:mobiarmy_flutter/features/inventory/domain/equipment_stats.dart';

class InventoryState {
  const InventoryState({
    this.items = const [],
    this.materials = const [],
    this.characterStats = CharacterStats.defaultStats,
    this.isLoading = false,
    this.error,
  });

  final List<InventoryItem> items;
  final List<InventoryItem> materials;
  final CharacterStats characterStats;
  final bool isLoading;
  final String? error;

  InventoryState copyWith({
    List<InventoryItem>? items,
    List<InventoryItem>? materials,
    CharacterStats? characterStats,
    bool? isLoading,
    String? error,
  }) {
    return InventoryState(
      items: items ?? this.items,
      materials: materials ?? this.materials,
      characterStats: characterStats ?? this.characterStats,
      isLoading: isLoading ?? this.isLoading,
      error: error ?? this.error,
    );
  }
}

class InventoryController extends Notifier<InventoryState> {
  final _logger = Logger('InventoryController');
  late final InventoryRepository _repository;
  late final InventoryPacketMapper _mapper;

  @override
  InventoryState build() {
    _repository = InventoryRepository(ref.watch(tcpSessionProvider));
    _mapper = const InventoryPacketMapper();

    final dispatcher = ref.watch(messageDispatcherProvider);
    _registerHandlers(dispatcher);

    ref.onDispose(() {
      _unregisterHandlers(dispatcher);
    });

    return const InventoryState();
  }

  void _registerHandlers(MessageDispatcher dispatcher) {
    dispatcher
      ..register(Commands.inventory, _onInventory)
      ..register(Commands.materialUpdate, _onMaterials)
      ..register(99, _onCharacterInfo)
      ..register(Commands.inventoryUpdate, _onInventoryUpdate)
      ..register(Commands.log, _onLog);
  }

  void _unregisterHandlers(MessageDispatcher dispatcher) {
    dispatcher
      ..unregister(Commands.inventory, _onInventory)
      ..unregister(Commands.materialUpdate, _onMaterials)
      ..unregister(99, _onCharacterInfo)
      ..unregister(Commands.inventoryUpdate, _onInventoryUpdate)
      ..unregister(Commands.log, _onLog);
  }

  Future<void> loadInventory() async {
    state = state.copyWith(isLoading: true, error: null);
    try {
      await _repository.requestInventory();
      await _repository.requestCharacterStats();
    } catch (e) {
      state = state.copyWith(isLoading: false, error: e.toString());
    }
  }

  Future<void> changeEquip(List<int> dbKeys) async {
    state = state.copyWith(isLoading: true);
    try {
      await _repository.changeEquip(dbKeys);
    } catch (e) {
      state = state.copyWith(isLoading: false, error: e.toString());
    }
  }

  // --------------------------------------------------------------- handlers

  void _onInventory(Message message) {
    try {
      final items = _mapper.decodeInventory(message);
      state = state.copyWith(items: items, isLoading: false);
    } catch (e, stack) {
      _logger.severe('Failed to decode inventory', e, stack);
    }
  }

  void _onMaterials(Message message) {
    try {
      final materials = _mapper.decodeMaterials(message);
      state = state.copyWith(materials: materials, isLoading: false);
    } catch (e, stack) {
      _logger.severe('Failed to decode materials', e, stack);
    }
  }

  void _onCharacterInfo(Message message) {
    try {
      final r = message.reader();
      r.readUnsignedByte(); // level2
      r.readByte(); // level2Percen
      r.readShort(); // point
      final abilities = [for (var i = 0; i < 5; i++) r.readShort()];
      state = state.copyWith(
        characterStats: CharacterStats(ability: abilities),
        isLoading: false,
      );
    } catch (e, stack) {
      _logger.severe('Failed to decode character stats', e, stack);
    }
  }

  void _onInventoryUpdate(Message message) {
    // Refresh inventory on update
    loadInventory();
  }

  void _onLog(Message message) {
    // Only capture error if we are expecting a result (e.g. after a request)
    if (state.isLoading) {
      final text = message.reader().readUTF();
      state = state.copyWith(error: text, isLoading: false);
    }
  }
}

final inventoryControllerProvider = NotifierProvider<InventoryController, InventoryState>(InventoryController.new);
