import 'package:mobiarmy_flutter/core/network/command/commands.dart';
import 'package:mobiarmy_flutter/core/network/protocol/message.dart';
import 'package:mobiarmy_flutter/core/network/transport/tcp_session.dart';

/// Port cac lenh gameplay client -> server (GameService):
///   waitForFire cmd 22, move cmd 21, useItem cmd 26, skipTurn cmd 49,
///   chat cmd 9, getMaterialIcon cmd 126.
class GameControls {
  GameControls(this._session);
  final TcpSession _session;

  /// GameService.waitForFIRE(type, x, y, angle, force, force_2, numShoot).
  /// x/y = VI TRI SUNG, force 1..30, angle SHORT (co the am, vd King Kong 30).
  Future<void> shoot({
    required int type, required int gunX, required int gunY,
    required int angle, required int force, int force2 = 0, int numShoot = 1,
    bool isDoubleBull = false,
  }) async {
    final m = Message(Commands.shoot);
    m.writer().writeByte(type);
    m.writer().writeShort(gunX);
    m.writer().writeShort(gunY);
    m.writer().writeShort(angle);
    m.writer().writeByte(force);
    if (isDoubleBull) m.writer().writeByte(force2);
    m.writer().writeByte(numShoot);
    await _session.sendMessage(m);
  }

  /// GameService.move(x, y) — cmd 21.
  Future<void> move(int x, int y) async {
    final m = Message(Commands.move);
    m.writer().writeShort(x);
    m.writer().writeShort(y);
    await _session.sendMessage(m);
  }

  /// GameService.useItem(item) — cmd 26.
  Future<void> useItem(int itemId) async {
    final m = Message(Commands.useItem);
    m.writer().writeByte(itemId);
    await _session.sendMessage(m);
  }

  /// GameService.skipTurn() — cmd 49.
  Future<void> skipTurn() => _session.sendMessage(Message(Commands.skipTurn));

  /// Chat cmd 9 — TODO verify: ban goc dung GameService.chat(String) viet UTF.
  Future<void> chat(String text) async {
    final m = Message(Commands.chat);
    m.writer().writeUTF(text);
    await _session.sendMessage(m);
  }

  /// GameService.getMaterialIcon — cmd 126: xin anh tile/material tu server.
  Future<void> requestMaterialIcon(int action, int id, [int index = 0]) async {
    final m = Message(126);
    m.writer().writeByte(action);
    m.writer().writeByte(id);
    if (action == 3 || action == 4) m.writer().writeByte(index);
    await _session.sendMessage(m);
  }
}