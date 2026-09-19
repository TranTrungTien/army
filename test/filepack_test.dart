import 'dart:io';
import 'package:flutter_test/flutter_test.dart';
import 'package:mobiarmy_flutter/core/assets/file_pack_decoder.dart';

void main() {
  test('FilePack decode assets/effect/effect', () {
    final file = File('assets/effect/effect');
    final bytes = file.readAsBytesSync();

    final pack = FilePackDecoder.decode(bytes);

    // Danh sach file phai co theo Explosion.java + Smoke.java
    const expected = [
      'ex3.png', 'teleport_eff.png', 'waterBum.png', 'Eff.png',
      'tangHinhEffect.png', 'mua.png', 'bomnguyentu.png', 'electric.png',
      'electric2.png', 'freeze.png', 'dongbang.png', 'khoidoc.png',
      'thuocno.png', 'smoke.png', 'smoke2.png', 'longga.png',
      'blacksmoke.png', 'blueSmoke.png', 'chuotbay.png', 'gatruilong.png',
      'water.png', 'locxoay.png', 'lacay.png', 'blueSmoke2.png',
      'lacay2.png', 'khoi.png', 'smokeFire.png', 'lua.png',
    ];

    for (final e in expected) {
      expect(pack.files.containsKey(e), true, reason: 'Thieu $e');
      final d = pack.files[e]!;
      expect(d[0], 0x89, reason: '$e khong phai PNG');
    }
  });

  test('FilePack handles malformed data', () {
    expect(() => FilePackDecoder.decode(Uint8List(0)), throwsArgumentError);
    expect(() => FilePackDecoder.decode(Uint8List.fromList([1, 1])), throwsRangeError);
  });
}