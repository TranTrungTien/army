import 'area_summary.dart';
import 'board_summary.dart';

enum LobbyStatus {
  initial,
  loadingAreas,
  areasLoaded,
  loadingBoards,
  boardsLoaded,
  joining,
  joined, // Room UI will take over
  failed,
}

class LobbyState {
  const LobbyState._({
    required this.status,
    this.areas = const [],
    this.selectedAreaId,
    this.boards = const [],
    this.message,
  });

  const LobbyState.initial() : this._(status: LobbyStatus.initial);

  const LobbyState.loadingAreas() : this._(status: LobbyStatus.loadingAreas);

  const LobbyState.areasLoaded(List<AreaSummary> areas)
    : this._(status: LobbyStatus.areasLoaded, areas: areas);

  const LobbyState.loadingBoards(List<AreaSummary> areas, int areaId)
    : this._(
        status: LobbyStatus.loadingBoards,
        areas: areas,
        selectedAreaId: areaId,
      );

  const LobbyState.boardsLoaded(
    List<AreaSummary> areas,
    int areaId,
    List<BoardSummary> boards,
  ) : this._(
        status: LobbyStatus.boardsLoaded,
        areas: areas,
        selectedAreaId: areaId,
        boards: boards,
      );

  const LobbyState.joining() : this._(status: LobbyStatus.joining);

  const LobbyState.joined() : this._(status: LobbyStatus.joined);

  const LobbyState.failed(String message)
    : this._(status: LobbyStatus.failed, message: message);

  final LobbyStatus status;
  final List<AreaSummary> areas;
  final int? selectedAreaId;
  final List<BoardSummary> boards;
  final String? message;

  bool get isBusy => {
    LobbyStatus.loadingAreas,
    LobbyStatus.loadingBoards,
    LobbyStatus.joining,
  }.contains(status);
}
