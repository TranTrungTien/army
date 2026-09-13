import 'dart:async';
import 'package:mobiarmy_flutter/core/network/command/commands.dart';
import 'package:mobiarmy_flutter/core/network/protocol/message.dart';
import 'package:mobiarmy_flutter/core/network/transport/tcp_session.dart';

/// Port CCanvas.update: moi 50 gameTick gui ping(cmd 42, writeShort(gameTick),
/// writeLong(-1)) — giu ket noi, server do luon latency.
class PingHeartbeat {
  PingHeartbeat(this._session);
  final TcpSession _session;
  Timer? _timer;
  int _tick = 0;

  void start() {
    _timer?.cancel();
    _timer = Timer.periodic(const Duration(milliseconds: 100), (_) async {
      _tick += 5; // 100ms x 5 = 500ms ~ 50 tick o 10ms/tick cua ban goc
      if (!_session.isConnected) return;
      final m = Message(Commands.ping);
      m.writer().writeShort(_tick);
      m.writer().writeLong(-1);
      await _session.sendMessage(m);
    });
  }

  void stop() => _timer?.cancel();
}