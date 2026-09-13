import 'package:mobiarmy_flutter/core/network/command/commands.dart';
import 'package:mobiarmy_flutter/core/network/protocol/message.dart';
import 'package:mobiarmy_flutter/core/network/transport/tcp_session.dart';

class GameplayRepository {
  GameplayRepository(this._session);
  final TcpSession _session;

  Future<void> sendMove(int type, int x, int y) async {
    final message = Message(Commands.move);
    message.writer().writeByte(type);
    message.writer().writeShort(x);
    message.writer().writeShort(y);
    await _session.sendMessage(message);
  }

  Future<void> sendShoot(int angle, int force, int force2, int nShot) async {
    final message = Message(Commands.shoot);
    message.writer().writeShort(angle);
    message.writer().writeByte(force);
    message.writer().writeByte(force2);
    message.writer().writeByte(nShot);
    await _session.sendMessage(message);
  }

  Future<void> sendSkipTurn() async {
    await _session.sendMessage(Message(Commands.skipTurn));
  }

  Future<void> sendUseItem(int itemId) async {
    final message = Message(Commands.useItem);
    message.writer().writeByte(itemId);
    await _session.sendMessage(message);
  }

  Future<void> sendLeave() async {
    await _session.sendMessage(Message(Commands.leaveRoomWait));
  }
}
