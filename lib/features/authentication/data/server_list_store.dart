import 'dart:convert';
import 'dart:typed_data';

import 'package:http/http.dart' as http;

import 'package:mobiarmy_flutter/core/assets/legacy_rms.dart';

/// Port GameMidlet.loadIP/saveIP + doUpdateServer (TerrainMidlet):
/// Record "ipArmy2": [byte n] + lap n lan [UTF name][UTF ip][short port].
/// Neu khong co record -> HTTP GET linkGetHost, parse CSV "name,ip,port".
class GameServerEntry {
  GameServerEntry(this.name, this.ip, this.port);
  final String name;
  final String ip;
  final int port;
}

abstract final class ServerListStore {
  /// GameMidlet.linkGetHost (TerrainMidlet dung gmb.teamobi.com).
  static const linkGetHost = 'https://sv.pro.vn/server.txt';

  static Future<List<GameServerEntry>> load() async {
    final cached = await LegacyRms.load('ipArmy2');
    if (cached != null && cached.isNotEmpty) {
      final list = _decode(cached);
      if (list.isNotEmpty) return list;
    }
    return updateFromNetwork();
  }

  static Future<List<GameServerEntry>> updateFromNetwork() async {
    final res = await http.get(Uri.parse(linkGetHost));
    final text = utf8.decode(res.bodyBytes);
    final list = <GameServerEntry>[];
    for (final raw in text.split(',')) {
      final parts = raw.trim().split(':');
      if (parts.length >= 3) {
        list.add(GameServerEntry(parts[0], parts[1], int.parse(parts[2].trim())));
      }
    }
    await save(list);
    return list;
  }

  static Future<void> save(List<GameServerEntry> servers) async {
    final out = BytesBuilder();
    out.addByte(servers.length);
    for (final s in servers) {
      _writeUtf(out, s.name);
      _writeUtf(out, s.ip);
      out.addByte((s.port >> 8) & 0xFF);
      out.addByte(s.port & 0xFF);
    }
    await LegacyRms.save('ipArmy2', out.toBytes());
  }

  static List<GameServerEntry> _decode(Uint8List data) {
    var pos = 0;
    int u8() => data[pos++];
    int u16() { final v = (data[pos] << 8) | data[pos + 1]; pos += 2; return v; }
    String utf() {
      final len = u16();
      final s = utf8.decode(data.sublist(pos, pos + len));
      pos += len;
      return s;
    }
    final n = u8();
    final list = <GameServerEntry>[];
    for (var i = 0; i < n; i++) {
      list.add(GameServerEntry(utf(), utf(), u16()));
    }
    return list;
  }

  static void _writeUtf(BytesBuilder out, String s) {
    final b = utf8.encode(s);
    out.addByte((b.length >> 8) & 0xFF);
    out.addByte(b.length & 0xFF);
    out.add(b);
  }
}