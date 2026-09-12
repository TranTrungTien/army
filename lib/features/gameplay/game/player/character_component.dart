import 'package:flame/components.dart';
import 'package:mobiarmy_flutter/features/gameplay/domain/character/character_animation_state.dart';
import 'package:mobiarmy_flutter/features/gameplay/domain/character/character_appearance.dart';
import 'package:mobiarmy_flutter/features/gameplay/domain/character/character_definition.dart';
import 'package:mobiarmy_flutter/features/gameplay/domain/character/equipment_definition.dart';
import 'package:mobiarmy_flutter/features/gameplay/domain/player/player_movement_state.dart';
import 'package:mobiarmy_flutter/features/gameplay/game/player/character_sprite_resolver.dart';
import 'package:mobiarmy_flutter/features/gameplay/game/player/equipment_layer_component.dart';

class CharacterComponent extends PositionComponent {
  CharacterComponent({
    required this.appearance,
    required this.glassId,
    required this.resolver,
    CharacterAnimationState animation = const CharacterAnimationState(),
    PlayerMovementState movement = const PlayerMovementState(),
  })  : _animation = animation,
        _movement = movement;

  CharacterAppearance appearance;
  final int glassId;
  final CharacterSpriteResolver resolver;
  CharacterAnimationState _animation;
  PlayerMovementState _movement;

  PlayerMovementState get movement => _movement;
  set movement(PlayerMovementState value) {
    _movement = value;
  }

  static const Map<EquipmentSlot, int> layerPriority = {
    EquipmentSlot.wing: 10,
    EquipmentSlot.gun: 20,
    EquipmentSlot.hat: 30,
    EquipmentSlot.armor: 40,
    EquipmentSlot.glasses: 50
  };

  @override Future<void> onLoad() async {
    await super.onLoad();
    for (final slot in EquipmentSlot.values) {
      final layer = EquipmentLayerComponent(priority: layerPriority[slot]!);
      _layers[slot] = layer;
      await add(layer);
    }
    _synchronizeLayers();
  }

  void setAnimation(CharacterAnimationState value) { _animation = value; _synchronizeLayers(); }
  void setAppearance(CharacterAppearance value) { appearance = value; _synchronizeLayers(); }

  void moveTo(double x, double y) {
    // Simple teleport for now, can add lerp later
    position.setValues(x, y);
  }

  void _synchronizeLayers() {
    final left = _animation.facing == CharacterFacing.left;
    for (final slot in EquipmentSlot.values) {
      final id = appearance[slot];
      final resolved = id == null ? null : resolver.resolveEquipment(glassId: glassId, slot: slot, equipmentId: id, frame: _animation.frame);
      _layers[slot]?.applyFrame(nextSprite: resolved?.sprite, offsetX: resolved?.offsetX ?? 0, offsetY: resolved?.offsetY ?? 0, facingLeft: left);
    }
  }
}
