import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:mobiarmy_flutter/core/network/data_cache_parsers.dart';
import 'package:mobiarmy_flutter/features/gameplay/domain/player/movement_intent.dart';
import 'package:mobiarmy_flutter/features/gameplay/domain/player/player_movement_state.dart';
import 'package:mobiarmy_flutter/features/gameplay/game/player/equip_anchor.dart';
import 'package:mobiarmy_flutter/features/gameplay/game/player/game_player.dart';
import 'package:mobiarmy_flutter/features/gameplay/game/player/player_sprites.dart';

/// Nhan vat online THAT: body strip tu PlayerSprites (playerdata2 FilePack)
/// + trang bi ve dung cong thuc EquipAnchor (+18/+40, W/H theo glass,
/// mirror khi quay trai, thu tu: SUNG->CANH->FACE->NON->GIAP->KINH).
///
/// Atlas trang bi (PlayerEquip.imgData[glass]) nap qua getMaterialIcon
/// cmd 126 — truyen vao [equipAtlas] neu da co; chua co thi ve placeholder
/// rect dung anchor that de kiem chung vi tri.
final class OnlineCharacter extends GamePlayer {
  OnlineCharacter({
    required this.glassId,
    required this.equipIds,       // 5 slot: gun, hat, armor, glasses, wing
    required this.name,
    this.maxHp = 1000,
    this.equipAtlas,
  });

  final int glassId;
  final List<int> equipIds;
  final String name;
  @override
  int maxHp;
  ui.Image? equipAtlas;           // imgData[glass] — TODO nap tu cmd 126
  ui.Image? _body;

  @override
  int hp = 1000;
  int look = 0;                   // 0 = phai, 2 = trai
  int frame = 0;                  // 0..5 animation frame
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

    // 1. SUNG (slot 0) — ve TRUOC body
    _drawSlot(canvas, _slots[0], f);
    // 2. CANH (slot 4)
    _drawSlot(canvas, _slots[4], f);
    // 3. FACE — body strip, anchor BOTTOM|HCENTER, H = height/10
    if (_body != null) {
      final src = BodyStrip.srcRegion(_body!, f);
      final dst = Rect.fromLTWH(-_body!.width / 2, -_body!.height / 10,
          _body!.width.toDouble(), _body!.height / 10);
      _drawMirrored(canvas, _body!, src, dst);
    } else {
      canvas.drawRect(const Rect.fromLTWH(-8, -26, 16, 26),
          Paint()..color = const Color(0xFF94A3B8));
    }
    // 4. NON (1) -> 5. GIAP (2) -> 6. KINH (3)
    _drawSlot(canvas, _slots[1], f);
    _drawSlot(canvas, _slots[2], f);
    _drawSlot(canvas, _slots[3], f);

    // Thanh HP + ten
    _drawHpBar(canvas);
  }

  void _drawSlot(Canvas canvas, EquipEntry? e, int f) {
    if (e == null) return;
    final g = e.frames[f.clamp(0, e.frames.length - 1)];
    final d = EquipAnchor.dest(
      glassId, f, look, 0, 0, g.x, g.y, g.w, g.h, g.dx, g.dy,
    );
    if (equipAtlas != null) {
      final src = Rect.fromLTWH(
          g.x.toDouble(), g.y.toDouble(), g.w.toDouble(), g.h.toDouble());
      final dst = Rect.fromLTWH(
          d.dx - (look == 2 ? g.w.toDouble() : 0), d.dy,
          g.w.toDouble(), g.h.toDouble());
      _drawMirrored(canvas, equipAtlas!, src, dst);
    } else {
      // Placeholder dung anchor that (kiem chung vi tri truoc khi co atlas)
      canvas.drawRect(
        Rect.fromLTWH(d.dx, d.dy, g.w.toDouble(), g.h.toDouble()),
        Paint()..color = const Color(0x66F59E0B),
      );
    }
  }

  void _drawMirrored(Canvas canvas, ui.Image img, Rect src, Rect dst) {
    if (look == 2) {
      canvas.save();
      canvas.translate(dst.left + dst.width, 0);
      canvas.scale(-1, 1);
      canvas.drawImageRect(img, src,
          Rect.fromLTWH(0, dst.top, dst.width, dst.height), Paint());
      canvas.restore();
    } else {
      canvas.drawImageRect(img, src, dst, Paint());
    }
  }

  void _drawHpBar(Canvas canvas) {
    final pct = (hp / maxHp).clamp(0.0, 1.0);
    canvas.drawRect(Rect.fromLTWH(-20, -38, 40, 5),
        Paint()..color = Colors.black54);
    canvas.drawRect(Rect.fromLTWH(-20, -38, 40 * pct, 5),
        Paint()..color = pct > 0.3 ? Colors.green : Colors.red);
  }
}