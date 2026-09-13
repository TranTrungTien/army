import 'package:mobiarmy_flutter/core/network/command/commands.dart';
import 'package:mobiarmy_flutter/core/network/protocol/message.dart';
import 'package:mobiarmy_flutter/core/network/transport/tcp_session.dart';

class RoomRepository {
  RoomRepository(this._session);
  final TcpSession _session;

  Future<void> sendReady() async {
    await _session.sendMessage(Message(Commands.ready));
  }

  Future<void> sendChangeTeam() async {
    await _session.sendMessage(Message(Commands.changeTeam));
  }

  Future<void> sendChat(String text) async {
    final message = Message(Commands.chat);
    message.writer().writeUTF(text);
    await _session.sendMessage(message);
  }

  Future<void> sendSelectMap(int mapId) async {
    final message = Message(Commands.selectMap);
    message.writer().writeByte(mapId);
    await _session.sendMessage(message);
  }

  Future<void> sendStartGame() async {
    await _session.sendMessage(Message(Commands.startGame));
  }

  Future<void> sendLeave() async {
    await _session.sendMessage(Message(Commands.leaveRoomWait));
  }
}
