/// Summary of a game board (Bàn) within an area.
/// Parity with SessionHandler.java: loadRoomWaits (cmd 7).
class BoardSummary {
  const BoardSummary({
    required this.id,
    required this.numPlayers,
    required this.maxPlayers,
    required this.hasPassword,
    required this.bet,
    required this.isStarted,
    required this.name,
    required this.mode,
  });

  final int id;
  final int numPlayers;
  final int maxPlayers;
  final bool hasPassword;
  final int bet;
  final bool isStarted;
  final String name;
  final int mode;

  @override
  String toString() => 'BoardSummary(id: $id, name: $name, players: $numPlayers/$maxPlayers)';
}
