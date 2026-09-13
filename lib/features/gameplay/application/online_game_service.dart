import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logging/logging.dart';
import 'package:mobiarmy_flutter/core/network/command/commands.dart';
import 'package:mobiarmy_flutter/core/network/network_provider.dart';
import 'package:mobiarmy_flutter/core/network/protocol/message.dart';
import 'package:mobiarmy_flutter/core/network/transport/tcp_session.dart';
import 'package:mobiarmy_flutter/features/gameplay/application/game_controls.dart';

/// Trang thai HUD game online: gio (cmd 25), luot (cmd 24), vi tri
/// cap nhat (cmd 53 setXY).
class OnlineGameState {
  const OnlineGameState({
    this.windX = 0, this.windY = 0,
    this.currentPlayer = -1, this.myIndex = -1,
  });
  final int windX, windY, currentPlayer, myIndex;
  bool get isMyTurn => myIndex != -1 && currentPlayer == myIndex;

  OnlineGameState copyWith({
    int? windX, int? windY, int? currentPlayer, int? myIndex,
  }) => OnlineGameState(
    windX: windX ?? this.windX, windY: windY ?? this.windY,
    currentPlayer: currentPlayer ?? this.currentPlayer,
    myIndex: myIndex ?? this.myIndex,
  );
}

class OnlineGameService extends Notifier<OnlineGameState> {
  final _logger = Logger('OnlineGameService');
  late final TcpSession _session;
  late final GameControls _controls;

  @override
  OnlineGameState build() {
    _session = ref.watch(tcpSessionProvider);
    _controls = GameControls(_session);
    final d = ref.watch(messageDispatcherProvider);
    d.register(Commands.setWind, _onWind);
    d.register(Commands.setTurn, _onTurn);
    d.register(Commands.setXy, _onSetXy);
    return const OnlineGameState();
  }

  void _onWind(Message msg) {
    final r = msg.reader();
    state = state.copyWith(windX: r.readShort(), windY: r.readShort());
  }

  void _onTurn(Message msg) {
    state = state.copyWith(currentPlayer: msg.reader().readByte());
  }

  /// cmd 53 setXY: cap nhat vi tri nguoi choi (who, x, y).
  void _onSetXy(Message msg) {
    final r = msg.reader();
    final who = r.readByte();
    final x = r.readShort();
    final y = r.readShort();
    _logger.fine('setXY $who -> ($x,$y)');
    // TODO: game.players[who].moveTo(x, y)
  }

  // ------------------------------------------------- controls (GUI cmd)

  Future<void> shoot({
    required int type, required int gunX, required int gunY,
    required int angle, required int force,
  }) => _controls.shoot(
    type: type, gunX: gunX, gunY: gunY,
    angle: angle, force: force.clamp(1, 30),
  );

  Future<void> move(int x, int y) => _controls.move(x, y);
  Future<void> useItem(int itemId) => _controls.useItem(itemId);
  Future<void> skipTurn() => _controls.skipTurn();
}

final onlineGameServiceProvider =
    NotifierProvider<OnlineGameService, OnlineGameState>(OnlineGameService.new);