import 'room_player.dart';

class RoomSessionState {
  const RoomSessionState({
    required this.masterId,
    required this.bet,
    required this.players,
    this.roomId = 0,
    this.boardId = 0,
    this.roomType = 0,
    this.gameMode = 0,
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
  final int roomType;
  final int gameMode;
  final int mapId;
  final int areaId;
  final int capacity;
  final String roomName;
  final String connectionState;

  List<RoomPlayer> get playerList => players.values.toList();

  bool isMaster(int playerId) => playerId == masterId;

  RoomSessionState copyWith({
    int? masterId,
    int? mapId,
    Map<int, RoomPlayer>? players,
    int? roomId,
    int? boardId,
    int? roomType,
    int? gameMode,
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
