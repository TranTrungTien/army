import 'dart:async';
import 'dart:io';
import 'dart:typed_data';
import 'package:logging/logging.dart';

import '../codec/byte_reader.dart';
import '../codec/byte_writer.dart';
import '../command/commands.dart';
import '../protocol/message.dart';
import '../security/xor_codec.dart';
import '../dispatcher/message_dispatcher.dart';
import 'session_state_listener.dart';

class TcpSession {
  TcpSession(this.dispatcher, {this.listener});

  final MessageDispatcher dispatcher;
  final SessionStateListener? listener;

  final _logger = Logger('TcpSession');

  Socket? _socket;
  XorCodec? _codec;
  bool _getKeyComplete = false;
  bool _intentionallyClosed = false;

  final BytesBuilder _buffer = BytesBuilder();

  bool get isConnected => _socket != null;

  /// TCP connect + automatic key request (cmd -27).
  ///
  /// PARITY (Session.java): the key response itself travels UNencrypted —
  /// the server marks the session key-initialized only after sending it.
  /// All subsequent bytes in both directions are XORed with the key stream.
  Future<void> connect(String host, int port) async {
    _logger.info('Connecting to $host:$port');
    _intentionallyClosed = false;
    try {
      _socket = await Socket.connect(
        host,
        port,
        timeout: const Duration(seconds: 20),
      );
      _getKeyComplete = false;
      _codec = null;
      _buffer.clear();

      _socket!.listen(
        _onData,
        onError: (Object e) {
          _logger.severe('Socket error: $e');
          listener?.onSocketError(e);
        },
        onDone: () {
          _logger.info('Socket closed');
          final reason = _intentionallyClosed ? null : 'Server đóng kết nối';
          _reset();
          listener?.onDisconnected(reason);
        },
        cancelOnError: true,
      );

      await sendMessage(Message(Commands.getKey));
    } catch (e) {
      _logger.severe('Failed to connect: $e');
      _reset();
      rethrow;
    }
  }

  /// Sends are serialized by the Dart event loop (single isolate); socket.add
  /// preserves ordering, so no extra lock is needed.
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

    socket.add(writer.toBytes());
    await socket.flush();
  }

  void _onData(Uint8List data) {
    _buffer.add(data);
    _processBuffer();
  }

  void _processBuffer() {
    while (true) {
      final currentBuffer = _buffer.takeBytes();
      if (currentBuffer.isEmpty) return;

      final reader = ByteReader(currentBuffer);

      try {
        if (reader.available < 1) {
          _buffer.add(currentBuffer);
          return;
        }

        int cmd = reader.readUnsignedByte();
        if (_getKeyComplete && _codec != null) {
          cmd = _codec!.decryptByte(cmd);
        }
        final command = cmd > 127 ? cmd - 256 : cmd;

        int size;
        if (command == -120 || command == Commands.dynamicSync) {
          if (reader.available < 4) {
            _buffer.add(currentBuffer);
            return;
          }
          size = reader.readInt();
        } else {
          if (reader.available < 2) {
            _buffer.add(currentBuffer);
            return;
          }
          var b1 = reader.readUnsignedByte();
          var b2 = reader.readUnsignedByte();
          if (_getKeyComplete && _codec != null) {
            b1 = _codec!.decryptByte(b1);
            b2 = _codec!.decryptByte(b2);
          }
          size = (b1 << 8) | b2;
        }

        if (reader.available < size) {
          _buffer.add(currentBuffer);
          return;
        }

        var payload = reader.readBytes(size);
        if (_getKeyComplete && _codec != null) {
          payload = _codec!.decrypt(payload);
        }

        final message = Message.fromBytes(command, payload);
        _handleInternal(message);

        if (reader.available > 0) {
          _buffer.add(reader.readBytes(reader.available));
          continue;
        }
        break;
      } catch (e) {
        _logger.severe('Packet parsing error: $e');
        break;
      }
    }
  }

  void _handleInternal(Message message) {
    if (message.command == Commands.getKey) {
      _codec = XorCodec.fromSessionMessage(message.getData());
      _getKeyComplete = true;
      _logger.info('Key initialized');
      listener?.onHandshakeComplete();
    } else {
      dispatcher.dispatch(message);
    }
  }

  void _reset() {
    _socket = null;
    _codec = null;
    _getKeyComplete = false;
    _buffer.clear();
  }

  Future<void> dispose() async {
    _intentionallyClosed = true;
    final socket = _socket;
    _reset();
    try {
      await socket?.close();
    } catch (_) {
      // Ignore close errors — the listener was already notified via onDone.
    }
  }
}
