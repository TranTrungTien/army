import 'dart:ui' as ui;
import 'package:flutter/services.dart' show rootBundle;
import 'bmfont.dart';
import 'file_pack_decoder.dart';

/// Trung tam load asset goc MobiArmy2.
/// NOTE: asset cua project dat THANG o assets/ (assets/gui/gui, assets/effect/...)
/// chung toi khong cong 'res/' vao prefix.
class GameAssets {
  GameAssets._();

  static const kPrefix = 'assets/';
  static FilePack? gui, item, effect, mapBg;
  static final Map<String, ui.Image> looseImages = {};
  static BmFont? fontBig, fontMini;
  static bool _loaded = false;
  static bool get isLoaded => _loaded;

  static Future<FilePack?> _tryPack(String path) async {
    try {
      final bytes = await rootBundle.load('$kPrefix$path');
      return FilePackDecoder.decode(bytes.buffer.asUint8List());
    } catch (_) {
      return null;
    }
  }

  static Future<void> load() async {
    if (_loaded) return;
    gui = await _tryPack('gui/gui');
    item = await _tryPack('item/item');
    effect = await _tryPack('effect/effect');
    mapBg = await _tryPack('map/bg');

    const looseNames = [
      'coin', 'cup', 'kim', 'wind', 'wind2', 'mua', 'tuyet', 'icon',
      'iconChat', 'iconcam', 'iconmenu', 'remember', 'lever-up', 'er',
      'tick0', 'tick1', 'v', 'x', 'vong', 'vong_tron', 'arrow', 'randomMap',
      'map/tab_1', 'map/tab_2', 'map/tab_3', 'map/tab_4', 'map/tab_5',
    ];
    for (final n in looseNames) {
      try {
        final bd = await rootBundle.load('$kPrefix$n.png');
        final codec = await ui.instantiateImageCodec(bd.buffer.asUint8List());
        looseImages[n] = (await codec.getNextFrame()).image;
      } catch (_) {}
    }

    // Font: thu FontSys roi x1/font. KHONG throw neu thieu — dung null font.
    fontBig = await _tryFont('FontSys/x1/big');
    fontBig ??= await _tryFont('x1/font/big');
    fontMini = await _tryFont('FontSys/x1/mini');
    fontMini ??= await _tryFont('x1/font/mini') ?? fontBig;

    _loaded = true;
  }

  static Future<BmFont?> _tryFont(String base) async {
    try {
      return await BmFont.load(
        kPrefix + base + '.fnt',
        (path) async {
          final bd = await rootBundle.load(path);
          final codec = await ui.instantiateImageCodec(bd.buffer.asUint8List());
          return (await codec.getNextFrame()).image;
        },
        (path) => rootBundle.loadString(path),
      );
    } catch (_) {
      return null;
    }
  }

  static ui.Image? loose(String name) => looseImages[name];
}