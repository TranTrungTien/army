import 'package:flame/components.dart';
import 'package:mobiarmy_flutter/features/gameplay/game/army_game.dart';
import 'package:mobiarmy_flutter/features/gameplay/game/effects/damage_text_component.dart';
import 'package:mobiarmy_flutter/features/gameplay/domain/player/player_movement_state.dart';

class CombatSystem extends Component with HasGameReference<ArmyGame> {
  void applyDamage(int playerId, int damage, int newHp, bool isDead) {
    final player = game.players[playerId];
    if (player == null) return;

    game.gameWorld.add(DamageTextComponent(
      position: player.position - Vector2(0, 30),
      damage: damage,
    ));

    player.hp = newHp;
    if (isDead) {
      player.movement = player.movement.copyWith(kind: PlayerMovementKind.dead);
    } else {
      player.movement = player.movement.copyWith(kind: PlayerMovementKind.hurt);
    }
  }
}
