import 'dart:ui' as ui;

/// Port Equipment/Equip.drawImage + PlayerEquip.paint:
/// thu tu ve: SUNG(0) -> CANH(4) -> FACE(body) -> NON(1) -> GIAP(2) -> KINH(3).
///
/// Anchor dung (BAN BAT BUOC dung cong thuc nay, khong dung dx/dy tho):
///   W/H theo glass (bang cung trong Equip.java):
///     glass 0,1,2,4,5,8,9 -> 24 x 24
///     glass 3             -> 30 x 32
///     glass 6             -> 29 x 24
///     glass 7             -> 32 x 32
///   Look == 0 (quay phai):
///     dxDest = X - W/2 + dx[frame] + 18
///     dyDest = Y - H    + dy[frame] + 40
///   Look == 2 (quay trai, mirror):
///     dxDest = X + W/2 - (dx[frame] + 18)
///     dyDest = Y - H    + dy[frame] + 40   (anchor TOP|RIGHT)
abstract final class EquipAnchor {
  static const Map<int, List<int>> glassSize = {
    0: [24, 24], 1: [24, 24], 2: [24, 24], 4: [24, 24],
    5: [24, 24], 8: [24, 24], 9: [24, 24],
    3: [30, 32], 6: [29, 24], 7: [32, 32],
  };

  static int wOf(int glass) => glassSize[glass]?[0] ?? 24;
  static int hOf(int glass) => glassSize[glass]?[1] ?? 24;

  /// Tra ve Rect dich (top-left) de drawImageRect tu atlas imgData[glass].
  static ({double dx, double dy, bool mirror}) dest(
    int glass, int frame, int look, double charX, double charY,
    int srcX, int srcY, int srcW, int srcH, int offDx, int offDy,
  ) {
    final w = wOf(glass).toDouble();
    final h = hOf(glass).toDouble();
    if (look == 0) {
      return (
        dx: charX - w / 2 + offDx + 18,
        dy: charY - h + offDy + 40,
        mirror: false,
      );
    }
    // look == 2
    return (
      dx: charX + w / 2 - (offDx + 18),
      dy: charY - h + offDy + 40,
      mirror: true,
    );
  }
}

/// FACE (PlayerEquip.paintFace): body strip tu CPlayer.pImg[glass],
/// H = imgHeight / 10, lay region (0, frame*H, W, H), anchor BOTTOM|HCENTER.
abstract final class BodyStrip {
  static ui.Rect srcRegion(ui.Image bodyAtlas, int frame) {
    final h = bodyAtlas.height / 10.0;
    return ui.Rect.fromLTWH(0, frame * h, bodyAtlas.width.toDouble(), h);
  }
}