import 'package:mobiarmy_flutter/features/gameplay/data/gameplay_packet_mapper.dart';
import 'package:mobiarmy_flutter/features/room/domain/room_player.dart';

enum MatchLoopStatus {
  preparing,
  loadingMap,
  spawning,
  turnStart,
  playerInput,
  firing,
  projectilePlayback,
  resolvingImpact,
  turnEnd,
  nextTurn,
  matchEnd,
}

/// Runtime data for an active match with strict FSM tracking.
class MatchState {
  const MatchState({
    required this.mapId,
    required this.players,
    this.status = MatchLoopStatus.preparing,
    this.currentTurnPlayerId,
    this.turnTimeSeconds = 0,
    this.windX = 0,
    this.windY = 0,
    this.isMatchEnded = false,
    this.matchResult,
    this.lastShoot,
  });

  final int mapId;
  final Map<int, MatchPlayer> players;
  final MatchLoopStatus status;
  final int? currentTurnPlayerId;
  final int turnTimeSeconds;
  final int windX;
  final int windY;
  final bool isMatchEnded;
  final MatchResult? matchResult;
  final ShootData? lastShoot;

  MatchState copyWith({
    MatchLoopStatus? status,
    int? currentTurnPlayerId,
    int? turnTimeSeconds,
    int? windX,
    int? windY,
    Map<int, MatchPlayer>? players,
    bool? isMatchEnded,
    MatchResult? matchResult,
    ShootData? lastShoot,
  }) {
    return MatchState(
      mapId: mapId,
      players: players ?? this.players,
      status: status ?? this.status,
      currentTurnPlayerId: currentTurnPlayerId ?? this.currentTurnPlayerId,
      turnTimeSeconds: turnTimeSeconds ?? this.turnTimeSeconds,
      windX: windX ?? this.windX,
      windY: windY ?? this.windY,
      isMatchEnded: isMatchEnded ?? this.isMatchEnded,
      matchResult: matchResult ?? this.matchResult,
      lastShoot: lastShoot ?? this.lastShoot,
    );
  }
}

/// Runtime extension of RoomPlayer during gameplay.
class MatchPlayer {
  const MatchPlayer({
    required this.base,
    required this.x,
    required this.y,
    this.hp = 1000,
    this.maxHp = 1000,
    this.stamina = 100.0,
    this.isDead = false,
    this.state = 0,
  });

  final RoomPlayer base;
  final int x;
  final int y;
  final int hp;
  final int maxHp;
  final double stamina;
  final bool isDead;
  final int state;

  MatchPlayer copyWith({
    int? x,
    int? y,
    int? hp,
    double? stamina,
    bool? isDead,
    int? state,
  }) {
    return MatchPlayer(
      base: base,
      x: x ?? this.x,
      y: y ?? this.y,
      hp: hp ?? this.hp,
      stamina: stamina ?? this.stamina,
      isDead: isDead ?? this.isDead,
      state: state ?? this.state,
    );
  }
}
