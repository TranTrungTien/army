import 'dart:typed_data';

/// Port map/MM.loadMapFile — format nhi phan THAT cua fData (trong
/// valuesdata2, doc qua DataCache.mapFiles[i].data):
///   [2 bytes] mapWidth  (BE short)
///   [2 bytes] mapHeight (BE short)
///   [1 byte]  nLand
///   lap nLand:
///     [1 byte]  tileID
///     [2 bytes] x (BE short)
///     [2 bytes] y (BE short)
///
/// KHONG con can map JSON — day la du lieu map chuan tu server.
/// Luu y quan trong (khac voi sandbox hien tai):
///   - Va cham la PIXEL-ALPHA cua anh tile (MM.getImage(tileID) + hole mask),
///     KHONG phai hinh chu nhat brick. DestructibleTerrain dang dung mask
///     la approximation — can nang cap sau bang cach rasterize anh tile.
///   - Anh tile duoc nap rieng: tiledata2 (RMS) hoac getMaterialIcon cmd 126.
class MapBrickRaw {
  MapBrickRaw(this.tileId, this.x, this.y);
  final int tileId, x, y;
}

class BinaryMapData {
  BinaryMapData(this.width, this.height, this.bricks);
  final int width, height;
  final List<MapBrickRaw> bricks;
}

abstract final class MapBinaryParser {
  static BinaryMapData parse(Uint8List data) {
    var pos = 0;
    int u8() => data[pos++];
    int s16() {
      final v = (data[pos] << 8) | data[pos + 1];
      pos += 2;
      return v >= 0x8000 ? v - 0x10000 : v;
    }

    final w = s16();
    final h = s16();
    final n = u8();
    final bricks = <MapBrickRaw>[];
    for (var i = 0; i < n; i++) {
      bricks.add(MapBrickRaw(u8(), s16(), s16()));
    }
    return BinaryMapData(w, h, bricks);
  }
}