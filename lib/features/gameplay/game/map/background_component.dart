import 'dart:ui';
import 'package:flame/components.dart';
import 'package:mobiarmy_flutter/features/gameplay/game/map/game_map_definition.dart';
class BackgroundComponent extends PositionComponent { BackgroundComponent({required this.environment,required Vector2 mapSize}):super(size:mapSize,priority:-100); final MapEnvironmentDefinition environment;
 @override void render(Canvas canvas){canvas.drawRect(Rect.fromLTWH(0,0,size.x,size.y),Paint()..color=const Color(0xff0f2742));if(environment.hasWaterOrGlass){canvas.drawRect(Rect.fromLTWH(0,environment.waterY.toDouble(),size.x,(size.y-environment.waterY).clamp(0.0,size.y).toDouble()),Paint()..color=const Color(0x6638bdf8));}} }
