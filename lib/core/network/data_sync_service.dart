import 'dart:async';
import 'dart:typed_data';
import 'package:logging/logging.dart';
import 'package:mobiarmy_flutter/core/assets/legacy_rms.dart';
import 'package:mobiarmy_flutter/core/network/command/commands.dart';
import 'package:mobiarmy_flutter/core/network/dispatcher/message_dispatcher.dart';
import 'package:mobiarmy_flutter/core/network/protocol/message.dart';
import 'package:mobiarmy_flutter/core/network/transport/tcp_session.dart';
import 'package:mobiarmy_flutter/features/gameplay/game/map/icon_preview.dart';
import 'package:mobiarmy_flutter/features/gameplay/game/player/player_sprites.dart';
import 'data_cache_parsers.dart';

/// Port CCanvas.sendMapData + MessageHandler case 90 (dynamicSync).
class DataSyncService {
  DataSyncService(this._session, this._dispatcher) {
    _dispatcher.register(Commands.dynamicSync, _onDynamicSync);
  }

  final TcpSession _session;
  final MessageDispatcher _dispatcher;
  final _logger = Logger('DataSyncService');
  final _completer = Completer<void>();
  final int _tileMapVersion = 0;
  int _iconVersion = 0, _valuesVersion = 0,
      _playerVersion = 0, _equipVersion = 0, _levelCVersion = 0;

  Future<void> get done => _completer.future;

  Future<void> start() async {
    _iconVersion = await _safeInt('iconversion2');
    _valuesVersion = await _safeInt('valuesversion2');
    _playerVersion = await _safeInt('playerVersion2');
    _equipVersion = await _safeInt('equipVersion2');
    _levelCVersion = await _safeInt('levelCVersion2');

    final valuesCached = await _safeLoad('valuesdata2');
    if (valuesCached != null) DataCacheParsers.parseMapList(valuesCached);
    final equipCached = await _safeLoad('equipdata2');
    if (equipCached != null) DataCacheParsers.parseEquipTree(equipCached);
    final levelCached = await _safeLoad('levelCData2');
    if (levelCached != null) DataCacheParsers.parseLevelCaptions(levelCached);
    final playerCached = await _safeLoad('playerdata2');
    if (playerCached != null) await PlayerSprites.init(playerCached);
    final iconCached = await _safeLoad('icondata2');
    if (iconCached != null) await MapIconPack.init(iconCached);

    await _sendVersion(2, _valuesVersion);
  }

  // path_provider khong chay tren web — fallback rong.
  static Future<int> _safeInt(String f) async {
    try {
      final v = await LegacyRms.loadInt(f);
      return v < 0 ? 0 : v;
    } catch (_) {
      return 0;
    }
  }

  static Future<Uint8List?> _safeLoad(String f) async {
    try {
      return await LegacyRms.load(f);
    } catch (_) {
      return null;
    }
  }

  static Future<void> _safeSave(String f, List<int> d) async {
    try {
      await LegacyRms.save(f, d);
    } catch (_) {}
  }

  static Future<void> _safeSaveInt(String f, int v) async {
    try {
      await LegacyRms.saveRmsInt(f, v);
    } catch (_) {}
  }

  void _onDynamicSync(Message msg) {
    final r = msg.reader();
    final type = r.readByte();
    switch (type) {
      case 2:
        final v = r.readByte();
        if (v != _valuesVersion) {
          final data = r.readBytes(r.readUnsignedShort());
          DataCacheParsers.parseMapList(data);
          _safeSave('valuesdata2', data);
          _safeSaveInt('valuesversion2', v);
          _valuesVersion = v;
        }
        _sendVersion(1, _tileMapVersion);
        break;
      case 1:
        final v = r.readByte();
        if (v != _iconVersion) {
          final data = r.readBytes(r.readUnsignedShort());
          MapIconPack.init(data); // icondata2 = FilePack (anh preview map)
          _safeSave('icondata2', data);
          _safeSaveInt('iconversion2', v);
          _iconVersion = v;
        }
        _sendVersion(3, _iconVersion);
        break;
      case 3:
        final v = r.readByte();
        if (v != _playerVersion) {
          final data = r.readBytes(r.readUnsignedShort());
          PlayerSprites.init(data); // playerdata2 = FilePack (body sprite)
          _safeSave('playerdata2', data);
          _safeSaveInt('playerVersion2', v);
          _playerVersion = v;
        }
        _sendVersion(4, _equipVersion);
        break;
      case 4:
        final v = r.readByte();
        if (v != _equipVersion) {
          final data = r.readBytes(r.readInt());
          DataCacheParsers.parseEquipTree(data);
          _safeSave('equipdata2', data);
          _safeSaveInt('equipVersion2', v);
          _equipVersion = v;
        }
        _sendVersion(5, _levelCVersion);
        break;
      case 5:
        final v = r.readByte();
        if (v != _levelCVersion) {
          final data = r.readBytes(r.readUnsignedShort());
          DataCacheParsers.parseLevelCaptions(data);
          _safeSave('levelCData2', data);
          _safeSaveInt('levelCVersion2', v);
          _levelCVersion = v;
        }
        _logger.info('Data sync HOAN TAT');
        if (!_completer.isCompleted) _completer.complete();
        break;
    }
  }

  Future<void> _sendVersion(int type, int version) {
    final m = Message(Commands.dynamicSync);
    m.writer().writeByte(type);
    m.writer().writeByte(version);
    return _session.sendMessage(m);
  }
}