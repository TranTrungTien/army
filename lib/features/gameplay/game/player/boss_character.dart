import 'package:flutter/material.dart';
import 'package:mobiarmy_flutter/features/gameplay/game/player/sandbox_character_component.dart';

/// Boss variants used by the server match state.
enum BossType {
  defaultBoss,
  gunner,
  miss6;

  static BossType fromGunType(int glassId) {
    if (glassId == 1) return BossType.miss6;
    if (glassId == 0) return BossType.gunner;
    return BossType.defaultBoss;
  }
}

final class BossCharacter extends SandboxCharacterComponent {
  BossCharacter({
    required this.bossType,
    required this.id,
    required super.name,
    required int maxHp,
  }) : super(
          slotEquipment: const {},
          bodyColor: const Color(0xFFDC2626),
          classId: 1,
        ) {
    this.maxHp = maxHp;
    hp = maxHp;
  }

  final BossType bossType;
  final int id;
  int state = 0;
}
