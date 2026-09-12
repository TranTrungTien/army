import 'package:mobiarmy_flutter/features/authentication/domain/authentication_state.dart';
import 'package:mobiarmy_flutter/features/authentication/domain/game_server.dart';
import 'package:mobiarmy_flutter/features/authentication/domain/user_session.dart';

/// Pure state machine for the auth flow. No Riverpod, no sockets — fully
/// unit-testable. Invalid transitions are no-ops (asserted in debug).
///
/// Flow (mirrors Session.java / ControlHandler.java on the server):
///   disconnected -> connecting -> handshaking -> connected
///   connected -> authenticating -> authenticated | failed
///   any -> disconnected (logout) | failed (connection lost)
class AuthStateMachine {
  AuthenticationState _state = const AuthenticationState.disconnected();

  AuthenticationState get state => _state;

  AuthenticationState connectTo(GameServer server) {
    if (!_isAny(const {AuthStatus.disconnected, AuthStatus.failed}))
      return _state;
    return _set(AuthenticationState.connecting(server));
  }

  AuthenticationState handshakeStarted() {
    if (!_isAny(const {AuthStatus.connecting})) return _state;
    final server = _state.server;
    if (server == null) return _state;
    return _set(AuthenticationState.handshaking(server));
  }

  AuthenticationState handshakeComplete() {
    if (!_isAny(const {AuthStatus.connecting, AuthStatus.handshaking}))
      return _state;
    final server = _state.server;
    if (server == null) return _state;
    return _set(AuthenticationState.connected(server));
  }

  AuthenticationState loginRequested() {
    if (!_isAny(const {AuthStatus.connected})) return _state;
    final server = _state.server!;
    return _set(AuthenticationState.authenticating(server));
  }

  AuthenticationState loginSucceeded(UserSession session) {
    if (!_isAny(const {AuthStatus.authenticating})) return _state;
    final server = _state.server!;
    return _set(AuthenticationState.authenticated(server, session));
  }

  /// Server command 45 (`log`). Only meaningful while authenticating —
  /// that is the login-failure path. Outside auth it is a general notice
  /// and must not change auth state.
  AuthenticationState logReceived(String message) {
    if (!_isAny(const {AuthStatus.authenticating})) return _state;
    final server = _state.server;
    return _set(AuthenticationState.failed(server, message));
  }

  AuthenticationState connectionLost([String? reason]) {
    if (_isAny(const {AuthStatus.disconnected})) return _state;
    final server = _state.server;
    if (server == null) return _set(AuthenticationState.disconnected(reason));
    return _set(
      AuthenticationState.failed(server, reason ?? 'Mất kết nối đến server'),
    );
  }

  AuthenticationState logout() {
    if (_isAny(const {AuthStatus.disconnected})) return _state;
    return _set(const AuthenticationState.disconnected());
  }

  bool _isAny(Set<AuthStatus> allowed) => allowed.contains(_state.status);

  AuthenticationState _set(AuthenticationState next) {
    assert(
      _state.status != next.status || _state.server != next.server,
      'No-op auth transition ${_state.status} -> ${next.status}',
    );
    _state = next;
    return next;
  }
}
