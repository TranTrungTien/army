import 'package:mobiarmy_flutter/features/room/domain/room_player.dart';
import 'package:mobiarmy_flutter/features/room/domain/room_session_state.dart';

class RoomStateMachine {
  RoomSessionState? _state;

  RoomSessionState? get state => _state;

  void initialized(RoomSessionState state) {
    _state = state;
  }

  void playerJoined(int slotIndex, RoomPlayer player) {
    if (_state == null) return;
    final players = Map<int, RoomPlayer>.from(_state!.players);
    players[player.id] = player.copyWith();
    _state = _state!.copyWith(players: players);
  }

  void playerLeft(int playerId) {
    if (_state == null) return;
    final players = Map<int, RoomPlayer>.from(_state!.players);
    players.remove(playerId);
    _state = _state!.copyWith(players: players);
  }

  void readySynced(int playerId, bool isReady) {
    if (_state == null) return;
    final player = _state!.players[playerId];
    if (player == null) return;

    final players = Map<int, RoomPlayer>.from(_state!.players);
    players[playerId] = player.copyWith(isReady: isReady);
    _state = _state!.copyWith(players: players);
  }

  void teamSynced(int playerId, int team) {
    if (_state == null) return;
    final player = _state!.players[playerId];
    if (player == null) return;

    final players = Map<int, RoomPlayer>.from(_state!.players);
    players[playerId] = player.copyWith(team: team);
    _state = _state!.copyWith(players: players);
  }

  void mapChanged(int mapId) {
    if (_state == null) return;
    _state = _state!.copyWith(mapId: mapId);
  }

  void masterChanged(int masterId) {
    if (_state == null) return;
    _state = _state!.copyWith(masterId: masterId);
  }

  void reset() {
    _state = null;
  }
}
