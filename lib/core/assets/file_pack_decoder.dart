import 'dart:typed_data';
import 'dart:ui' as ui;
import 'package:logging/logging.dart';

/// Port chính xác `model/FilePack.java` của bản gốc LibGDX.
///
/// Các file res/gui/gui, res/item/item, res/effect/effect, res/map/bg
/// (và res/item/delete) đều là FilePack: archive gồm nhiều PNG nhỏ đặt cạnh
/// nhau, header lưu tên file, mọi thứ XOR với key chuỗi "NguyenVanMinh".
abstract final class FilePackDecoder {
  static final _logger = Logger('FilePackDecoder');

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
    if (data.isEmpty) {
      _logger.warning('Attempted to decode empty FilePack data');
      throw ArgumentError('FilePack: data is empty');
    }

    var pos = 0;
    int u8() {
      if (pos >= data.length) throw RangeError('FilePack: unexpected EOF reading U8 at $pos');
      return data[pos++];
    }
    int u16() {
      if (pos + 1 >= data.length) throw RangeError('FilePack: unexpected EOF reading U16 at $pos');
      final v = (data[pos] << 8) | data[pos + 1];
      pos += 2;
      return v;
    }

    try {
      final nFile = u8();
      final names = <String>[];
      final lens = <int>[];

      for (var i = 0; i < nFile; i++) {
        final lname = u8();
        if (pos + lname > data.length) {
          throw RangeError('FilePack: unexpected EOF reading filename of length $lname at $pos');
        }

        final nameBytes = _unxor(data.sublist(pos, pos + lname));
        pos += lname;
        names.add(String.fromCharCodes(nameBytes));

        lens.add(u16());
      }

      final fullData = _unxor(data.sublist(pos));
      final files = <String, Uint8List>{};
      var off = 0;

      for (var i = 0; i < nFile; i++) {
        if (off + lens[i] > fullData.length) {
          _logger.severe('FilePack data truncated for file "${names[i]}"');
          throw StateError('FilePack: truncated data for "${names[i]}"');
        }

        // Java's Hashtable.put policy: if duplicate key exists, it overwrites.
        // This is implicit in Dart Map's operator [].
        files[names[i]] = Uint8List.fromList(fullData.sublist(off, off + lens[i]));
        off += lens[i];
      }

      _logger.fine('Decoded FilePack with $nFile files');
      return FilePack(files);
    } catch (e, stack) {
      _logger.severe('Failed to decode FilePack', e, stack);
      rethrow;
    }
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