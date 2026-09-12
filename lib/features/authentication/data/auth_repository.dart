import 'package:mobiarmy_flutter/core/network/command/commands.dart';
import 'package:mobiarmy_flutter/core/network/protocol/message.dart';
import 'package:mobiarmy_flutter/core/network/transport/tcp_session.dart';

class AuthRepository {
  AuthRepository(this._session);
  final TcpSession _session;

  Future<void> login(String username, String password, String version) async {
    final message = Message(Commands.login);
    message.writer().writeUTF(username);
    message.writer().writeUTF(password);
    message.writer().writeUTF(version);
    await _session.sendMessage(message);
  }
}
