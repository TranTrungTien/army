import 'room_player.dart';

enum RoomType {
  normal(0),
  boss(5),
  training(3),
  vip(4),
  arena(6);

  const RoomType(this.value);
  final int value;

  static RoomType fromInt(int value) =>
      RoomType.values.firstWhere((e) => e.value == value, orElse: () => RoomType.normal);
}

enum GameMode {
  normal(0),
  power(1),
  pro(2);

  const GameMode(this.value);
  final int value;

  static GameMode fromInt(int value) =>
      GameMode.values.firstWhere((e) => e.value == value, orElse: () => GameMode.normal);
}

class RoomSessionState {
  const RoomSessionState({
    required this.masterId,
    required this.bet,
    required this.players,
    this.roomId = 0,
    this.boardId = 0,
    this.roomType = RoomType.normal,
    this.gameMode = GameMode.normal,
    this.mapId = 0,
    this.areaId = 0,
    this.capacity = 8,
    this.roomName = '',
    this.connectionState = 'connected',
  });

  final int masterId;
  final int bet;
  final Map<int, RoomPlayer> players; // Key is playerId
  final int roomId;
  final int boardId;
  final RoomType roomType;
  final GameMode gameMode;
  final int mapId;
  final int areaId;
  final int capacity;
  final String roomName;
  final String connectionState;

  List<RoomPlayer> get playerList => players.values.toList();

  bool isMaster(int playerId) => playerId == masterId;

  bool get isBossRoom => roomType == RoomType.boss;
  bool get isTraining => roomType == RoomType.training;
  bool get isArena => roomType == RoomType.arena;

  bool canStart(int myId) {
    if (!isMaster(myId)) return false;
    if (players.length < 2 && !isArena && !isTraining) return false;

    // Check if everyone is ready
    final allReady = players.values
        .where((p) => p.id != masterId)
        .every((p) => p.isReady);
    if (!allReady) return false;

    // Team balance check (Team mode is usually even/odd slots)
    if (roomType == RoomType.normal || roomType == RoomType.vip) {
      int team0 = players.values.where((p) => p.team == 0).length;
      int team1 = players.values.where((p) => p.team == 1).length;
      if (team0 != team1) return false;
    }

    return true;
  }

  RoomSessionState copyWith({
    int? masterId,
    int? mapId,
    Map<int, RoomPlayer>? players,
    int? roomId,
    int? boardId,
    RoomType? roomType,
    GameMode? gameMode,
    int? areaId,
    int? capacity,
    int? bet,
    String? roomName,
    String? connectionState,
  }) {
    return RoomSessionState(
      masterId: masterId ?? this.masterId,
      bet: bet ?? this.bet,
      players: players ?? this.players,
      roomId: roomId ?? this.roomId,
      boardId: boardId ?? this.boardId,
      roomType: roomType ?? this.roomType,
      gameMode: gameMode ?? this.gameMode,
      mapId: mapId ?? this.mapId,
      areaId: areaId ?? this.areaId,
      capacity: capacity ?? this.capacity,
      roomName: roomName ?? this.roomName,
      connectionState: connectionState ?? this.connectionState,
    );
  }
}
