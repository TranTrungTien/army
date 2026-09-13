import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mobiarmy_flutter/core/network/command/commands.dart';
import 'package:mobiarmy_flutter/core/network/network_provider.dart';
import 'package:mobiarmy_flutter/core/network/protocol/message.dart';
import 'package:mobiarmy_flutter/core/network/transport/tcp_session.dart';

/// Port chat in-game:
///   gui:   GameService.chatToBoard(text) — cmd 9 + writeUTF
///   nhan:  MessageHandler case 9 — from(int idDB) + text(UTF)
class ChatMessage {
  ChatMessage(this.fromId, this.fromName, this.text);
  final int fromId;
  final String fromName; // TODO: doi idDB -> ten qua room players
  final String text;
}

class ChatService extends Notifier<List<ChatMessage>> {
  late final TcpSession _session;

  @override
  List<ChatMessage> build() {
    _session = ref.watch(tcpSessionProvider);
    ref.watch(messageDispatcherProvider).register(Commands.chat, _onChat);
    return const [];
  }

  void _onChat(Message msg) {
    final r = msg.reader();
    final from = r.readInt();
    final text = r.readUTF();
    state = [...state, ChatMessage(from, 'Nguoi choi $from', text)];
  }

  Future<void> send(String text) async {
    final m = Message(Commands.chat);
    m.writer().writeUTF(text);
    await _session.sendMessage(m);
  }
}

final chatServiceProvider =
    NotifierProvider<ChatService, List<ChatMessage>>(ChatService.new);