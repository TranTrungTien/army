import 'account_credentials.dart';
import 'game_server.dart';
import 'user_session.dart';

enum AuthStatus {
  disconnected,
  connecting,
  handshaking,
  connected,
  authenticating,
  authenticated,
  failed,
}

class AuthenticationState {
  const AuthenticationState._({
    required this.status,
    this.server,
    this.session,
    this.message,
  });

  const AuthenticationState.disconnected([String? message])
    : this._(status: AuthStatus.disconnected, message: message);

  const AuthenticationState.connecting(GameServer server)
    : this._(status: AuthStatus.connecting, server: server);

  const AuthenticationState.handshaking(GameServer server)
    : this._(status: AuthStatus.handshaking, server: server);

  const AuthenticationState.connected(GameServer server)
    : this._(status: AuthStatus.connected, server: server);

  const AuthenticationState.authenticating(GameServer server)
    : this._(status: AuthStatus.authenticating, server: server);

  const AuthenticationState.authenticated(
    GameServer server,
    UserSession session,
  ) : this._(
        status: AuthStatus.authenticated,
        server: server,
        session: session,
      );

  const AuthenticationState.failed(GameServer? server, String message)
    : this._(status: AuthStatus.failed, server: server, message: message);

  final AuthStatus status;
  final GameServer? server;
  final UserSession? session;
  final String? message;

  bool get isAuthenticated => status == AuthStatus.authenticated;
  bool get isBusy => {
    AuthStatus.connecting,
    AuthStatus.handshaking,
    AuthStatus.authenticating,
  }.contains(status);
}
