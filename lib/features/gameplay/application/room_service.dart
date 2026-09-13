import 'dart:async';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logging/logging.dart';
import 'package:mobiarmy_flutter/core/network/command/commands.dart';
import 'package:mobiarmy_flutter/core/network/network_provider.dart';
import 'package:mobiarmy_flutter/core/network/protocol/message.dart';
import 'package:mobiarmy_flutter/core/network/transport/tcp_session.dart';

/// Port MessageHandler case 8 (joinBoard) + case 12 (nguoi choi moi vao):
///   cmd 8: ownerID(int), money(int), map(byte), gameMODE(byte),
///          lap den het: IDDB(int) != -1 -> clanID(short), name(UTF),
///          xu(int), level2(uByte), gun(byte), 5 x short equipID, isReady(bool)
class RoomPlayer {
  RoomPlayer({
    required this.idDb, required this.clanId, required this.name,
    required this.xu, required this.level2, required this.gun,
    required this.equipIds, required this.isReady,
  });
  int idDb, xu, gun;
  int clanId, level2;
  String name;
  List<int> equipIds;
  bool isReady;
}

class RoomWaitState {
  const RoomWaitState({
    this.ownerId = -1, this.money = 0, this.mapId = 0, this.gameMode = 0,
    this.players = const [], this.joined = false,
  });
  final int ownerId, money, mapId, gameMode;
  final List<RoomPlayer> players;
  final bool joined;

  RoomWaitState copyWith({
    int? ownerId, int? money, int? mapId, int? gameMode,
    List<RoomPlayer>? players, bool? joined,
  }) => RoomWaitState(
    ownerId: ownerId ?? this.ownerId, money: money ?? this.money,
    mapId: mapId ?? this.mapId, gameMode: gameMode ?? this.gameMode,
    players: players ?? this.players, joined: joined ?? this.joined,
  );
}

class RoomService extends Notifier<RoomWaitState> {
  final _logger = Logger('RoomService');
  late final TcpSession _session;

  @override
  RoomWaitState build() {
    _session = ref.watch(tcpSessionProvider);
    final d = ref.watch(messageDispatcherProvider);
    d.register(Commands.joinRoomWait, _onJoinBoard);
    d.register(12, _onPlayerJoin);        // nguoi choi moi vao phong cho
    d.register(Commands.changeTeam, _onChangeTeam);
    d.register(Commands.selectMap, _onMapChanged);
    return const RoomWaitState();
  }

  /// cmd 8 — joinBoard response (day du danh sach).
  void _onJoinBoard(Message msg) {
    final r = msg.reader();
    final ownerId = r.readInt();
    final money = r.readInt();
    final mapId = r.readByte();
    final gameMode = r.readByte();
    final players = <RoomPlayer>[];
    while (r.available > 0) {
      final idDb = r.readInt();
      if (idDb == -1) continue;
      players.add(RoomPlayer(
        idDb: idDb,
        clanId: r.readShort(),
        name: r.readUTF(),
        xu: r.readInt(),
        level2: r.readUnsignedByte(),
        gun: r.readByte(),
        equipIds: [for (var i = 0; i < 5; i++) r.readShort()],
        isReady: r.readBoolean(),
      ));
    }
    // Chu phong luon ready
    for (final p in players) {
      if (p.idDb == ownerId) p.isReady = true;
    }
    state = state.copyWith(
      ownerId: ownerId, money: money, mapId: mapId,
      gameMode: gameMode, players: players, joined: true,
    );
  }

  /// cmd 12 — nguoi choi moi join luc dang cho.
  void _onPlayerJoin(Message msg) {
    final r = msg.reader();
    r.readByte(); // seat
    final idDb = r.readInt();
    final clanId = r.readShort();
    final name = r.readUTF();
    final level2 = r.readUnsignedByte();
    r.readByte(); // gun (phần con lai cua PlayerInfo gui sau — bo qua phien ban toi thieu)
    final players = [...state.players];
    if (!players.any((p) => p.idDb == idDb)) {
      players.add(RoomPlayer(
        idDb: idDb, clanId: clanId, name: name, xu: 0,
        level2: level2, gun: 0, equipIds: const [0, 0, 0, 0, 0],
        isReady: false,
      ));
      state = state.copyWith(players: players);
    }
  }

  void _onChangeTeam(Message msg) {
    final r = msg.reader();
    final userId = r.readInt();
    r.readByte(); // position — cap nhat lai seat khi co model seat
    _logger.info('Change team: $userId');
  }

  void _onMapChanged(Message msg) {
    final mId = msg.reader().readByte();
    state = state.copyWith(mapId: mId);
  }

  // -------------------------------------------------------- outgoing (GameService)

  /// ready(boolean) — cmd 16.
  Future<void> setReady(bool isReady) {
    final m = Message(16);
    m.writer().writeBoolean(isReady);
    return _session.sendMessage(m);
  }

  /// selectMap(byte) — cmd 70 "ChangeMap" (yeu cau doi map).
  Future<void> requestChangeMap(int mapId) {
    final m = Message(70);
    m.writer().writeByte(mapId);
    return _session.sendMessage(m);
  }

  /// startGame() — cmd 20 (chi chu phong).
  Future<void> startGame() => _session.sendMessage(Message(20));

  /// leaveRoomWait() — cmd 15.
  Future<void> leaveRoom() => _session.sendMessage(Message(Commands.leaveRoomWait));
}

final roomServiceProvider =
    NotifierProvider<RoomService, RoomWaitState>(RoomService.new);