import 'package:flutter/widgets.dart';
import 'package:mobiarmy_flutter/core/audio/audio_service.dart';
import 'package:mobiarmy_flutter/core/network/connection_lifecycle.dart';
import 'package:mobiarmy_flutter/features/gameplay/game/army_game.dart';

class AppLifecycleCoordinator with WidgetsBindingObserver {
  AppLifecycleCoordinator({
    required this.game,
    required this.connection,
    required this.audio,
  });
  final ArmyGame game;
  final ConnectionLifecycle connection;
  final AudioService audio;
  bool _disposed = false;

  void start() => WidgetsBinding.instance.addObserver(this);

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (_disposed) return;
    switch (state) {
      case AppLifecycleState.resumed:
        connection.onForeground();
        game.resumeSafely();
        audio.resumeAll();
      case AppLifecycleState.inactive:
      case AppLifecycleState.hidden:
      case AppLifecycleState.paused:
      case AppLifecycleState.detached:
        game.pauseSafely();
        connection.onBackground();
        audio.pauseAll();
    }
  }

  void dispose() {
    if (_disposed) return;
    _disposed = true;
    WidgetsBinding.instance.removeObserver(this);
  }
}
