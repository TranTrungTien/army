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

  void dispose() {
    _dispatcher.unregister(Commands.dynamicSync);
  }

  Future<void> start() async {
    _iconVersion = await _safeInt('iconversion2');
    _valuesVersion = await _safeInt('valuesversion2');
    _playerVersion = await _safeInt('playerVersion2');
    _equipVersion = await _safeInt('equipVersion2');
    _levelCVersion = await _safeInt('levelCVersion2');

    try {
      final valuesCached = await _safeLoad('valuesdata2');
      if (valuesCached != null) DataCacheParsers.parseMapList(valuesCached);
    } catch (e) {
      _logger.warning('Corrupted values cache. Wiping file.');
      await LegacyRms.clear('valuesdata2');
      await LegacyRms.clear('valuesversion2');
      _valuesVersion = 0;
    }

    try {
      final equipCached = await _safeLoad('equipdata2');
      if (equipCached != null) DataCacheParsers.parseEquipTree(equipCached);
    } catch (e) {
      _logger.warning('Corrupted equip cache. Wiping file.');
      await LegacyRms.clear('equipdata2');
      await LegacyRms.clear('equipversion2');
      _equipVersion = 0;
    }

    try {
      final levelCached = await _safeLoad('levelCData2');
      if (levelCached != null) DataCacheParsers.parseLevelCaptions(levelCached);
    } catch (e) {
      _logger.warning('Corrupted level cache. Wiping file.');
      await LegacyRms.clear('levelCData2');
      await LegacyRms.clear('levelCVersion2');
      _levelCVersion = 0;
    }

    try {
      final playerCached = await _safeLoad('playerdata2');
      if (playerCached != null) await PlayerSprites.init(playerCached);
    } catch (e) {
      _logger.warning('Corrupted player sprites cache. Wiping file.');
      await LegacyRms.clear('playerdata2');
      await LegacyRms.clear('playerVersion2');
      _playerVersion = 0;
    }

    try {
      final iconCached = await _safeLoad('icondata2');
      if (iconCached != null) {
        _logger.fine('Loading icons from cache');
        await MapIconPack.init(iconCached);
      }
    } catch (e) {
      _logger.warning('Corrupted icons cache: $e. Wiping file.');
      await LegacyRms.clear('icondata2');
      await LegacyRms.clear('iconversion2');
      _iconVersion = 0;
    }

    _logger.info('Starting sync chain with values version: $_valuesVersion');
    await _sendVersion(2, _valuesVersion);
  }

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
    _logger.fine('Received dynamic sync type: $type');
    try {
      switch (type) {
        case 2:
          final v = r.readByte();
          _logger.info('Sync values version: $v (current: $_valuesVersion)');
          if (v != _valuesVersion) {
            final len = r.readUnsignedShort();
            _logger.fine('Downloading new valuesdata2, length: $len');
            final data = r.readBytes(len);
            DataCacheParsers.parseMapList(data);
            _safeSave('valuesdata2', data);
            _safeSaveInt('valuesversion2', v);
            _valuesVersion = v;
          }
          _sendVersion(1, _tileMapVersion);
          break;
        case 1:
          final v = r.readByte();
          _logger.info('Sync icons version: $v (current: $_iconVersion)');
          if (v != _iconVersion) {
            final len = r.readUnsignedShort();
            _logger.fine('Downloading new icondata2, length: $len');
            final data = r.readBytes(len);
            MapIconPack.init(data);
            _safeSave('icondata2', data);
            _safeSaveInt('iconversion2', v);
            _iconVersion = v;
          }
          _sendVersion(3, _iconVersion);
          break;
        case 3:
          final v = r.readByte();
          _logger.info('Sync player version: $v (current: $_playerVersion)');
          if (v != _playerVersion) {
            final len = r.readUnsignedShort();
            _logger.fine('Downloading new playerdata2, length: $len');
            final data = r.readBytes(len);
            PlayerSprites.init(data);
            _safeSave('playerdata2', data);
            _safeSaveInt('playerVersion2', v);
            _playerVersion = v;
          }
          _sendVersion(4, _equipVersion);
          break;
        case 4:
          final v = r.readByte();
          _logger.info('Sync equip version: $v (current: $_equipVersion)');
          if (v != _equipVersion) {
            final len = r.readInt();
            _logger.fine('Downloading new equipdata2, length: $len');
            final data = r.readBytes(len);
            DataCacheParsers.parseEquipTree(data);
            _safeSave('equipdata2', data);
            _safeSaveInt('equipVersion2', v);
            _equipVersion = v;
          }
          _sendVersion(5, _levelCVersion);
          break;
        case 5:
          final v = r.readByte();
          _logger.info('Sync level captions version: $v (current: $_levelCVersion)');
          if (v != _levelCVersion) {
            final len = r.readUnsignedShort();
            _logger.fine('Downloading new levelCData2, length: $len');
            final data = r.readBytes(len);
            DataCacheParsers.parseLevelCaptions(data);
            _safeSave('levelCData2', data);
            _safeSaveInt('levelCVersion2', v);
            _levelCVersion = v;
          }
          _logger.info('All data sync chains completed');
          if (!_completer.isCompleted) {
            _completer.complete();
            dispose();
          }
          break;
      }
    } catch (e, stack) {
      _logger.severe('Exception during sync chain: $e', e, stack);
      if (!_completer.isCompleted) _completer.completeError(e);
      dispose();
    }
  }

  Future<void> _sendVersion(int type, int version) {
    final m = Message(Commands.dynamicSync);
    m.writer().writeByte(type);
    m.writer().writeByte(version);
    return _session.sendMessage(m);
  }
}