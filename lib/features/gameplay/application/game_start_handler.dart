import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logging/logging.dart';
import 'package:mobiarmy_flutter/core/network/command/commands.dart';
import 'package:mobiarmy_flutter/core/network/network_provider.dart';
import 'package:mobiarmy_flutter/core/network/protocol/message.dart';

/// Port MessageHandler case 20 (startGame):
///   trainingMode=false: mapID(byte), time(byte), team(unsignedShort),
///   playerLent(=8, hoac byte neu currLevel==7),
///   lap: playerX[i](short) != -1 -> playerY[i](short), maxHP[i](short)
/// -> GameScr.initGame(mapID, time, playerX, playerY, maxHP, team)
class GameSessionStart {
  GameSessionStart({
    required this.mapId, required this.time, required this.team,
    required this.playerX, required this.playerY, required this.maxHp,
  });
  final int mapId, time, team;
  final List<int> playerX, playerY, maxHp;
}

class GameStartNotifier extends Notifier<GameSessionStart?> {
  final _logger = Logger('GameStart');

  @override
  GameSessionStart? build() {
    final d = ref.watch(messageDispatcherProvider);
    d.register(Commands.startGame, _onStart);
    d.register(Commands.setWind, _onWind);
    d.register(Commands.setTurn, _onTurn);
    return null;
  }

  void _onStart(Message msg) {
    final r = msg.reader();
    // trainingMode = false trong luong online thong thuong
    final mapId = r.readByte();
    final time = r.readByte();
    final team = r.readUnsignedShort();
    final playerLent = 8; // TODO: PrepareScr.currLevel == 7 thi doc byte
    final playerX = <int>[], playerY = <int>[], maxHp = <int>[];
    for (var i = 0; i < playerLent; i++) {
      final x = r.readShort();
      playerX.add(x);
      if (x != -1) {
        playerY.add(r.readShort());
        maxHp.add(r.readShort());
      } else {
        playerY.add(-1);
        maxHp.add(0);
      }
    }
    state = GameSessionStart(
      mapId: mapId, time: time, team: team,
      playerX: playerX, playerY: playerY, maxHp: maxHp,
    );
    // TODO: dieu huong sang GameplayPage + khoi tao ArmyGame tu GameSessionStart
    // (map tu DataCache.mapFiles[mapId], spawn theo playerX/playerY).
  }

  void _onWind(Message msg) {
    final r = msg.reader();
    final windX = r.readShort();
    final windY = r.readShort();
    _logger.info('Wind: ($windX, $windY)');
    // TODO: GameScr.windx = windX — cap nhat HUD gio + physics luc ban.
  }

  void _onTurn(Message msg) {
    final whoNext = msg.reader().readByte();
    _logger.info('Next turn: $whoNext');
    // TODO: cap nhat luot ban tren HUD.
  }
}

final gameStartProvider =
    NotifierProvider<GameStartNotifier, GameSessionStart?>(GameStartNotifier.new);