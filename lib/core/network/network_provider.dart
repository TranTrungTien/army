import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mobiarmy_flutter/core/network/transport/session_state_listener.dart';
import 'dispatcher/message_dispatcher.dart';
import 'transport/tcp_session.dart';

final messageDispatcherProvider = Provider<MessageDispatcher>((ref) {
  return MessageDispatcher();
});

final sessionListenerHolderProvider = Provider<SessionListenerHolder>((ref) {
  return SessionListenerHolder();
});

final tcpSessionProvider = Provider<TcpSession>((ref) {
  final dispatcher = ref.watch(messageDispatcherProvider);
  final listener = ref.watch(sessionListenerHolderProvider);
  return TcpSession(dispatcher, listener: listener);
});

final connectionStateProvider = NotifierProvider<ConnectionStateNotifier, bool>(
  ConnectionStateNotifier.new,
);

class ConnectionStateNotifier extends Notifier<bool> {
  @override
  bool build() => false;
}
