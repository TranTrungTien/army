/// Transport-level callbacks used by the auth layer.
abstract interface class SessionStateListener {
  /// XOR key message (cmd -27) received — handshake done, encryption active.
  void onHandshakeComplete();

  /// Socket closed (by server, network loss, or local dispose).
  void onDisconnected(String? reason);

  /// Socket error before close.
  void onSocketError(Object error);
}

/// Indirection so TcpSession (created in a Riverpod provider) can forward
/// events to whatever controller currently owns the connection — without a
/// provider dependency cycle.
class SessionListenerHolder implements SessionStateListener {
  SessionStateListener? delegate;

  @override
  void onHandshakeComplete() => delegate?.onHandshakeComplete();

  @override
  void onDisconnected(String? reason) => delegate?.onDisconnected(reason);

  @override
  void onSocketError(Object error) => delegate?.onSocketError(error);
}
