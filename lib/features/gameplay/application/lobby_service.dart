import 'dart:async';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logging/logging.dart';
import 'package:mobiarmy_flutter/core/network/command/commands.dart';
import 'package:mobiarmy_flutter/core/network/network_provider.dart';
import 'package:mobiarmy_flutter/core/network/protocol/message.dart';
import 'package:mobiarmy_flutter/core/network/transport/tcp_session.dart';
import 'package:mobiarmy_flutter/features/gameplay/domain/room_list_models.dart';

/// Port RoomListScr flow:
///   gui cmd 7 (GameService.requestBoardList(byte id)) -> server tra cmd -28
///   parse RoomInfoEntry -> hien thi lobby.
class LobbyService extends Notifier<List<RoomInfoEntry>> {
  final _logger = Logger('LobbyService');
  late final TcpSession _session;

  @override
  List<RoomInfoEntry> build() {
    _session = ref.watch(tcpSessionProvider);
    ref.watch(messageDispatcherProvider).register(Commands.roomWaitList, _onRoomList);
    return const [];
  }

  /// GameService.requestBoardList(byte id) — cmd 7.
  Future<void> requestRoomList() {
    final m = Message(Commands.roomWaitList);
    m.writer().writeByte(0);
    return _session.sendMessage(m);
  }

  void _onRoomList(Message msg) {
    try {
      state = RoomListParser.parse(msg);
    } catch (e, st) {
      _logger.severe('Room list parse failed', e, st);
    }
  }

  /// GameService.joinBoard(roomID, boardID, pass) — cmd 8.
  Future<void> joinRoom(int roomId, int boardId, [String pass = '']) {
    final m = Message(Commands.joinRoomWait);
    m.writer().writeByte(roomId);
    m.writer().writeByte(boardId);
    m.writer().writeUTF(pass);
    return _session.sendMessage(m);
  }
}

final lobbyServiceProvider =
    NotifierProvider<LobbyService, List<RoomInfoEntry>>(LobbyService.new);