import 'dart:ui';
import 'package:flame/components.dart';
import 'package:flame/sprite.dart';
import 'package:mobiarmy_flutter/core/assets/asset_manifest.dart';

class SpriteAtlasRepository {
  SpriteAtlasRepository(this.manifest);
  final GameAssetManifest manifest;
  final Map<String,Image> _images={};
  Sprite frame(String atlasId,String frameName) {
    final atlas=manifest.atlases[atlasId]; if(atlas==null) throw StateError('Unknown atlas: $atlasId');
    final image=_images[atlasId]; if(image==null) throw StateError('Atlas not loaded: $atlasId');
    AtlasFrame? frame; for(final candidate in atlas.frames){if(candidate.name==frameName){frame=candidate;break;}}
    if(frame==null) throw StateError('Unknown frame: $atlasId/$frameName');
    return Sprite(image,srcPosition:Vector2(frame.x.toDouble(),frame.y.toDouble()),srcSize:Vector2(frame.width.toDouble(),frame.height.toDouble()));
  }
  void registerImage(String atlasId,Image image)=>_images[atlasId]=image;
  void unload(String atlasId)=>_images.remove(atlasId)?.dispose();
  void dispose(){for(final image in _images.values){image.dispose();}_images.clear();}
}
