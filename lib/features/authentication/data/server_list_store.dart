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
  static const kLegacyServerName = 'Mặt Trời';
  static const kLegacyServerIp = '27.0.12.164';
  static const kLegacyServerPort = 19149;

  static Future<List<GameServerEntry>> load() async {
    final cached = await LegacyRms.load('ipArmy2');
    if (cached != null && cached.isNotEmpty) {
      try {
        final list = _decode(cached);
        if (list.isNotEmpty) return list;
      } catch (e) {
        // Silently fail and fallback to network
      }
    }
    return updateFromNetwork();
  }

  static Future<List<GameServerEntry>> updateFromNetwork() async {
    try {
      final res = await http.get(Uri.parse(linkGetHost)).timeout(const Duration(seconds: 10));
      final text = utf8.decode(res.bodyBytes);
      final list = <GameServerEntry>[];
      for (final raw in text.split(',')) {
        final parts = raw.trim().split(':');
        if (parts.length >= 3) {
          list.add(GameServerEntry(parts[0], parts[1], int.parse(parts[2].trim())));
        }
      }

      // Port parity: add legacy server if list is short or based on version
      if (!list.any((s) => s.ip == kLegacyServerIp)) {
        list.add(GameServerEntry(kLegacyServerName, kLegacyServerIp, kLegacyServerPort));
      }

      await save(list);
      return list;
    } catch (e) {
      // Return hardcoded localhost if network fails and no cache
      return [GameServerEntry('Localhost', '127.0.0.1', 1919)];
    }
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
    int u8() {
      if (pos >= data.length) throw RangeError('LOBBY_RMS_EOF');
      return data[pos++];
    }
    int u16() {
      if (pos + 1 >= data.length) throw RangeError('LOBBY_RMS_EOF');
      final v = (data[pos] << 8) | data[pos + 1];
      pos += 2;
      return v;
    }
    String utf() {
      final len = u16();
      if (pos + len > data.length) throw RangeError('LOBBY_RMS_EOF');
      final s = utf8.decode(data.sublist(pos, pos + len));
      pos += len;
      return s;
    }
    final n = u8();
    final list = <GameServerEntry>[];
    for (var i = 0; i < n; i++) {
      final name = utf();
      final ip = utf();
      final port = u16();
      list.add(GameServerEntry(name, ip, port));
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