import 'dart:typed_data';
import 'dart:ui' as ui;
import 'package:mobiarmy_flutter/core/assets/file_pack_decoder.dart';

/// Port PrepareScr.init — icondata2 (sync cmd 90 type 1) LA FilePack chua:
///   "<mapFileName>.png" cho tung map (theo MM.mapFileName tu valuesdata2)
///   + "khungmap.png" (khung vien map trong UI chon map).
class MapIconPack {
  MapIconPack._(this.pack);
  final FilePack pack;
  static MapIconPack? instance;

  static Future<void> init(List<int> iconData2) async {
    instance = MapIconPack._(FilePackDecoder.decode(Uint8List.fromList(iconData2)));
  }

  Future<ui.Image?> mapPreview(String mapFileName) async {
    try {
      return await pack.loadImage('$mapFileName.png');
    } catch (_) {
      return null;
    }
  }

  Future<ui.Image?> khungMap() async {
    try {
      return await pack.loadImage('khungmap.png');
    } catch (_) {
      return null;
    }
  }
}