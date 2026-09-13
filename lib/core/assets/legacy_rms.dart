import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/services.dart' show rootBundle;
import 'package:path_provider/path_provider.dart';

/// Port CLib/RMS + CRes.loadRMSData/saveRMSInt:
///   moi record = 1 file nguyen trang trong thu muc rms/.
///   saveRmsInt viet 1 byte; loadInt doc SBYTE, thieu = -1.
///   saveString/loadString: UTF-8 (caroun, caropass, ...).
/// Record quan trong cua game goc (giu NGUYEN ten):
///   bigImage0..9  - cache anh nen lon tai tu server
///   equipdata2/icondata2/levelCData2/playerdata2/valuesdata2 + *version2
///   ipArmy2       - danh sach server (byte n + [UTF][UTF][short]*n)
///   caroun/caropass - tai khoan "nho dang nhap"
///   sound         - INT 0..100 volume; vibrate - sbyte 0/1
abstract final class LegacyRms {
  static Directory? _root;

  static Future<Directory> _dir() async {
    if (_root != null) return _root!;
    final docs = await getApplicationDocumentsDirectory();
    final d = Directory('${docs.path}/rms');
    if (!d.existsSync()) d.createSync(recursive: true);
    return _root = d;
  }

  static Future<void> seedFromBundle(List<String> files) async {
    final root = await _dir();
    for (final name in files) {
      final target = File('${root.path}/$name');
      if (target.existsSync()) continue;
      try {
        final data = await rootBundle.load('assets/rms/$name');
        target.writeAsBytesSync(data.buffer.asUint8List());
      } catch (_) {}
    }
  }

  static Future<Uint8List?> load(String filename) async {
    final f = File('${(await _dir()).path}/$filename');
    return f.existsSync() ? f.readAsBytesSync() : null;
  }

  static Future<int> loadInt(String filename) async {
    final b = await load(filename);
    if (b == null || b.isEmpty) return -1;
    return b[0] > 127 ? b[0] - 256 : b[0];
  }

  static Future<void> save(String filename, List<int> data) async =>
      File('${(await _dir()).path}/$filename').writeAsBytes(data);

  static Future<void> saveRmsInt(String filename, int x) =>
      save(filename, <int>[x & 0xFF]);

  static Future<String?> loadString(String filename) async {
    final b = await load(filename);
    return b == null ? null : utf8.decode(b);
  }

  static Future<void> saveString(String filename, String s) =>
      save(filename, utf8.encode(s));

  static Future<void> clear(String filename) async {
    final f = File('${(await _dir()).path}/$filename');
    if (f.existsSync()) f.deleteSync();
  }
}