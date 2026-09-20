import 'dart:async';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:logging/logging.dart';

import '../codec/byte_writer.dart';
import '../command/commands.dart';
import '../dispatcher/message_dispatcher.dart';
import '../protocol/message.dart';
import '../security/xor_codec.dart';
import 'session_state_listener.dart';

class TcpSession {
  TcpSession(this.dispatcher, {this.listener});

  final MessageDispatcher dispatcher;
  final SessionStateListener? listener;

  final _logger = Logger('TcpSession');

  Socket? _socket;
  StreamSubscription<Uint8List>? _socketSubscription;
  XorCodec? _codec;
  bool _getKeyComplete = false;
  bool _intentionallyClosed = false;

  final List<int> _rawBuffer = [];

  bool get isConnected => _socket != null;

  Future<void> connect(String host, int port) async {
    if (kIsWeb) {
      throw UnsupportedError('TCP Sockets are not supported on Web. Use a WebSocket proxy.');
    }
    _logger.info('Connecting to $host:$port');
    _intentionallyClosed = false;

    // Cleanup any existing connection completely first
    await _cleanupSocket();

    try {
      _socket = await Socket.connect(
        host,
        port,
        timeout: const Duration(seconds: 20),
      );
      _getKeyComplete = false;
      _codec = null;
      _rawBuffer.clear();

      _socketSubscription = _socket!.listen(
        _onData,
        onError: (Object e) {
          _logger.severe('Socket error: $e');
          listener?.onSocketError(e);
        },
        onDone: () {
          _logger.info('Socket closed');
          final reason = _intentionallyClosed ? null : 'Server đóng kết nối';
          _cleanupSocketSync();
          listener?.onDisconnected(reason);
        },
        cancelOnError: true,
      );

      await sendMessage(Message(Commands.getKey));
    } catch (e) {
      _logger.severe('Failed to connect: $e');
      _cleanupSocketSync();
      rethrow;
    }
  }

  Future<void> sendMessage(Message message) async {
    final socket = _socket;
    if (socket == null) return;

    final data = message.getData();
    final cmd = message.command;
    final size = data.length;

    final writer = ByteWriter();

    if (_getKeyComplete && _codec != null) {
      writer.writeByte(_codec!.encryptByte(cmd));
      writer.writeByte(_codec!.encryptByte((size >> 8) & 0xFF));
      writer.writeByte(_codec!.encryptByte(size & 0xFF));
      for (var b in data) {
        writer.writeByte(_codec!.encryptByte(b));
      }
    } else {
      writer.writeByte(cmd);
      writer.writeShort(size);
      writer.writeBytes(data);
    }

    if (cmd != 42) {
      _logger.fine('Sending packet command ID: $cmd, length: $size');
    }

    socket.add(writer.toBytes());
    await socket.flush();
  }

  void handleDataForTesting(Uint8List data) {
    _onData(data);
  }

  void _onData(Uint8List data) {
    _rawBuffer.addAll(data);
    _processBufferIncremental();
  }

