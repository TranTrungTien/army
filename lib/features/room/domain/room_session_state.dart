import 'room_player.dart';

class RoomSessionState {
  const RoomSessionState({
    required this.masterId,
    required this.bet,
    required this.players,
    this.mapId = 0,
    this.areaId = 0,
    this.boardId = 0,
    this.roomName = '',
  });

  final int masterId;
  final int bet;
  final Map<int, RoomPlayer> players; // Key is playerId
  final int mapId;
  final int areaId;
  final int boardId;
  final String roomName;

  List<RoomPlayer> get playerList => players.values.toList();

  bool isMaster(int playerId) => playerId == masterId;

  RoomSessionState copyWith({
    int? masterId,
    int? mapId,
    Map<int, RoomPlayer>? players,
  }) {
    return RoomSessionState(
      masterId: masterId ?? this.masterId,
      bet: bet,
      players: players ?? this.players,
      mapId: mapId ?? this.mapId,
      areaId: areaId,
      boardId: boardId,
      roomName: roomName,
    );
  }
}
