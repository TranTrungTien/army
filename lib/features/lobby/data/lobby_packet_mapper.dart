import 'package:mobiarmy_flutter/core/network/protocol/message.dart';
import 'package:mobiarmy_flutter/features/lobby/domain/area_summary.dart';
import 'package:mobiarmy_flutter/features/lobby/domain/board_summary.dart';

/// Decoders for lobby server packets.
/// Parity with SessionHandler.java.
class LobbyPacketMapper {
  const LobbyPacketMapper();

  /// cmd 6 `roomList`
  List<AreaSummary> decodeAreas(Message message) {
    final r = message.reader();
    final areas = <AreaSummary>[];
    while (r.available >= 4) {
      final id = r.readByte();
      final status = r.readByte();
      r.readByte(); // padding 0
      final type = r.readByte();
      areas.add(
        AreaSummary(id: id, status: status, type: type),
      );
    }
    return areas;
  }

  /// cmd 7 `roomWaitList`
  (int, List<BoardSummary>) decodeBoards(Message message) {
    final r = message.reader();
    final areaId = r.readByte();
    final boards = <BoardSummary>[];

    // Each board record is at least:
    // 1 (id) + 1 (num) + 1 (limit) + 1 (pass) + 4 (money) + 1 (started) + 2 (utf len) + 1 (mode) = 12 bytes
    while (r.available >= 12) {
      boards.add(
        BoardSummary(
          id: r.readByte(),
          numPlayers: r.readByte(),
          maxPlayers: r.readByte(),
          hasPassword: r.readBoolean(),
          bet: r.readInt(),
          isStarted: r.readBoolean(),
          name: r.readUTF(),
          mode: r.readByte(),
        ),
      );
    }
    return (areaId, boards);
  }
}
