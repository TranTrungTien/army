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

  RoomPlayer copyWith({
    bool? isReady,
    int? team,
    List<int>? equips,
  }) {
    return RoomPlayer(
      id: id,
      name: name,
      level: level,
      clan: clan,
      glassId: glassId,
      equips: equips ?? this.equips,
      isReady: isReady ?? this.isReady,
      team: team ?? this.team,
      slotIndex: slotIndex,
    );
  }

  @override
  String toString() => 'RoomPlayer($name, ready: $isReady, team: $team)';
}
