import 'package:mobiarmy_flutter/core/network/protocol/message.dart';
import 'package:mobiarmy_flutter/features/room/domain/room_player.dart';
import 'package:mobiarmy_flutter/features/room/domain/room_session_state.dart';

class RoomPacketMapper {
  const RoomPacketMapper();

  /// cmd 8 `loadRoomWait`
  RoomSessionState decodeLoadRoomWait(Message message) {
    final r = message.reader();
    final masterId = r.readInt();
    final bet = r.readInt();
    final roomType = r.readByte();
    final gameMode = r.readByte();

    final players = <int, RoomPlayer>{};
    // Standard MobiArmy2 room has 8 slots
    for (int i = 0; i < 8; i++) {
      final playerId = r.readInt();
      if (playerId == -1) continue;

      final clan = r.readShort();
      final name = r.readUTF();
      r.readInt(); // unknown/unused field
      final level = r.readByte();
      final glassId = r.readByte();

      // 5 equip slots (gun, hat, armor, glasses, wing)
      final equips = [for (var j = 0; j < 5; j++) r.readShort()];
      final isReady = r.readBoolean();

      players[playerId] = RoomPlayer(
        id: playerId,
        name: name,
        level: level,
        clan: clan,
        glassId: glassId,
        equips: equips,
        isReady: isReady,
        slotIndex: i,
        // Team is usually derived from slot index: even = Blue (0), odd = Red (1)
        team: i % 2,
        gun: glassId,
      );
    }

    return RoomSessionState(
      masterId: masterId,
      bet: bet,
      roomType: RoomType.fromInt(roomType),
      gameMode: GameMode.fromInt(gameMode),
      players: players,
    );
  }

  /// cmd 16 `ready` sync (S -> C)
  (int, bool) decodeReady(Message message) {
    final r = message.reader();
    return (r.readInt(), r.readBoolean());
  }

  /// cmd 71 `changeTeam` sync (S -> C)
  (int, int) decodeTeam(Message message) {
    final r = message.reader();
    return (r.readInt(), r.readByte());
  }

  /// cmd 9 `chat` (S -> C)
  (int, String) decodeChat(Message message) {
    final r = message.reader();
    return (r.readInt(), r.readUTF());
  }

  /// cmd 19 `bet` sync (S -> C)
  int decodeBet(Message message) {
    return message.reader().readInt();
  }

  /// cmd 11 `kick` sync (S -> C)
  int decodeKick(Message message) {
    return message.reader().readInt();
  }
}
