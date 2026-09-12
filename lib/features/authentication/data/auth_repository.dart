import 'package:mobiarmy_flutter/core/network/command/commands.dart';
import 'package:mobiarmy_flutter/core/network/protocol/message.dart';
import 'package:mobiarmy_flutter/core/network/transport/tcp_session.dart';
import 'package:mobiarmy_flutter/features/authentication/domain/account_credentials.dart';

class AuthRepository {
  AuthRepository(this._session);
  final TcpSession _session;

  Future<void> login(AccountCredentials credentials) async {
    final message = Message(Commands.login);
    message.writer().writeUTF(credentials.username);
    message.writer().writeUTF(credentials.password);
    message.writer().writeUTF(AccountCredentials.kClientVersion);
    await _session.sendMessage(message);
  }

  Future<void> sendQuit() => _session.sendMessage(Message(Commands.quit));
}
