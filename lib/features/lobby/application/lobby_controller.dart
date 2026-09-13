import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logging/logging.dart';
import 'package:mobiarmy_flutter/core/network/command/commands.dart';
import 'package:mobiarmy_flutter/core/network/dispatcher/message_dispatcher.dart';
import 'package:mobiarmy_flutter/core/network/network_provider.dart';
import 'package:mobiarmy_flutter/core/network/protocol/message.dart';
import 'package:mobiarmy_flutter/features/lobby/application/lobby_state_machine.dart';
import 'package:mobiarmy_flutter/features/lobby/data/lobby_packet_mapper.dart';
import 'package:mobiarmy_flutter/features/lobby/data/lobby_repository.dart';
import 'package:mobiarmy_flutter/features/lobby/domain/lobby_state.dart';

class LobbyController extends Notifier<LobbyState> {
  final _logger = Logger('LobbyController');

  late final LobbyStateMachine _machine;
  late final LobbyRepository _repository;
  late final LobbyPacketMapper _mapper;

  @override
  LobbyState build() {
    _machine = LobbyStateMachine();
    _mapper = const LobbyPacketMapper();
    _repository = LobbyRepository(ref.watch(tcpSessionProvider));

    final dispatcher = ref.watch(messageDispatcherProvider);
    _registerHandlers(dispatcher);

    // Initial load
    Future.microtask(() => loadAreas());

    return _machine.state;
  }

  void _registerHandlers(MessageDispatcher dispatcher) {
    dispatcher
      ..register(Commands.roomList, _onRoomList)
      ..register(Commands.roomWaitList, _onRoomWaitList)
      ..register(Commands.joinRoomWait, _onLoadRoomWait) // cmd 8
      ..register(Commands.log, _onLog);
  }

  // ---------------------------------------------------------------- commands

  Future<void> loadAreas() async {
    state = _machine.areasRequested();
    try {
      await _repository.requestAreas();
    } catch (e) {
      state = _machine.joinFailed('Không thể tải danh sách khu vực: $e');
    }
  }

  Future<void> loadBoards(int areaId) async {
    state = _machine.boardsRequested(areaId);
    try {
      await _repository.requestBoards(areaId);
    } catch (e) {
      state = _machine.joinFailed('Không thể tải danh sách bàn: $e');
    }
  }

  Future<void> joinBoard(int areaId, int boardId, [String password = '']) async {
    state = _machine.joinRequested();
    try {
      await _repository.joinBoard(areaId, boardId, password);
    } catch (e) {
      state = _machine.joinFailed('Không thể gửi yêu cầu vào bàn: $e');
    }
  }

  Future<void> quickJoin(int mode) async {
    state = _machine.joinRequested();
    try {
      await _repository.quickJoin(mode);
    } catch (e) {
      state = _machine.joinFailed('Không thể gửi yêu cầu chơi ngay: $e');
    }
  }

  // --------------------------------------------------------------- packets

  void _onRoomList(Message message) {
    try {
      final areas = _mapper.decodeAreas(message);
      state = _machine.areasLoaded(areas);
    } catch (e, stack) {
      _logger.severe('roomList parse failed', e, stack);
    }
  }

  void _onRoomWaitList(Message message) {
    try {
      final (areaId, boards) = _mapper.decodeBoards(message);
      state = _machine.boardsLoaded(areaId, boards);
    } catch (e, stack) {
      _logger.severe('roomWaitList parse failed', e, stack);
    }
  }

  void _onLoadRoomWait(Message message) {
    // Phase 15 ownership will decode the full room state.
    // For Phase 14, receiving this means success.
    _logger.info('Received loadRoomWait (cmd 8) - success joining room');
    state = _machine.joinSucceeded();
  }

  void _onLog(Message message) {
    // If we are joining, a log message usually means failure.
    if (state.status == LobbyStatus.joining) {
      final text = message.reader().readUTF();
      state = _machine.joinFailed(text);
    }
  }
}

final lobbyControllerProvider =
    NotifierProvider<LobbyController, LobbyState>(LobbyController.new);
