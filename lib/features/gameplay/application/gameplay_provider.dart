import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mobiarmy_flutter/core/network/network_provider.dart';
import 'gameplay_handler.dart';

final gameplayHandlerProvider = Provider<GameplayHandler>((ref) {
  final dispatcher = ref.watch(messageDispatcherProvider);
  final handler = GameplayHandler(dispatcher, ref);
  handler.init();
  return handler;
});
