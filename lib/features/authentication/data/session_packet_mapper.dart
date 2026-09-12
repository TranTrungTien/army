import 'package:mobiarmy_flutter/core/network/protocol/message.dart';
import 'package:mobiarmy_flutter/features/authentication/domain/user_session.dart';

/// Decoders for the auth-phase server packets.
///
/// Field order is byte-for-byte the inverse of `SessionHandler.java`:
/// loadInfoAll (cmd 3), log (cmd 45), idNotColision (cmd 92).
class SessionPacketMapper {
  const SessionPacketMapper();

  static const int glassCount = 10; // glass table ids 0..9
  static const int equipSlotCount = 5; // gun, hat, armor, glasses, wing
  static const int itemCount = 36; // item table ids 0..35
  static const int shopGlassCount = 7; // glass id > 2 -> 3..9

  /// cmd 45 `log` — UTF message. During auth this means login failure;
  /// outside auth it is a general server notice.
  String decodeLog(Message message) => message.reader().readUTF();

  /// cmd 3 `loadInfoAll`.
  UserSession decodeLoadInfoAll(Message message) {
    final r = message.reader();
    final id = r.readInt();
    final xu = r.readInt();
    final luong = r.readInt();
    final selectGlass = r.readByte();
    r.readShort(); // -1
    r.readByte(); // 0

    final glasses = <GlassSlotData>[];
    for (var i = 0; i < glassCount; i++) {
      final hasData = r.readBoolean();
      final data = hasData
          ? [for (var j = 0; j < equipSlotCount; j++) r.readShort()]
          : <int>[];
      final equipIds = [for (var j = 0; j < equipSlotCount; j++) r.readShort()];
      glasses.add(
        GlassSlotData(hasData: hasData, data: data, equipIds: equipIds),
      );
    }

    final items = <ItemStock>[];
    for (var i = 0; i < itemCount; i++) {
      items.add(
        ItemStock(num: r.readByte(), xu: r.readInt(), luong: r.readInt()),
      );
    }

    final shop = <GlassShopEntry>[];
    for (var i = 0; i < shopGlassCount; i++) {
      shop.add(
        GlassShopEntry(
          isOpen: r.readByte() == 1,
          xu: r.readShort(),
          luong: r.readShort(),
        ),
      );
    }

    // Trailing UTFs "a", "b", "c" — consume if present, but do not fail the
    // parse if a future server version appends more fields.
    if (r.available > 0) {
      r.readUTF();
      if (r.available > 0) r.readUTF();
      if (r.available > 0) r.readUTF();
    }

    return UserSession(
      id: id,
      xu: xu,
      luong: luong,
      selectGlass: selectGlass,
      glasses: List.unmodifiable(glasses),
      items: List.unmodifiable(items),
      glassShop: List.unmodifiable(shop),
    );
  }

  /// cmd 92 `idNotColision` — tile ids that ignore terrain collision.
  List<int> decodeIdNotCollision(Message message) {
    final r = message.reader();
    final count = r.readShort();
    return [for (var i = 0; i < count; i++) r.readShort()];
  }
}
