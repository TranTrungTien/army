/// A player inside a waiting room.
class RoomPlayer {
  const RoomPlayer({
    required this.id,
    required this.name,
    required this.level,
    required this.clan,
    required this.glassId,
    required this.equips,
    this.isReady = false,
    this.team = 0,
    this.slotIndex = -1,
    this.gun = 0,
    this.connectionState = 'connected',
  });

  final int id;
  final String name;
  final int level;
  final int clan;
  final int glassId;
  final List<int> equips;
  final bool isReady;
  final int team;
  final int slotIndex;
  final int gun;
  final String connectionState;

  RoomPlayer copyWith({
    bool? isReady,
    int? team,
    List<int>? equips,
    int? gun,
    String? connectionState,
    int? glassId,
  }) {
    return RoomPlayer(
      id: id,
      name: name,
      level: level,
      clan: clan,
      glassId: glassId ?? this.glassId,
      equips: equips ?? this.equips,
      isReady: isReady ?? this.isReady,
      team: team ?? this.team,
      slotIndex: slotIndex,
      gun: gun ?? this.gun,
      connectionState: connectionState ?? this.connectionState,
    );
  }

  @override
  String toString() => 'RoomPlayer($name, ready: $isReady, team: $team)';
}
