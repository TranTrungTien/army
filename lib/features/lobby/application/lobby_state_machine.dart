import 'package:mobiarmy_flutter/features/lobby/domain/area_summary.dart';
import 'package:mobiarmy_flutter/features/lobby/domain/board_summary.dart';
import 'package:mobiarmy_flutter/features/lobby/domain/lobby_state.dart';
import 'package:mobiarmy_flutter/features/room/domain/room_session_state.dart';

/// Pure state machine for the lobby flow.
class LobbyStateMachine {
  LobbyState _state = const LobbyState.initial();

  LobbyState get state => _state;

  LobbyState areasRequested() {
    return _set(const LobbyState.loadingAreas());
  }

  LobbyState areasLoaded(List<AreaSummary> areas) {
    if (_state.status != LobbyStatus.loadingAreas) return _state;
    return _set(LobbyState.areasLoaded(areas));
  }

  LobbyState boardsRequested(int areaId) {
    if (_state.status != LobbyStatus.areasLoaded &&
        _state.status != LobbyStatus.boardsLoaded) {
      return _state;
    }
    return _set(LobbyState.loadingBoards(_state.areas, areaId));
  }

  LobbyState boardsLoaded(int areaId, List<BoardSummary> boards) {
    if (_state.status != LobbyStatus.loadingBoards ||
        _state.selectedAreaId != areaId) {
      return _state;
    }
    return _set(LobbyState.boardsLoaded(_state.areas, areaId, boards));
  }

  LobbyState joinRequested() {
    if (_state.status != LobbyStatus.boardsLoaded &&
        _state.status != LobbyStatus.areasLoaded) {
      return _state;
    }
    return _set(const LobbyState.joining());
  }

  LobbyState joinSucceeded(RoomSessionState initialRoomState) {
    if (_state.status != LobbyStatus.joining) return _state;
    return _set(LobbyState.joined(initialRoomState));
  }

  LobbyState joinFailed(String message) {
    if (_state.status != LobbyStatus.joining) return _state;
    // Revert to boardsLoaded if we were there, else areasLoaded
    if (_state.selectedAreaId != null) {
      return _set(LobbyState.failed(message));
    }
    return _set(LobbyState.failed(message));
  }

  LobbyState reset() {
    return _set(const LobbyState.initial());
  }

  LobbyState _set(LobbyState next) {
    _state = next;
    return next;
  }
}
