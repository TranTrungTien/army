import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mobiarmy_flutter/features/gameplay/domain/match_state.dart';
import 'gameplay_controller.dart';

export 'gameplay_handler.dart';

final gameplayControllerProvider =
    NotifierProvider<GameplayController, MatchState?>(
  GameplayController.new,
);
