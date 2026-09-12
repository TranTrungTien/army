import 'package:flame/components.dart';
import 'package:flame/sprite.dart';

class EquipmentLayerComponent extends SpriteComponent {
  EquipmentLayerComponent({required super.priority});
  void applyFrame({
    required Sprite? nextSprite,
    required double offsetX,
    required double offsetY,
    required bool facingLeft,
  }) {
    sprite = nextSprite;
    position.setValues(facingLeft ? -offsetX : offsetX, offsetY);
    scale.x = facingLeft ? -1 : 1;
  }
}
