import 'package:flutter_test/flutter_test.dart';
import 'package:mobiarmy_flutter/core/assets/asset_manifest.dart';
import 'package:mobiarmy_flutter/core/assets/asset_scope.dart';
void main(){
 const valid='{"schemaVersion":1,"assets":[{"id":"map_1","kind":"map","path":"assets/maps/1.json","available":true}],"atlases":[{"id":"a","imagePath":"assets/sprites/a.png","width":16,"height":16,"frames":[{"name":"idle","x":0,"y":0,"width":8,"height":8}]}]}';
 test('manifest parses',(){final m=GameAssetManifest.fromJsonString(valid);expect(m.assets['map_1']!.path,'assets/maps/1.json');expect(m.atlases['a']!.frames.single.name,'idle');});
 test('duplicate asset fails',(){expect(()=>GameAssetManifest.fromJsonString('{"schemaVersion":1,"assets":[{"id":"x","kind":"image","path":"a","available":true},{"id":"x","kind":"image","path":"b","available":true}],"atlases":[]}'),throwsFormatException);});
 test('atlas bounds fail',(){expect(()=>GameAssetManifest.fromJsonString('{"schemaVersion":1,"assets":[],"atlases":[{"id":"a","imagePath":"a.png","width":8,"height":8,"frames":[{"name":"x","x":7,"y":0,"width":2,"height":2}]}]}'),throwsFormatException);});
 test('scope reference counting and dispose',(){var disposed=0;final s=AssetScope(name:'match');s.retain('x',()=>disposed++);s.retain('x',()=>disposed++);s.release('x');expect(disposed,0);s.release('x');expect(disposed,1);s.dispose();s.dispose();expect(disposed,1);});
}
