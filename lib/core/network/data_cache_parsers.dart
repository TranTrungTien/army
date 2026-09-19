import 'dart:typed_data';
import 'package:mobiarmy_flutter/core/network/codec/byte_reader.dart';

/// Port CCanvas.readMess(data, command) — parse cac record cache tu server:
///   command 0 (valuesdata2): danh sach map — MM.mapFiles + MM.mapName
///   command 1 (equipdata2) : cay trang bi — EquipGlass/TypeEquip/Equip
///   command 2 (levelCData2): danh hieu level
///
/// Du lieu equip/atlas tu server se gan vao render qua EquipAnchor.
class MapFileEntry {
  MapFileEntry(this.fileId, this.data, this.values, this.name, this.fileName);
  final int fileId;
  final Uint8List data;       // fData — binary map (MapFile format)
  final List<int> values;     // 5 short: bg, mapAddY, bullEffShower, inWaterAddY, cl2AddY
  final String name;
  final String fileName;
}

class EquipFrameData {
  EquipFrameData(this.x, this.y, this.w, this.h, this.dx, this.dy);
  final int x, y, w, h, dx, dy;
}

class EquipEntry {
  EquipEntry({
    required this.id, required this.type, required this.glass,
    required this.bullet, required this.icon, required this.level,
    required this.frames, required this.invAbility, required this.invPercen,
  });
  final int id, type, glass, bullet, icon, level;
  final List<EquipFrameData> frames; // 6 frame
  final List<int> invAbility;        // 5
  final List<int> invPercen;         // 5
}

class DataCache {
  DataCache._();
  static final List<MapFileEntry> mapFiles = [];
  static final List<String> mapNames = [];
  static List<EquipEntry> equips = [];
  static List<String> levelCaptions = [];
  static List<int> levelCaptionTypes = [];
  static Map<int, int> glassMaxDamage = {};
}

abstract final class DataCacheParsers {
  /// readMess(data, 0): MM maps
  static void parseMapList(Uint8List data) {
    final r = ByteReader(data);
    final n = r.readByte();
    DataCache.mapFiles.clear();
    DataCache.mapNames.clear();
    for (var i = 0; i < n; i++) {
      final fileId = r.readByte();
      final len = r.readUnsignedShort();
      final fData = r.readBytes(len);
      final values = [for (var j = 0; j < 5; j++) r.readShort()];
      final name = r.readUTF();
      final fileName = r.readUTF();
      DataCache.mapFiles.add(MapFileEntry(fileId, fData, values, name, fileName));
      DataCache.mapNames.add(name);
    }
  }

  /// readMess(data, 1): PlayerEquip tree. Icon image + 10 bullet PNG nam SAU
  /// trong cung message (iconImg: short len + bytes; bullets: 10 x short len + bytes).
  static void parseEquipTree(Uint8List data) {
    final r = ByteReader(data);
    DataCache.equips = [];
    DataCache.glassMaxDamage = {};
    final nGlass = r.readByte();
    for (var g = 0; g < nGlass; g++) {
      final glassId = r.readByte();
      final maxDamage = r.readShort();
      DataCache.glassMaxDamage[glassId] = maxDamage;
      final nType = r.readByte();
      for (var t = 0; t < nType; t++) {
        final type = r.readByte();
        final nEquip = r.readByte();
        for (var e = 0; e < nEquip; e++) {
          final id = r.readShort();
          var bullet = -1;
          if (type == 0) bullet = r.readByte();
          final icon = r.readShort();
          final level = r.readByte();
          final frames = <EquipFrameData>[];
          for (var k = 0; k < 6; k++) {
            frames.add(EquipFrameData(
              r.readShort(), r.readShort(), r.readByte(), r.readByte(),
              r.readByte(), r.readByte(),
            ));
          }
          final ability = <int>[for (var b = 0; b < 10; b++) r.readByte()];
          DataCache.equips.add(EquipEntry(
            id: id, type: type, glass: glassId, bullet: bullet,
            icon: icon, level: level, frames: frames,
            invAbility: [ability[0], ability[2], ability[4], ability[6], ability[8]],
            invPercen: [ability[1], ability[3], ability[5], ability[7], ability[9]],
          ));
        }
      }
    }
    // iconImg + bullets: duoc tach boi caller (can decode PNG qua FilePack path khac)
  }

  /// readMess(data, 2): level captions
  static void parseLevelCaptions(Uint8List data) {
    final r = ByteReader(data);
    final n = r.readByte();
    DataCache.levelCaptions = [];
    DataCache.levelCaptionTypes = [];
    for (var i = 0; i < n; i++) {
      DataCache.levelCaptions.add(r.readUTF());
      DataCache.levelCaptionTypes.add(r.readUnsignedByte());
    }
  }
}