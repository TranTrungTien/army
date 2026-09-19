import 'package:mobiarmy_flutter/features/gameplay/domain/character/character_definition.dart';

class CharacterAnimationState {
  const CharacterAnimationState({
    this.kind = CharacterAnimationKind.idle,
    this.frame = 0,
    this.elapsed = 0,
    this.facing = CharacterFacing.right,
    this.hp = 1000,
    this.maxHp = 1000,
    this.angle = 0,
    this.force = 0,
    this.isAngry = false,
    this.isFrozen = false,
    this.isPoisoned = false,
    this.isSmoked = false,
    this.isWebbed = false,
    this.isTimeBomb = false,
    this.isInvisible = false,
  });

  final CharacterAnimationKind kind;
  final int frame;
  final double elapsed;
  final CharacterFacing facing;
  final int hp;
  final int maxHp;
  final int angle;
  final int force;
  final bool isAngry;
  final bool isFrozen;
  final bool isPoisoned;
  final bool isSmoked;
  final bool isWebbed;
  final bool isTimeBomb;
  final bool isInvisible;

  CharacterAnimationState copyWith({
    CharacterAnimationKind? kind,
    int? frame,
    double? elapsed,
    CharacterFacing? facing,
    int? hp,
    int? maxHp,
    int? angle,
    int? force,
    bool? isAngry,
    bool? isFrozen,
    bool? isPoisoned,
    bool? isSmoked,
    bool? isWebbed,
    bool? isTimeBomb,
    bool? isInvisible,
  }) => CharacterAnimationState(
    kind: kind ?? this.kind,
    frame: frame ?? this.frame,
    elapsed: elapsed ?? this.elapsed,
    facing: facing ?? this.facing,
    hp: hp ?? this.hp,
    maxHp: maxHp ?? this.maxHp,
    angle: angle ?? this.angle,
    force: force ?? this.force,
    isAngry: isAngry ?? this.isAngry,
    isFrozen: isFrozen ?? this.isFrozen,
    isPoisoned: isPoisoned ?? this.isPoisoned,
    isSmoked: isSmoked ?? this.isSmoked,
    isWebbed: isWebbed ?? this.isWebbed,
    isTimeBomb: isTimeBomb ?? this.isTimeBomb,
    isInvisible: isInvisible ?? this.isInvisible,
  );
}
