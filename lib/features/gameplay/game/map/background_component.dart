import 'dart:ui' as ui;
import 'package:flame/components.dart';
import 'package:mobiarmy_flutter/features/gameplay/game/map/game_map_definition.dart';
import 'package:mobiarmy_flutter/features/gameplay/game/army_game.dart';

class BackgroundComponent extends PositionComponent with HasGameReference<ArmyGame> {
  BackgroundComponent({required this.environment, required Vector2 mapSize})
    : super(size: mapSize, priority: -100);

  final MapEnvironmentDefinition environment;
  ui.Image? _bgImage;

  @override
  Future<void> onLoad() async {
    await super.onLoad();
    try {
      // Dùng bigImage0.png thường là hình bầu trời/mây trong Mobi Army 2
      _bgImage = await game.images.load('BigImage/bigImage0.png');
    } catch (_) {
      // Nếu không có bigImage0, thử bigImage7 hoặc bỏ qua
    }
  }

  @override
  void render(ui.Canvas canvas) {
    // Vẽ màu nền xanh trời mặc định của Army 2
    canvas.drawRect(
      ui.Rect.fromLTWH(0, 0, size.x, size.y),
      ui.Paint()..color = const ui.Color(0xFF87CEEB),
    );

    if (_bgImage != null) {
      // Vẽ lặp lại hình nền (Tiled) thay vì kéo giãn toàn bộ
      final paint = ui.Paint()..filterQuality = ui.FilterQuality.none;
      for (double x = 0; x < size.x; x += _bgImage!.width) {
        canvas.drawImage(_bgImage!, ui.Offset(x, 0), paint);
      }
    }

    if (environment.hasWaterOrGlass) {
      canvas.drawRect(
        ui.Rect.fromLTWH(
          0,
          environment.waterY.toDouble(),
          size.x,
          (size.y - environment.waterY).clamp(0.0, size.y).toDouble(),
        ),
        ui.Paint()..color = const ui.Color(0x8838bdf8),
      );
    }
  }
}
