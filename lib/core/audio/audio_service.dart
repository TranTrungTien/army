import 'package:logging/logging.dart';

class AudioService {
  final _logger = Logger('AudioService');

  bool _muted = false;
  double _volume = 0.5;

  Future<void> init() async {
    _logger.info('AudioService initialized');
  }

  void playSfx(String name) {
    if (_muted) return;
    _logger.fine('Playing SFX: $name');
    // TODO: integrate flame_audio or audioplayers
  }

  void playBgm(String name) {
    if (_muted) return;
    _logger.fine('Playing BGM: $name');
  }

  void stopBgm() {
    _logger.fine('Stopping BGM');
  }

  void setVolume(double volume) {
    _volume = volume.clamp(0.0, 1.0);
  }

  void setMuted(bool muted) {
    _muted = muted;
  }
}
