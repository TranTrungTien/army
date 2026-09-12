import 'dart:convert';
import 'dart:typed_data';
import 'package:mobiarmy_flutter/core/legacy_math/fixed_point.dart';

class ByteReader {
  ByteReader(Uint8List data) : _data = data, _offset = 0;

  final Uint8List _data;
  int _offset;

  int readByte() {
    if (_offset >= _data.length) throw RangeError('End of stream');
    final val = _data[_offset++];
    // Convert to signed byte parity with Java
    return val > 127 ? val - 256 : val;
  }

  int readUnsignedByte() {
    if (_offset >= _data.length) throw RangeError('End of stream');
    return _data[_offset++];
  }

  bool readBoolean() {
    return readByte() != 0;
  }

  int readShort() {
    final hi = readUnsignedByte();
    final lo = readUnsignedByte();
    final val = (hi << 8) | lo;
    return val > 32767 ? val - 65536 : val;
  }

  int readUnsignedShort() {
    final hi = readUnsignedByte();
    final lo = readUnsignedByte();
    return (hi << 8) | lo;
  }

  int readInt() {
    final b1 = readUnsignedByte();
    final b2 = readUnsignedByte();
    final b3 = readUnsignedByte();
    final b4 = readUnsignedByte();
    final val = (b1 << 24) | (b2 << 16) | (b3 << 8) | b4;
    return JavaInt32.wrap(val);
  }

  int readLong() {
    int val = 0;
    for (int i = 0; i < 8; i++) {
      val = (val << 8) | readUnsignedByte();
    }
    return val;
  }

  String readUTF() {
    final length = readUnsignedShort();
    if (_offset + length > _data.length) throw RangeError('End of stream');
    final bytes = _data.sublist(_offset, _offset + length);
    _offset += length;
    return utf8.decode(bytes);
  }

  Uint8List readBytes(int length) {
    if (_offset + length > _data.length) throw RangeError('End of stream');
    final bytes = _data.sublist(_offset, _offset + length);
    _offset += length;
    return bytes;
  }

  int get available => _data.length - _offset;
}
