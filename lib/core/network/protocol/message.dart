import 'dart:typed_data';
import '../codec/byte_reader.dart';
import '../codec/byte_writer.dart';

class Message {
  final int command;
  late final ByteReader _reader;
  late final ByteWriter _writer;
  final Uint8List? _data;

  Message(this.command) : _data = null {
    _writer = ByteWriter();
  }

  Message.fromBytes(this.command, Uint8List data) : _data = data {
    _reader = ByteReader(data);
  }

  ByteReader reader() {
    if (_data == null) {
      throw StateError('Message was created for writing');
    }
    return _reader;
  }

  ByteWriter writer() {
    if (_data != null) {
      throw StateError('Message was created for reading');
    }
    return _writer;
  }

  Uint8List getData() {
    if (_data != null) return _data;
    return _writer.toBytes();
  }

  @override
  String toString() => 'Message(cmd: $command, len: ${getData().length})';
}
