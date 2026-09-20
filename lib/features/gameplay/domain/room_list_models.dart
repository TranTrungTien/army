import 'package:mobiarmy_flutter/core/network/data_cache_parsers.dart';
import 'package:mobiarmy_flutter/core/network/protocol/message.dart';

/// Port MessageHandler case -28 (roomWaitList):
///   raction (byte), roi lap: id(byte) != -1 -> boardID, mapID, cur/max, money(int)
///   id == -1 -> name (UTF) = dong tieu de khu vuc (subLevel)
class RoomInfoEntry {
  RoomInfoEntry.room({
    required this.id, required this.boardId, required this.mapId,
    required this.playerMax, required this.money,
  }) : name = null;
  RoomInfoEntry.header(this.name) : id = -1, boardId = 0, mapId = 0, playerMax = '', money = 0;
  final int id, boardId, mapId, money;
  final String playerMax;
  final String? name;

  String get displayName {
    if (name != null) return name!;
    final mapName = mapId == 100 ? 'Ngau nhien' : (mapId < DataCache.mapNames.length ? DataCache.mapNames[mapId] : '');
    return 'P$id-$boardId ($mapName)';
  }
}

abstract final class RoomListParser {
  static List<RoomInfoEntry> parse(Message msg) {
    final r = msg.reader();
    r.readByte(); // raction
    final out = <RoomInfoEntry>[];
    while (r.available > 0) {
      final id = r.readByte();
      if (id != -1) {
        out.add(RoomInfoEntry.room(
          id: id,
          boardId: r.readByte(),
          mapId: r.readByte(),
          playerMax: '${r.readByte()}/${r.readByte()}',
          money: r.readInt(),
        ));
      } else {
        out.add(RoomInfoEntry.header(r.readUTF()));
      }
    }
    return out;
  }
}