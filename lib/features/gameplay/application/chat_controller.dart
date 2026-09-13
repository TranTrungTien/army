import 'package:flutter_riverpod/flutter_riverpod.dart';

class ChatMessage {
  ChatMessage({required this.sender, required this.text});
  final String sender;
  final String text;
  final DateTime timestamp = DateTime.now();
}

class ChatController extends Notifier<List<ChatMessage>> {
  @override
  List<ChatMessage> build() => [];

  void addMessage(String sender, String text) {
    state = [...state, ChatMessage(sender: sender, text: text)];
    if (state.length > 50) {
      state = state.sublist(state.length - 50);
    }
  }

  void clear() => state = [];
}

final chatControllerProvider = NotifierProvider<ChatController, List<ChatMessage>>(ChatController.new);
