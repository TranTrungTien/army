import 'dart:typed_data';
import 'dart:ui' as ui;

/// Port chính xác `model/FilePack.java` của bản gốc LibGDX.
///
/// Các file res/gui/gui, res/item/item, res/effect/effect, res/map/bg
/// (và res/item/delete) đều là FilePack: archive gồm nhiều PNG nhỏ đặt cạnh
/// nhau, header lưu tên file, mọi thứ XOR với key chuỗi "NguyenVanMinh".
///
/// Định dạng (theo đúng FilePack.java):
///   [1 byte]  nFile                    -> RAW (encode(int) la identity)
///   lap nFile lan:
///     [1 byte]  lname                  -> RAW
///     [lname]   filename               -> XOR key
///     [2 bytes] flen (big-endian)      -> RAW
///   [con lai] fullData                 -> XOR key (tu dau key)
///
/// Cach dung dung nhu Explosion.java / Smoke.java:
///   final pack = FilePack.decode(await rootBundle.load('assets/res/effect/effect').then(...));
///   final img = await pack.loadImage('ex3.png');
abstract final class FilePackDecoder {
  static const List<int> _key = <int>[
    78, 103, 117, 121, 101, 110, 86, 97, 110, 77, 105, 110, 104, // "NguyenVanMinh"
  ];

  static Uint8List _unxor(Uint8List data) {
    final out = Uint8List(data.length);
    for (var i = 0; i < data.length; i++) {
      out[i] = data[i] ^ _key[i % _key.length];
    }
    return out;
  }

  static FilePack decode(Uint8List data) {
    var pos = 0;
    int u8() => data[pos++];
    int u16() {
      final v = (data[pos] << 8) | data[pos + 1];
      pos += 2;
      return v;
    }

    final nFile = u8(); // RAW
    final names = <String>[];
    final lens = <int>[];
    for (var i = 0; i < nFile; i++) {
      final lname = u8(); // RAW
      final nameBytes = _unxor(data.sublist(pos, pos + lname)); // XOR
      pos += lname;
      names.add(String.fromCharCodes(nameBytes));
      lens.add(u16()); // RAW
    }
    final fullData = _unxor(data.sublist(pos));
    final files = <String, Uint8List>{};
    var off = 0;
    for (var i = 0; i < nFile; i++) {
      files[names[i]] = Uint8List.fromList(fullData.sublist(off, off + lens[i]));
      off += lens[i];
    }
    return FilePack(files);
  }
}

class FilePack {
  FilePack(this.files);
  final Map<String, Uint8List> files;

  List<String> get names => files.keys.toList(growable: false);

  /// mImage.createImage(byte[], offset, len) -> Texture -> ui.Image
  Future<ui.Image> loadImage(String name) async {
    final png = files[name];
    if (png == null) throw StateError('FilePack: khong co file "$name"');
    final codec = await ui.instantiateImageCodec(png);
    return (await codec.getNextFrame()).image;
  }
}