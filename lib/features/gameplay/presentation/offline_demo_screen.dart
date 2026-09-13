import 'dart:typed_data';

import 'package:flame/components.dart';
import 'package:mobiarmy_flutter/features/gameplay/game/army_game.dart';
import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:mobiarmy_flutter/core/network/data_cache_parsers.dart';
import 'package:mobiarmy_flutter/features/gameplay/game/map/game_map_definition.dart';
import 'package:mobiarmy_flutter/features/gameplay/game/map/map_binary_parser.dart';
import 'package:mobiarmy_flutter/features/gameplay/game/map/terrain_component.dart';
import 'package:mobiarmy_flutter/features/gameplay/game/player/online_character.dart';
import 'package:mobiarmy_flutter/features/gameplay/game/player/player_sprites.dart';
import 'package:mobiarmy_flutter/features/gameplay/game/systems/ground_probe.dart';

/// MAN DEMO OFFLINE = dung asset THAT, khong can server, chay duoc tren web.
///
/// Can: copy cac file seed tu repo goc desktop/assets/rms/ vao assets/rms/:
///   valuesdata2, equipdata2, playerdata2, levelCData2
/// (cac file nay la cache tu server — du de render map nhi phan + nhan vat
/// that voi body + trang bi).
class OfflineDemoScreen extends StatefulWidget {
  const OfflineDemoScreen({super.key});
  @override
  State<OfflineDemoScreen> createState() => _OfflineDemoScreenState();
}

class _OfflineDemoScreenState extends State<OfflineDemoScreen> {
  ArmyGame? _game;
  String _status = 'Dang nap du lieu seed...';

  @override
  void initState() {
    super.initState();
    _start();
  }

  Future<Uint8List?> _seed(String name) async {
    try {
      final bd = await rootBundle.load('assets/rms/' + name);
      return bd.buffer.asUint8List();
    } catch (_) {
      return null;
    }
  }

  Future<void> _start() async {
    // 1. Parse du lieu seed (giong sendMapData doc RMS local)
    final values = await _seed('valuesdata2');
    final equips = await _seed('equipdata2');
    final players = await _seed('playerdata2');
    if (values == null || equips == null || players == null) {
      setState(() => _status =
          'Thieu seed! Copy desktop/assets/rms/{valuesdata2,equipdata2,playerdata2,levelCData2} vao assets/rms/');
      return;
    }
    DataCacheParsers.parseMapList(values);
    DataCacheParsers.parseEquipTree(equips);
    await PlayerSprites.init(players);

    // 2. Map 0 nhi phan THAT
    final entry = DataCache.mapFiles[0];
    final bin = MapBinaryParser.parse(entry.data);
    final bricks = [
      for (final b in bin.bricks)
        MapBrickDefinition(tileId: b.tileId, x: b.x, y: b.y, destructible: true),
    ];
    final map = GameMapDefinition(
      id: 0, width: bin.width, height: bin.height,
      layers: [MapLayerDefinition(id: 'terrain', bricks: bricks)],
      spawnPoints: const [],
      environment: MapEnvironmentDefinition(
        backgroundId: entry.values[0], backgroundY: entry.values[1],
        cloudY: entry.values[2], waterY: bin.height, waterClass: -1,
      ),
    );
    final terrain = TerrainMaskBuilder.build(map, tileSize: 20);
    final probe = GroundProbe(terrain);

    // 3. Game + camera
    final game = ArmyGame();
    await game.onLoad();
    game.map = map;
    game.terrain = terrain;
    game.camera.viewfinder.position = Vector2(bin.width / 2, bin.height / 2);
    await game.gameWorld.add(TerrainComponent(terrain: terrain));

    // 4. Hai nhan vat THAT: glass 0 (Gunner) + glass 1 (Miss 6),
    //    trang bi mac dinh id 3,4,5,11 va 20,21,24 (khop SandboxEquipmentData).
    Future<OnlineCharacter> spawn(
      int glass, List<int> equipIds, double x, Color c,
    ) async {
      final ch = OnlineCharacter(
        glassId: glass, equipIds: equipIds, name: 'Demo', maxHp: 1000,
      );
      await ch.load();
      final gy = probe.findGroundBelow(x, 0) ?? 400;
      ch.moveTo(x, gy);
      return ch;
    }

    final a = await spawn(0, const [5, 3, 4, 11, 0], 150, Colors.orange);
    final b = await spawn(1, const [24, 20, 21, 0, 0], 620, Colors.cyan);
    await game.gameWorld.add(a);
    await game.gameWorld.add(b);
    game.players[0] = a;
    game.players[1] = b;

    setState(() {
      _game = game;
      _status = 'OK — map ' +
          bin.width.toString() + 'x' + bin.height.toString() +
          ', ' + bricks.length.toString() + ' bricks, ' +
          DataCache.equips.length.toString() + ' equips';
    });
  }

  @override
  Widget build(BuildContext context) {
    final game = _game;
    return Scaffold(
      body: Stack(children: [
        if (game != null)
          Positioned.fill(child: GameWidget(game: game))
        else
          Center(child: Text(_status)),
        Positioned(
          top: 12, left: 12,
          child: Container(
            color: Colors.black54,
            padding: const EdgeInsets.all(8),
            child: Text(_status, style: const TextStyle(color: Colors.white)),
          ),
        ),
      ]),
    );
  }
}