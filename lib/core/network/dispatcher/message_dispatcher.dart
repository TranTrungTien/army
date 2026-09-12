import '../protocol/message.dart';

typedef MessageHandler = void Function(Message message);

class MessageDispatcher {
  final Map<int, List<MessageHandler>> _handlers = {};

  void register(int command, MessageHandler handler) {
    _handlers.putIfAbsent(command, () => []).add(handler);
  }

  void unregister(int command, MessageHandler handler) {
    _handlers[command]?.remove(handler);
  }

  void dispatch(Message message) {
    final handlers = _handlers[message.command];
    if (handlers != null) {
      for (final handler in handlers) {
        handler(message);
      }
    }
  }
}
