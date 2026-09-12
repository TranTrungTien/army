import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'dispatcher/message_dispatcher.dart';
import 'transport/tcp_session.dart';

final messageDispatcherProvider = Provider<MessageDispatcher>((ref) {
  return MessageDispatcher();
});

final tcpSessionProvider = Provider<TcpSession>((ref) {
  final dispatcher = ref.watch(messageDispatcherProvider);
  return TcpSession(dispatcher);
});

final connectionStateProvider = StateProvider<bool>((ref) {
  return false;
});