  void _processBufferIncremental() {
    while (_rawBuffer.isNotEmpty) {
      // Wait, we need an exact checkpointing mechanism. Let's make a mini cursor decoder loop.

      int bufferIndex = 0;
      if (_rawBuffer.isEmpty) return;

      int rawCmd = _rawBuffer[bufferIndex++];
      if (_getKeyComplete && _codec != null) {
        // Look up decrypted byte hypothetically using a clean custom lookahead offset
        rawCmd = (_rawCmdLookahead(rawCmd, 0)) > 127 ? (_rawCmdLookahead(rawCmd, 0)) - 256 : (_rawCmdLookahead(rawCmd, 0));
      } else {
        rawCmd = rawCmd > 127 ? rawCmd - 256 : rawCmd;
      }

      int headerSize = 1;
      int size = 0;

      if (rawCmd == -120 || rawCmd == Commands.dynamicSync) {
        headerSize += 4;
        if (_rawBuffer.length < headerSize) return; // Wait for full header bytes

        if (_getKeyComplete && _codec != null) {
          final b1 = _rawCmdLookahead(_rawBuffer[1], 1);
          final b2 = _rawCmdLookahead(_rawBuffer[2], 2);
          final b3 = _rawCmdLookahead(_rawBuffer[3], 3);
          final b4 = _rawCmdLookahead(_rawBuffer[4], 4);
          size = (b1 << 24) | (b2 << 16) | (b3 << 8) | b4;
        } else {
          size = (_rawBuffer[1] << 24) | (_rawBuffer[2] << 16) | (_rawBuffer[3] << 8) | _rawBuffer[4];
        }
      } else {
        headerSize += 2;
        if (_rawBuffer.length < headerSize) return; // Wait for full header bytes

        if (_getKeyComplete && _codec != null) {
          final b1 = _rawCmdLookahead(_rawBuffer[1], 1);
          final b2 = _rawCmdLookahead(_rawBuffer[2], 2);
          size = (b1 << 8) | b2;
        } else {
          size = (_rawBuffer[1] << 8) | _rawBuffer[2];
        }
      }

      // Safeguard against corrupted huge frame sizes
      if (size < 0 || size > 1024 * 1024 * 5) {
        _logger.severe('Corrupted frame size detected: $size. Aborting streaming loop.');
        _rawBuffer.clear();
        _cleanupSocketSync();
        listener?.onDisconnected('Dữ liệu luồng mạng lỗi cấu trúc');
        return;
      }

      if (_rawBuffer.length < headerSize + size) {
        // Incomplete packet body segment. Return safely and wait for more data.
        // Notice we DID NOT consume or commit any cursor drift.
        return;
      }

      // Full frame present! Consume header + body payload bytes from raw buffer list
      final frameBytes = Uint8List.fromList(_rawBuffer.sublist(0, headerSize + size));
      _rawBuffer.removeRange(0, headerSize + size);

      // Now advance the REAL cursor sequentially because we are executing the packet consumption
      int finalCmd = frameBytes[0];
      if (_getKeyComplete && _codec != null) {
        finalCmd = _codec!.decryptByte(finalCmd);
      }
      finalCmd = finalCmd > 127 ? finalCmd - 256 : finalCmd;

      if (finalCmd == -120 || finalCmd == Commands.dynamicSync) {
        if (_getKeyComplete && _codec != null) {
          _codec!.decryptByte(frameBytes[1]);
          _codec!.decryptByte(frameBytes[2]);
          _codec!.decryptByte(frameBytes[3]);
          _codec!.decryptByte(frameBytes[4]);
        }
      } else {
        if (_getKeyComplete && _codec != null) {
          _codec!.decryptByte(frameBytes[1]);
          _codec!.decryptByte(frameBytes[2]);
        }
      }

      var payload = Uint8List.fromList(frameBytes.sublist(headerSize));
      if (_getKeyComplete && _codec != null) {
        payload = _codec!.decrypt(payload);
      }

      if (finalCmd != 42) {
        _logger.fine('Received message opcode command ID: $finalCmd, size: $size');
      }

      final message = Message.fromBytes(finalCmd, payload);
      _handleInternal(message);
    }
  }

  int _rawCmdLookahead(int rawByte, int offset) {
    if (_codec == null) return rawByte;
    return _codec!.lookaheadDecryptByte(rawByte, offset);
  }

  void _handleInternal(Message message) {
    if (_intentionallyClosed) return; // Do not dispatch packets after close/dispose
    if (message.command == Commands.getKey) {
      _codec = XorCodec.fromSessionMessage(message.getData());
      _getKeyComplete = true;
      _logger.info('Key initialized successfully matching Java contract');
      listener?.onHandshakeComplete();
    } else {
      dispatcher.dispatch(message);
    }
  }

  Future<void> _cleanupSocket() async {
    _cleanupSocketSync();
  }

  void _cleanupSocketSync() {
    try {
      _socketSubscription?.cancel();
    } catch (_) {}
    _socketSubscription = null;

    try {
      _socket?.destroy();
    } catch (_) {}
    _socket = null;

    _codec = null;
    _getKeyComplete = false;
    _rawBuffer.clear();
  }

  Future<void> dispose() async {
    _intentionallyClosed = true;
    _cleanupSocketSync();
  }
}

