import 'package:mobiarmy_flutter/features/gameplay/domain/character/character_animation_state.dart';
import 'package:mobiarmy_flutter/features/gameplay/domain/character/character_appearance.dart';
import 'package:mobiarmy_flutter/features/gameplay/domain/character/character_definition.dart';
import 'package:mobiarmy_flutter/features/gameplay/domain/character/equipment_definition.dart';
import 'package:mobiarmy_flutter/features/gameplay/domain/player/player_movement_state.dart';
import 'package:mobiarmy_flutter/features/gameplay/game/player/character_animation_controller.dart';
import 'package:mobiarmy_flutter/features/gameplay/game/player/character_sprite_resolver.dart';
import 'package:mobiarmy_flutter/features/gameplay/game/player/equipment_layer_component.dart';
import 'package:mobiarmy_flutter/features/gameplay/domain/player/movement_intent.dart';
import 'package:mobiarmy_flutter/features/gameplay/game/player/game_player.dart';

final class CharacterComponent extends GamePlayer {
  CharacterComponent({
    required this.appearance,
    required this.glassId,
    required this.resolver,
    required this.animationController,
    CharacterAnimationState animation = const CharacterAnimationState(),
    PlayerMovementState? movement,
  }) : _animation = animation,
       _movement = movement ?? PlayerMovementState();

  CharacterAppearance appearance;
  final int glassId;
  final CharacterSpriteResolver resolver;
  final CharacterAnimationController animationController;
  CharacterAnimationState _animation;
  PlayerMovementState _movement;
  final Map<EquipmentSlot, EquipmentLayerComponent> _layers = {};

  @override
  int get hp => _animation.hp;
  @override
  set hp(int value) {
    _animation = _animation.copyWith(hp: value);
  }

  @override
  int get maxHp => _animation.maxHp;
  @override
  set maxHp(int value) {
    _animation = _animation.copyWith(maxHp: value);
  }

  @override
  MovementIntent intent = MovementIntent.none;

  @override
  PlayerMovementState get movement => _movement;
  @override
  set movement(PlayerMovementState value) {
    _movement = value;
  }

  static const Map<EquipmentSlot, int> layerPriority = {
    EquipmentSlot.wing: 10,
    EquipmentSlot.gun: 20,
    EquipmentSlot.hat: 30,
    EquipmentSlot.armor: 40,
    EquipmentSlot.glasses: 50,
  };

  @override
  Future<void> onLoad() async {
    await super.onLoad();
    for (final slot in EquipmentSlot.values) {
      final layer = EquipmentLayerComponent(priority: layerPriority[slot]!);
      _layers[slot] = layer;
      await add(layer);
    }
    _synchronizeLayers();
  }

  @override
  void update(double dt) {
    super.update(dt);

    // 1. Sync Animation Kind with Movement State
    CharacterAnimationKind nextKind = _animation.kind;
    switch (_movement.kind) {
      case PlayerMovementKind.idle:
        nextKind = CharacterAnimationKind.idle;
      case PlayerMovementKind.walking:
        nextKind = CharacterAnimationKind.walk;
      case PlayerMovementKind.falling:
        nextKind = CharacterAnimationKind.idle;
      case PlayerMovementKind.hurt:
        nextKind = CharacterAnimationKind.hurt;
      case PlayerMovementKind.dead:
        nextKind = CharacterAnimationKind.death;
      case PlayerMovementKind.frozen:
        nextKind = CharacterAnimationKind.idle;
      case PlayerMovementKind.teleport:
        nextKind = CharacterAnimationKind.idle;
    }

    // 2. Sync Facing with Movement Intent/Velocity
    CharacterFacing nextFacing = _animation.facing;
    if (_movement.velocity.x > 0.1) {
      nextFacing = CharacterFacing.right;
    } else if (_movement.velocity.x < -0.1) {
      nextFacing = CharacterFacing.left;
    }

    if (nextKind != _animation.kind || nextFacing != _animation.facing) {
       _animation = _animation.copyWith(kind: nextKind, facing: nextFacing, frame: 0, elapsed: 0);
    }

    // 3. Update Animation Frame
    final nextState = animationController.update(_animation, dt);
    if (nextState.frame != _animation.frame || nextState.kind != _animation.kind) {
      _animation = nextState;
      _synchronizeLayers();
    }
  }

  void setAnimation(CharacterAnimationState value) {
    _animation = value;
    _synchronizeLayers();
  }

  void setAppearance(CharacterAppearance value) {
    appearance = value;
    _synchronizeLayers();
  }

  @override
  void moveTo(double x, double y) {
    position.setValues(x, y);
  }

  void _synchronizeLayers() {
    final left = _animation.facing == CharacterFacing.left;
    for (final slot in EquipmentSlot.values) {
      final id = appearance[slot];
      final resolved = id == null
          ? null
          : resolver.resolveEquipment(
              glassId: glassId,
              slot: slot,
              equipmentId: id,
              frame: _animation.frame,
            );
      _layers[slot]?.applyFrame(
        nextSprite: resolved?.sprite,
        offsetX: resolved?.offsetX ?? 0,
        offsetY: resolved?.offsetY ?? 0,
        facingLeft: left,
      );
    }
  }

  CharacterAnimationState get animationState => _animation;
}
