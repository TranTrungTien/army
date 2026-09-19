import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:mobiarmy_flutter/core/assets/bmfont.dart';
import 'package:mobiarmy_flutter/core/assets/graphics_utility.dart';
import 'package:mobiarmy_flutter/core/network/data_cache_parsers.dart';
import 'package:mobiarmy_flutter/features/gameplay/domain/player/movement_intent.dart';
import 'package:mobiarmy_flutter/features/gameplay/domain/player/player_movement_state.dart';
import 'package:mobiarmy_flutter/features/gameplay/game/player/equip_anchor.dart';
import 'package:mobiarmy_flutter/features/gameplay/game/player/game_player.dart';
import 'package:mobiarmy_flutter/features/gameplay/game/player/player_sprites.dart';

/// Nhan vat online THAT: body strip tu PlayerSprites (playerdata2 FilePack)
/// + trang bi ve dung cong thuc EquipAnchor (+18/+40, W/H theo glass,
/// mirror khi quay trai, thu tu: SUNG->CANH->FACE->NON->GIAP->KINH).
final class OnlineCharacter extends GamePlayer {
  OnlineCharacter({
    required this.glassId,
    required this.equipIds, // 5 slot: gun, hat, armor, glasses, wing
    required this.name,
    this.maxHp = 1000,
    this.equipAtlas,
  });

  final int glassId;
  final List<int> equipIds;
  final String name;
  @override
  int maxHp;
  ui.Image? equipAtlas; // imgData[glass] — nap tu cmd 126
  ui.Image? _body;

  @override
  int hp = 1000;
  int look = 0; // 0 = phai, 2 = trai
  int frame = 0; // 0..5 animation frame
  bool isReady = false;

  @override
  PlayerMovementState movement = PlayerMovementState(isOnGround: true);

  @override
  MovementIntent intent = MovementIntent.none;

  @override
  void moveTo(double x, double y) => position.setValues(x, y);

  Future<void> load() async {
    _body = await PlayerSprites.instance.body(glassId);
  }

  List<EquipEntry?> get _slots => [
    _find(0), // gun
    _find(1), // hat
    _find(2), // armor
    _find(3), // glasses
    _find(4), // wing
  ];

  EquipEntry? _find(int slotType) {
    final id = slotType < equipIds.length ? equipIds[slotType] : 0;
    for (final e in DataCache.equips) {
      if (e.glass == glassId && e.type == slotType && e.id == id) return e;
    }
    return null;
  }

  @override
  void render(Canvas canvas) {
    final f = frame.clamp(0, 5);
    final isMirror = look == 2;
    final transform =
        isMirror ? GraphicsUtility.transMirror : GraphicsUtility.transNone;

    // Drawing order: SUNG (0) -> CANH (4) -> FACE -> NON (1) -> GIAP (2) -> KINH (3)
    _drawSlot(canvas, _slots[0], f, transform);
    _drawSlot(canvas, _slots[4], f, transform);

    if (_body != null) {
      final src = BodyStrip.srcRegion(_body!, f);
      // Body anchor is BOTTOM | HCENTER
      GraphicsUtility.drawRegion(
        canvas,
        _body!,
        src.left,
        src.top,
        src.width,
        src.height,
        transform,
        0,
        0,
        GraphicsAnchor.bottom | GraphicsAnchor.hCenter,
      );
    } else {
      canvas.drawRect(
        const Rect.fromLTWH(-8, -26, 16, 26),
        Paint()..color = const Color(0xFF94A3B8),
      );
    }

    _drawSlot(canvas, _slots[1], f, transform);
    _drawSlot(canvas, _slots[2], f, transform);
    _drawSlot(canvas, _slots[3], f, transform);

    _drawHpBar(canvas);
  }

  void _drawSlot(Canvas canvas, EquipEntry? e, int f, int transform) {
    if (e == null) return;
    final g = e.frames[f.clamp(0, e.frames.length - 1)];
    final d = EquipAnchor.dest(
      glassId,
      f,
      look,
      0,
      0,
      g.x,
      g.y,
      g.w,
      g.h,
      g.dx,
      g.dy,
    );

    if (equipAtlas != null) {
      // EquipAnchor.dest provides top-left for the target, so we use TOP | LEFT anchor.
      GraphicsUtility.drawRegion(
        canvas,
        equipAtlas!,
        g.x.toDouble(),
        g.y.toDouble(),
        g.w.toDouble(),
        g.h.toDouble(),
        transform,
        d.dx,
        d.dy,
        GraphicsAnchor.top | GraphicsAnchor.left,
      );
    } else {
      canvas.drawRect(
        Rect.fromLTWH(d.dx, d.dy, g.w.toDouble(), g.h.toDouble()),
        Paint()..color = const Color(0x66F59E0B),
      );
    }
  }

  void _drawHpBar(Canvas canvas) {
    final pct = (hp / maxHp).clamp(0.0, 1.0);
    final paint = Paint()..color = Colors.black54;
    canvas.drawRect(const Rect.fromLTWH(-20, -38, 40, 5), paint);
    paint.color = pct > 0.3 ? Colors.green : Colors.red;
    canvas.drawRect(Rect.fromLTWH(-20, -38, 40 * pct, 5), paint);
  }
}
