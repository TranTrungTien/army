import 'package:mobiarmy_flutter/features/gameplay/domain/character/character_definition.dart';

class CharacterAnimationState {
  const CharacterAnimationState({this.kind = CharacterAnimationKind.idle, this.frame = 0, this.elapsed = 0, this.facing = CharacterFacing.right});
  final CharacterAnimationKind kind;
  final int frame;
  final double elapsed;
  final CharacterFacing facing;
  CharacterAnimationState copyWith({CharacterAnimationKind? kind, int? frame, double? elapsed, CharacterFacing? facing}) => CharacterAnimationState(kind: kind ?? this.kind, frame: frame ?? this.frame, elapsed: elapsed ?? this.elapsed, facing: facing ?? this.facing);
}
