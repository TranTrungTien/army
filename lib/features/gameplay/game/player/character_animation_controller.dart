import 'package:mobiarmy_flutter/features/gameplay/domain/character/character_animation_state.dart';
import 'package:mobiarmy_flutter/features/gameplay/domain/character/character_definition.dart';

class CharacterAnimationController {
  CharacterAnimationController({required this.framesPerKind, this.secondsPerFrame = 0.12});
  final Map<CharacterAnimationKind, int> framesPerKind;
  final double secondsPerFrame;
  CharacterAnimationState update(CharacterAnimationState state, double dt) {
    final count = framesPerKind[state.kind] ?? 1;
    final elapsed = state.elapsed + dt;
    if (elapsed < secondsPerFrame) return state.copyWith(elapsed: elapsed);
    final advanced = (elapsed / secondsPerFrame).floor();
    return state.copyWith(frame: (state.frame + advanced) % count, elapsed: elapsed - advanced * secondsPerFrame);
  }
}
