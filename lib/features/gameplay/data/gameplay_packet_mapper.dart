import 'package:mobiarmy_flutter/core/network/protocol/message.dart';
import 'package:mobiarmy_flutter/features/gameplay/domain/match_state.dart';
import 'package:mobiarmy_flutter/features/room/domain/room_player.dart';
import 'package:mobiarmy_flutter/features/gameplay/game/projectile/projectile_trajectory.dart';

class GameplayPacketMapper {
  const GameplayPacketMapper();

  /// cmd 20 `startGame`
  MatchState decodeStartGame(Message message, Map<int, RoomPlayer> roomPlayers) {
    final r = message.reader();
    final mapId = r.readByte();
    final playerSize = r.readByte();

    final players = <int, MatchPlayer>{};
    for (int i = 0; i < playerSize; i++) {
      final id = r.readInt();
      final x = r.readShort();
      final y = r.readShort();

      final base = roomPlayers[id];
      if (base != null) {
        players[id] = MatchPlayer(base: base, x: x, y: y);
      }
    }
    if (r.available > 0) r.readByte();

    return MatchState(mapId: mapId, players: players, status: MatchLoopStatus.loadingMap);
  }

  /// cmd 24 `setTurn`
  (int, int) decodeNextTurn(Message message) {
    final r = message.reader();
    return (r.readInt(), r.readShort());
  }

  /// cmd 25 `setWind`
  (int, int) decodeWind(Message message) {
    final r = message.reader();
    final windX = r.readShort();
    final windY = r.available >= 2 ? r.readShort() : 0;
    return (windX, windY);
  }

  /// cmd 21 `move` sync
  (int, int, int, int) decodeMove(Message message) {
    final r = message.reader();
    return (r.readInt(), r.readByte(), r.readShort(), r.readShort());
  }

  /// cmd 53 `updateXy`
  (int, int, int) decodeUpdateXy(Message message) {
    final r = message.reader();
    return (r.readInt(), r.readShort(), r.readShort());
  }

  /// cmd 22 `shoot`
  ShootData decodeShoot(Message message) {
    final r = message.reader();
    final typeShoot = r.readByte();
    final isPow = r.readByte() == 1;
    final playerId = r.readInt();
    final bulletId = r.readByte();
    final gunX = r.readShort();
    final gunY = r.readShort();
    final angle = r.readShort();
    final nShot = r.readByte();
    final numBullets = r.readByte();

    final allTrajectories = <ProjectileTrajectory>[];
    for (int i = 0; i < numBullets; i++) {
      final numFrames = r.readShort();
      final frames = <TrajectoryFrame>[];
      int lastX = 0;
      int lastY = 0;
      for (int j = 0; j < numFrames; j++) {
        if (j == 0 || typeShoot == 1) {
          lastX = r.readShort();
          lastY = r.readShort();
        } else {
          lastX += r.readByte();
          lastY += r.readByte();
        }
        frames.add(TrajectoryFrame(x: lastX, y: lastY));
      }
      allTrajectories.add(
        ProjectileTrajectory(bulletId: bulletId, frames: frames),
      );
    }

    return ShootData(
      playerId: playerId,
      isPow: isPow,
      bulletId: bulletId,
      gunX: gunX,
      gunY: gunY,
      angle: angle,
      nShot: nShot,
      trajectories: allTrajectories,
    );
  }

  /// cmd 23 `shootResult`
  List<HitResult> decodeShootResult(Message message) {
    final r = message.reader();
    final numHits = r.readByte();
    final results = <HitResult>[];
    for (int i = 0; i < numHits; i++) {
      results.add(HitResult(
        playerId: r.readInt(),
        damage: r.readInt(),
        newHp: r.readInt(),
        isDead: r.readBoolean(),
      ));
    }
    return results;
  }

  /// cmd 49 `skipTurn`
  int decodeSkipTurn(Message message) {
    return message.reader().readInt();
  }

  /// cmd 15 `leaveRoomWait` / `leaveMatch`
  int decodeLeave(Message message) {
    return message.reader().readInt();
  }

  /// cmd 26 `useItem`
  (int, int) decodeUseItem(Message message) {
    final r = message.reader();
    return (r.readInt(), r.readByte());
  }

  /// cmd 100 `finishMatch`
  MatchResult decodeFinishMatch(Message message) {
    final r = message.reader();
    final numPlayers = r.readByte();
    final results = <PlayerMatchResult>[];
    for (int i = 0; i < numPlayers; i++) {
      results.add(PlayerMatchResult(
        playerId: r.readInt(),
        exp: r.readInt(),
        xu: r.readInt(),
        luong: r.readInt(),
      ));
    }
    return MatchResult(playerResults: results);
  }
}

class ShootData {
  const ShootData({
    required this.playerId,
    required this.isPow,
    required this.bulletId,
    required this.gunX,
    required this.gunY,
    required this.angle,
    required this.nShot,
    required this.trajectories,
  });

  final int playerId;
  final bool isPow;
  final int bulletId;
  final int gunX;
  final int gunY;
  final int angle;
  final int nShot;
  final List<ProjectileTrajectory> trajectories;
}

class MatchResult {
  const MatchResult({required this.playerResults});
  final List<PlayerMatchResult> playerResults;
}

class PlayerMatchResult {
  const PlayerMatchResult({
    required this.playerId,
    required this.exp,
    required this.xu,
    required this.luong,
  });
  final int playerId;
  final int exp;
  final int xu;
  final int luong;
}

class HitResult {
  const HitResult({
    required this.playerId,
    required this.damage,
    required this.newHp,
    required this.isDead,
  });
  final int playerId;
  final int damage;
  final int newHp;
  final bool isDead;
}
