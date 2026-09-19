import 'dart:ui' as ui;
import 'package:flame/components.dart';
import 'package:mobiarmy_flutter/core/assets/bmfont.dart';
import 'package:mobiarmy_flutter/core/assets/game_asset_loader.dart';
import 'package:mobiarmy_flutter/core/assets/graphics_utility.dart';

/// Port effect/Explosion.java + Smoke.java — frame size lay DUNG tu source:
///   explode ex3.png 59x64 x6f | teleport 32x32 x5f | waterBum 32x48 x5f
///   Eff.png 40x40 x5f | mua.png 13x7 x3f | bomnguyentu 48x62 x4f (delay 3)
///   electric(2) 59x64 x8f (delay 2) | freeze 40x40 x5f (delay 2)
///   khoidoc 32x32 x5f (delay 2) | smoke 14x15 x4f | khoi 27x27 x4f ...
class ExplosionEffect extends Component {
  ExplosionEffect(this.type, this.x, this.y, {this.onDone});
  final int type; // 0 = no, 1 teleport, 2 waterBum, 7 nuke, 8/9 electric, 14 freeze, 15 khoidoc
  final double x, y;
  final void Function()? onDone;

  int curFrame = 0, delay = 0, maxDelay = 1;
  late final int frameW, frameH, endFrame;
  ui.Image? img;
  bool _loaded = false;

  @override
  Future<void> onLoad() async {
    final pack = GameAssets.effect;
    if (pack == null) {
      img = null;
      frameW = 1;
      frameH = 1;
      endFrame = 1;
      _loaded = true;
      return;
    }
    switch (type) {
      case 0: img = await pack.loadImage('ex3.png'); frameW = 59; frameH = 64; endFrame = 5;
      case 1: img = await pack.loadImage('teleport_eff.png'); frameW = 32; frameH = 32; endFrame = 4;
      case 2: img = await pack.loadImage('waterBum.png'); frameW = 32; frameH = 48; endFrame = 4;
      case 3: img = await pack.loadImage('Eff.png'); frameW = 40; frameH = 40; endFrame = 4;
      case 6: img = await pack.loadImage('mua.png'); frameW = 13; frameH = 7; endFrame = 2;
      case 7: img = await pack.loadImage('bomnguyentu.png'); frameW = 48; frameH = 62; endFrame = 3; maxDelay = 3;
      case 8: img = await pack.loadImage('electric.png'); frameW = 59; frameH = 64; endFrame = 7; maxDelay = 2;
      case 9: img = await pack.loadImage('electric2.png'); frameW = 59; frameH = 64; endFrame = 7; maxDelay = 2;
      case 14: img = await pack.loadImage('freeze.png'); frameW = 40; frameH = 40; endFrame = 4; maxDelay = 2;
      case 15: img = await pack.loadImage('khoidoc.png'); frameW = 32; frameH = 32; endFrame = 4; maxDelay = 2;
      default: img = await pack.loadImage('ex3.png'); frameW = 59; frameH = 64; endFrame = 5;
    }
    _loaded = true;
  }

  @override
  void update(double dt) {
    if (!_loaded) return;
    if (++delay > maxDelay) {
      delay = 0;
      if (++curFrame >= endFrame) {
        onDone?.call();
        removeFromParent();
      }
    }
  }

  @override
  void render(ui.Canvas canvas) {
    if (!_loaded || img == null) return;
    final sx = (curFrame * frameW) % img!.width;
    final sy = (curFrame * frameW ~/ img!.width) * frameH;

    // Original anchor: HCENTER | VCENTER with -12 vertical offset
    GraphicsUtility.drawRegion(
      canvas,
      img!,
      sx.toDouble(),
      sy.toDouble(),
      frameW.toDouble(),
      frameH.toDouble(),
      GraphicsUtility.transNone,
      x,
      y - 12,
      GraphicsAnchor.hCenter | GraphicsAnchor.vCenter,
    );
  }
}
