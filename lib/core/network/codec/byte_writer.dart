import 'dart:convert';
import 'dart:typed_data';
import 'package:mobiarmy_flutter/core/legacy_math/fixed_point.dart';

class ByteWriter {
  ByteWriter() : _buffer = Uint8List(1024), _offset = 0;

  Uint8List _buffer;
  int _offset;

  void _ensureCapacity(int length) {
    if (_offset + length > _buffer.length) {
      final newBuffer = Uint8List(_buffer.length * 2 + length);
      newBuffer.setRange(0, _buffer.length, _buffer);
      _buffer = newBuffer;
    }
  }

  void writeByte(int value) {
    _ensureCapacity(1);
    _buffer[_offset++] = JavaInt32.wrap(value) & 0xFF;
  }

  void writeBoolean(bool value) {
    writeByte(value ? 1 : 0);
  }

  void writeShort(int value) {
    _ensureCapacity(2);
    final wrapped = JavaInt32.wrap(value);
    _buffer[_offset++] = (wrapped >> 8) & 0xFF;
    _buffer[_offset++] = wrapped & 0xFF;
  }

  void writeInt(int value) {
    _ensureCapacity(4);
    final wrapped = JavaInt32.wrap(value);
    _buffer[_offset++] = (wrapped >> 24) & 0xFF;
    _buffer[_offset++] = (wrapped >> 16) & 0xFF;
    _buffer[_offset++] = (wrapped >> 8) & 0xFF;
    _buffer[_offset++] = wrapped & 0xFF;
  }

  void writeLong(int value) {
    // Dart ints are 64-bit, but for protocol parity with Java's DataOutputStream.writeLong
    _ensureCapacity(8);
    _buffer[_offset++] = (value >> 56) & 0xFF;
    _buffer[_offset++] = (value >> 48) & 0xFF;
    _buffer[_offset++] = (value >> 40) & 0xFF;
    _buffer[_offset++] = (value >> 32) & 0xFF;
    _buffer[_offset++] = (value >> 24) & 0xFF;
    _buffer[_offset++] = (value >> 16) & 0xFF;
    _buffer[_offset++] = (value >> 8) & 0xFF;
    _buffer[_offset++] = value & 0xFF;
  }

  void writeUTF(String value) {
    final bytes = utf8.encode(value);
    writeShort(bytes.length);
    _ensureCapacity(bytes.length);
    _buffer.setRange(_offset, _offset + bytes.length, bytes);
    _offset += bytes.length;
  }

  void writeBytes(List<int> bytes) {
    _ensureCapacity(bytes.length);
    _buffer.setRange(_offset, _offset + bytes.length, bytes);
    _offset += bytes.length;
  }

  Uint8List toBytes() {
    return _buffer.sublist(0, _offset);
  }

  int get length => _offset;
}
