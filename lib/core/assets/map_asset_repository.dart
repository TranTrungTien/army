import 'package:mobiarmy_flutter/core/assets/asset_manifest.dart';

class MapAssetRepository {
  MapAssetRepository(this.manifest);
  final GameAssetManifest manifest;
  GameAssetEntry definition(String id) {
    final entry = manifest.assets[id];
    if (entry == null || entry.kind != GameAssetKind.map)
      throw StateError('Unknown map asset: $id');
    return entry;
  }
}
