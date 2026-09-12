import 'package:mobiarmy_flutter/features/authentication/domain/game_server.dart';

abstract final class ServerCatalog {
  static const servers = <GameServer>[
    GameServer(name: 'Localhost', host: '127.0.0.1', port: 1919),
  ];
}
