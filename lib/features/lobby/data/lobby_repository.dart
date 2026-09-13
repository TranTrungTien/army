import 'package:mobiarmy_flutter/core/network/command/commands.dart';
import 'package:mobiarmy_flutter/core/network/protocol/message.dart';
import 'package:mobiarmy_flutter/core/network/transport/tcp_session.dart';

class LobbyRepository {
  LobbyRepository(this._session);
  final TcpSession _session;

  Future<void> requestAreas() async {
    await _session.sendMessage(Message(Commands.roomList));
  }

  Future<void> requestBoards(int areaId) async {
    final message = Message(Commands.roomWaitList);
    message.writer().writeByte(areaId);
    await _session.sendMessage(message);
  }

  Future<void> joinBoard(int areaId, int boardId, [String password = '']) async {
    final message = Message(Commands.joinRoomWait);
    message.writer().writeByte(areaId);
    message.writer().writeByte(boardId);
    message.writer().writeUTF(password);
    await _session.sendMessage(message);
  }

  Future<void> quickJoin(int mode) async {
    final message = Message(Commands.quickPlay);
    message.writer().writeByte(mode);
    await _session.sendMessage(message);
  }
}
