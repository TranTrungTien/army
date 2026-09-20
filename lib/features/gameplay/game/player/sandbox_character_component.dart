import 'dart:math' as math;
import 'dart:ui' as ui;

import 'package:flame/components.dart';
import 'package:mobiarmy_flutter/features/gameplay/domain/character/equipment_definition.dart';
import 'package:mobiarmy_flutter/features/gameplay/domain/player/movement_intent.dart';
import 'package:mobiarmy_flutter/features/gameplay/domain/player/player_movement_state.dart';
import 'package:mobiarmy_flutter/features/gameplay/game/army_game.dart';
import 'package:mobiarmy_flutter/features/gameplay/game/player/game_player.dart';

/// Placeholder character for the offline vertical slice.
///
/// Renders real sprite sheets from Teamobi `assets/equip/` using real frame
/// geometry so layer offsets and anchor conventions are exercised.
final class SandboxCharacterComponent extends GamePlayer with HasGameReference<ArmyGame> {
  SandboxCharacterComponent({
    required this.slotEquipment,
    required this.bodyColor,
    this.name = 'Bot',
    this.aimAngle = 45,
    this.classId = 1,
  }) : super(priority: 50);

  final Map<EquipmentSlot, EquipmentDefinition> slotEquipment;
  final ui.Color bodyColor;
  final int classId;
  int aimAngle;
  @override
  final String name;

  PlayerMovementState _movement = PlayerMovementState(isOnGround: true);
  ui.Image? _characterImage;
  bool _isLookingLeft = false;

  @override
  int hp = 1000;

  @override
  int maxHp = 1000;

  @override
  MovementIntent intent = MovementIntent.none;

  @override
  PlayerMovementState get movement => _movement;

  @override
  set movement(PlayerMovementState value) => _movement = value;

  @override
  void moveTo(double x, double y) => position.setValues(x, y);

  @override
  Future<void> onLoad() async {
    await super.onLoad();
    try {
      final paddedId = classId.toString().padLeft(2, '0');
      // Load image using Flame's standard cache
      _characterImage = await game.images.load('equip/$paddedId.png');
    } catch (e) {
      // Fallback handled in render
    }
  }

  @override
  void update(double dt) {
    super.update(dt);
    if (_movement.velocity.x < -0.1) {
      _isLookingLeft = true;
    } else if (_movement.velocity.x > 0.1) {
      _isLookingLeft = false;
    }
  }

  @override
  void render(ui.Canvas canvas) {
    canvas.save();

    if (_isLookingLeft) {
      canvas.scale(-1, 1);
    }

    if (_characterImage != null) {
      // Standard Mobi Army 2 character frame is 24x24
      canvas.drawImageRect(
        _characterImage!,
        const ui.Rect.fromLTWH(0, 0, 24, 24),
        const ui.Rect.fromLTWH(-12, -24, 24, 24),
        ui.Paint(),
      );
    } else {
      // Fallback body: feet at (0,0), head up.
      canvas.drawRect(
        const ui.Rect.fromLTWH(-8, -26, 16, 26),
        ui.Paint()..color = bodyColor,
      );
    }

    canvas.restore();

    // Aim indicator
    final angleInRadians = (_isLookingLeft ? (180 - aimAngle) : aimAngle) * math.pi / 180.0;
    canvas.drawLine(
      const ui.Offset(0, -12),
      ui.Offset(math.cos(angleInRadians) * 30, -12 - math.sin(angleInRadians) * 30),
      ui.Paint()..color = const ui.Color(0xFFFFEB3B)..strokeWidth = 2,
    );

    _renderHUD(canvas);
  }

  void _renderHUD(ui.Canvas canvas) {
    // HP Bar background
    final barWidth = 30.0;
    final barHeight = 3.0;
    final topOffset = -35.0;

    canvas.drawRect(
      ui.Rect.fromLTWH(-barWidth / 2, topOffset, barWidth, barHeight),
      ui.Paint()..color = const ui.Color(0xFF000000),
    );

    // HP Bar foreground
    final hpPercent = (hp / maxHp).clamp(0.0, 1.0);
    canvas.drawRect(
      ui.Rect.fromLTWH(-barWidth / 2, topOffset, barWidth * hpPercent, barHeight),
      ui.Paint()..color = const ui.Color(0xFF00FF00),
    );
  }
}
