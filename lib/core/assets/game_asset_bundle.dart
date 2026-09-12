import 'package:flutter/services.dart';
import 'package:mobiarmy_flutter/core/assets/asset_manifest.dart';

class MissingGameAssetException implements Exception {
  const MissingGameAssetException(this.assetId);
  final String assetId;
  @override
  String toString() => 'MissingGameAssetException: $assetId';
}

class GameAssetBundle {
  GameAssetBundle(this.bundle);
  final AssetBundle bundle;
  Future<GameAssetManifest> loadManifest(String path) async =>
      GameAssetManifest.fromJsonString(await bundle.loadString(path));
  Future<ByteData> loadAvailable(GameAssetEntry entry) {
    if (!entry.available) throw MissingGameAssetException(entry.id);
    return bundle.load(entry.path);
  }
}
