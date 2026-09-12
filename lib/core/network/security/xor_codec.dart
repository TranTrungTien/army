import 'dart:typed_data';

class XorCodec {
  XorCodec(List<int> rawKey)
    : _key = Uint8List.fromList(rawKey),
      _readPos = 0,
      _writePos = 0;

  static XorCodec fromSessionMessage(List<int> messageData) {
    final key = Uint8List.fromList(messageData.sublist(1));
    for (int i = 0; i < key.length - 1; i++) {
      key[i + 1] ^= key[i];
    }
    return XorCodec(key);
  }

  final Uint8List _key;
  int _readPos;
  int _writePos;

  int decryptByte(int b) {
    final result = (b ^ _key[_readPos++]) & 0xFF;
    if (_readPos >= _key.length) {
      _readPos %= _key.length;
    }
    return result;
  }

  int encryptByte(int b) {
    final result = (b ^ _key[_writePos++]) & 0xFF;
    if (_writePos >= _key.length) {
      _writePos %= _key.length;
    }
    return result;
  }

  Uint8List decrypt(Uint8List data) {
    final result = Uint8List(data.length);
    for (int i = 0; i < data.length; i++) {
      result[i] = decryptByte(data[i]);
    }
    return result;
  }

  Uint8List encrypt(Uint8List data) {
    final result = Uint8List(data.length);
    for (int i = 0; i < data.length; i++) {
      result[i] = encryptByte(data[i]);
    }
    return result;
  }

  void reset() {
    _readPos = 0;
    _writePos = 0;
  }
}
