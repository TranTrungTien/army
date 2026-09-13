import 'package:flutter_test/flutter_test.dart';
import 'package:mobiarmy_flutter/features/lobby/application/lobby_state_machine.dart';
import 'package:mobiarmy_flutter/features/lobby/domain/area_summary.dart';
import 'package:mobiarmy_flutter/features/lobby/domain/board_summary.dart';
import 'package:mobiarmy_flutter/features/lobby/domain/lobby_state.dart';

void main() {
  group('LobbyStateMachine', () {
    late LobbyStateMachine machine;

    setUp(() {
      machine = LobbyStateMachine();
    });

    test('initial state is initial', () {
      expect(machine.state.status, LobbyStatus.initial);
    });

    test('areasRequested transitions to loadingAreas', () {
      machine.areasRequested();
      expect(machine.state.status, LobbyStatus.loadingAreas);
    });

    test('areasLoaded transitions from loadingAreas', () {
      machine.areasRequested();
      final areas = [const AreaSummary(id: 1, status: 0, type: 0)];
      machine.areasLoaded(areas);
      expect(machine.state.status, LobbyStatus.areasLoaded);
      expect(machine.state.areas, areas);
    });

    test('boardsRequested transitions from areasLoaded', () {
      machine.areasRequested();
      machine.areasLoaded([const AreaSummary(id: 1, status: 0, type: 0)]);
      machine.boardsRequested(1);
      expect(machine.state.status, LobbyStatus.loadingBoards);
      expect(machine.state.selectedAreaId, 1);
    });

    test('boardsLoaded transitions from loadingBoards', () {
      const areas = [AreaSummary(id: 1, status: 0, type: 0)];
      machine.areasRequested();
      machine.areasLoaded(areas);
      machine.boardsRequested(1);

      final boards = [
        const BoardSummary(
          id: 1,
          numPlayers: 1,
          maxPlayers: 8,
          hasPassword: false,
          bet: 100,
          isStarted: false,
          name: 'Test Board',
          mode: 0,
        )
      ];

      machine.boardsLoaded(1, boards);
      expect(machine.state.status, LobbyStatus.boardsLoaded);
      expect(machine.state.boards, boards);
    });

    test('joinRequested transitions to joining', () {
      machine.areasRequested();
      machine.areasLoaded([]);
      machine.joinRequested();
      expect(machine.state.status, LobbyStatus.joining);
    });

    test('joinSucceeded transitions to joined', () {
      machine.areasRequested();
      machine.areasLoaded([]);
      machine.joinRequested();
      machine.joinSucceeded();
      expect(machine.state.status, LobbyStatus.joined);
    });

    test('joinFailed transitions to failed', () {
      machine.areasRequested();
      machine.areasLoaded([]);
      machine.joinRequested();
      machine.joinFailed('Lỗi test');
      expect(machine.state.status, LobbyStatus.failed);
      expect(machine.state.message, 'Lỗi test');
    });
  });
}
