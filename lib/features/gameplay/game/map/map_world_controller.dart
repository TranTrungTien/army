import 'package:flame/components.dart';
import 'package:mobiarmy_flutter/features/gameplay/game/map/background_component.dart';
import 'package:mobiarmy_flutter/features/gameplay/game/map/game_map_definition.dart';
import 'package:mobiarmy_flutter/features/gameplay/game/map/map_component.dart';
import 'package:mobiarmy_flutter/features/gameplay/game/map/map_debug_overlay.dart';
class MapWorldController { MapWorldController(this.world); final World world; Component? _current;
 Future<void> show(GameMapDefinition map,{bool debug=false}) async {if(_current!=null){_current!.removeFromParent();await _current!.removed;}final root=PositionComponent();await root.add(BackgroundComponent(environment:map.environment,mapSize:Vector2(map.width.toDouble(),map.height.toDouble())));await root.add(MapComponent(definition:map,tileSize:Vector2.all(16),debug:debug));if(debug)await root.add(MapDebugOverlay(definition:map));await world.add(root);_current=root;}
 Future<void> clear() async {final current=_current;if(current==null)return;current.removeFromParent();await current.removed;_current=null;} }
