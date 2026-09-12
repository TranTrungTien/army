import 'dart:math' as math;
import 'dart:ui';

import 'package:mobiarmy_flutter/features/gameplay/domain/character/equipment_definition.dart';
import 'package:mobiarmy_flutter/features/gameplay/domain/player/player_movement_state.dart';
import 'package:mobiarmy_flutter/features/gameplay/game/player/game_player.dart';

/// Placeholder character for the offline vertical slice.
///
/// Renders a body box plus one rect per equipment slot using the REAL frame
/// geometry (dx/dy/w/h) from the server `equip` table, so layer offsets and
/// anchor conventions are exercised before real sprites land (Phase 3/5).
final class SandboxCharacterComponent extends GamePlayer {
  SandboxCharacterComponent({
    required this.slotEquipment,
    required this.bodyColor,
    this.aimAngle = 45,
  });

  final Map<EquipmentSlot, EquipmentDefinition> slotEquipment;
  final Color bodyColor;
  int aimAngle;

  PlayerMovementState _movement = PlayerMovementState(isOnGround: true);

  @override
  PlayerMovementState get movement => _movement;

  @override
  set movement(PlayerMovementState value) => _movement = value;

  @override
  void moveTo(double x, double y) => position.setValues(x, y);

  static const Map<EquipmentSlot, Color> _slotColors = {
    EquipmentSlot.gun: Color(0xFF475569),
    EquipmentSlot.hat: Color(0xFFDC2626),
    EquipmentSlot.armor: Color(0xFF2563EB),
    EquipmentSlot.glasses: Color(0xFFF59E0B),
    EquipmentSlot.wing: Color(0xFF10B981),
  };

  @override
  void render(Canvas canvas) {
    // Body: feet at (0,0), head up.
    canvas.drawRect(
      const Rect.fromLTWH(-8, -26, 16, 26),
      Paint()..color = bodyColor,
    );

    // Aim indicator using the legacy angle convention (0 = right, 90 = up).
    final radians = aimAngle * math.pi / 180.0;
    final aimPaint = Paint()
      ..color = const Color(0xFFFFEB3B)
      ..strokeWidth = 2;
    canvas.drawLine(
      const Offset(0, -12),
      Offset(math.cos(radians) * 36, -12 - math.sin(radians) * 36),
      aimPaint,
    );

    // Equipment placeholders with real dx/dy/w/h offsets.
    for (final slot in EquipmentSlot.values) {
      final definition = slotEquipment[slot];
      if (definition == null) continue;
      final g = definition.frame(0);
      canvas.drawRect(
        Rect.fromLTWH(
          g.offsetX.toDouble(),
          g.offsetY.toDouble(),
          g.width.toDouble(),
          g.height.toDouble(),
        ),
        Paint()..color = _slotColors[slot] ?? const Color(0xFF9CA3AF),
      );
    }
  }
}
