import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logging/logging.dart';
import 'package:mobiarmy_flutter/core/network/command/commands.dart';
import 'package:mobiarmy_flutter/core/network/dispatcher/message_dispatcher.dart';
import 'package:mobiarmy_flutter/core/network/network_provider.dart';
import 'package:mobiarmy_flutter/core/network/protocol/message.dart';
import 'package:mobiarmy_flutter/features/shop/data/shop_packet_mapper.dart';
import 'package:mobiarmy_flutter/features/shop/data/shop_repository.dart';
import 'package:mobiarmy_flutter/features/shop/domain/shop_models.dart';

class ShopState {
  const ShopState({
    this.equipments = const [],
    this.specialItems = const [],
    this.clanItems = const [],
    this.isLoading = false,
    this.error,
  });

  final List<ShopEquipment> equipments;
  final List<ShopSpecialItem> specialItems;
  final List<ClanShopItem> clanItems;
  final bool isLoading;
  final String? error;

  ShopState copyWith({
    List<ShopEquipment>? equipments,
    List<ShopSpecialItem>? specialItems,
    List<ClanShopItem>? clanItems,
    bool? isLoading,
    String? error,
  }) {
    return ShopState(
      equipments: equipments ?? this.equipments,
      specialItems: specialItems ?? this.specialItems,
      clanItems: clanItems ?? this.clanItems,
      isLoading: isLoading ?? this.isLoading,
      error: error ?? this.error,
    );
  }
}

class ShopController extends Notifier<ShopState> {
  final _logger = Logger('ShopController');
  late final ShopRepository _repository;
  late final ShopPacketMapper _mapper;

  @override
  ShopState build() {
    _repository = ShopRepository(ref.watch(tcpSessionProvider));
    _mapper = const ShopPacketMapper();

    final dispatcher = ref.watch(messageDispatcherProvider);
    _registerHandlers(dispatcher);

    ref.onDispose(() {
      _unregisterHandlers(dispatcher);
    });

    return const ShopState();
  }

  void _registerHandlers(MessageDispatcher dispatcher) {
    dispatcher
      ..register(Commands.getShopEquip, _onShopEquipment)
      ..register(Commands.shopSpecial, _onShopSpecial)
      ..register(Commands.shopBietDoi, _onShopClan)
      ..register(Commands.buySellEquip, _onTransactionResult)
      ..register(Commands.log, _onLog);
  }

  void _unregisterHandlers(MessageDispatcher dispatcher) {
    dispatcher
      ..unregister(Commands.getShopEquip, _onShopEquipment)
      ..unregister(Commands.shopSpecial, _onShopSpecial)
      ..unregister(Commands.shopBietDoi, _onShopClan)
      ..unregister(Commands.buySellEquip, _onTransactionResult)
      ..unregister(Commands.log, _onLog);
  }

  Future<void> loadShopEquipment() async {
    state = state.copyWith(isLoading: true, error: null);
    try {
      await _repository.requestShopEquipment();
    } catch (e) {
      state = state.copyWith(isLoading: false, error: e.toString());
    }
  }

  Future<void> loadShopSpecial() async {
    state = state.copyWith(isLoading: true, error: null);
    try {
      await _repository.requestShopSpecial();
    } catch (e) {
      state = state.copyWith(isLoading: false, error: e.toString());
    }
  }

  Future<void> buyEquipment(int shopIndex, int moneyType) async {
    state = state.copyWith(isLoading: true);
    try {
      await _repository.buyEquipment(shopIndex, moneyType);
    } catch (e) {
      state = state.copyWith(isLoading: false, error: e.toString());
    }
  }

  // --------------------------------------------------------------- handlers

  void _onShopEquipment(Message message) {
    try {
      final items = _mapper.decodeShopEquipment(message);
      state = state.copyWith(equipments: items, isLoading: false);
    } catch (e, stack) {
      _logger.severe('Failed to decode shop equipment', e, stack);
    }
  }

  void _onShopSpecial(Message message) {
    try {
      final items = _mapper.decodeShopSpecial(message);
      state = state.copyWith(specialItems: items, isLoading: false);
    } catch (e, stack) {
      _logger.severe('Failed to decode shop special', e, stack);
    }
  }

  void _onShopClan(Message message) {
    try {
      final items = _mapper.decodeShopClan(message);
      state = state.copyWith(clanItems: items, isLoading: false);
    } catch (e, stack) {
      _logger.severe('Failed to decode shop clan', e, stack);
    }
  }

  void _onTransactionResult(Message message) {
    final r = message.reader();
    final action = r.readByte();
    if (action == 1) {
      final info = r.readUTF();
      state = state.copyWith(error: info, isLoading: false);
    }
  }

  void _onLog(Message message) {
    if (state.isLoading) {
      final text = message.reader().readUTF();
      state = state.copyWith(error: text, isLoading: false);
    }
  }
}

final shopControllerProvider = NotifierProvider<ShopController, ShopState>(ShopController.new);
