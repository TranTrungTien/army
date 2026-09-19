import 'package:audioplayers/audioplayers.dart';
import 'package:logging/logging.dart';
import '../assets/legacy_rms.dart';

class AudioService {
  final _logger = Logger('AudioService');

  bool _muted = false;
  double _volume = 0.5;

  final _bgmPlayer = AudioPlayer()..setReleaseMode(ReleaseMode.loop);
  final _sfxPlayers = <AudioPlayer>[];
  final _maxSfx = 8;

  Future<void> init() async {
    _volume = (await LegacyRms.loadInt('sound')).clamp(0, 100) / 100.0;
    if (_volume < 0) _volume = 0.5;
    _muted = await LegacyRms.loadInt('vibrate') == 1; // vibrate 1 = muted in some versions

    _logger.info('AudioService initialized (vol=$_volume, muted=$_muted)');
  }

  void playSfx(String name) async {
    if (_muted || _volume <= 0) return;

    // Simple pool of players for SFX
    AudioPlayer player;
    if (_sfxPlayers.length < _maxSfx) {
      player = AudioPlayer();
      _sfxPlayers.add(player);
    } else {
      player = _sfxPlayers.first;
      _sfxPlayers.removeAt(0);
      _sfxPlayers.add(player);
      await player.stop();
    }

    player.setVolume(_volume);
    await player.play(AssetSource('sound/$name.mp3'));
  }

  void playBgm(String name) async {
    if (_muted) return;
    await _bgmPlayer.setVolume(_volume);
    await _bgmPlayer.play(AssetSource('music/$name.mp3'));
  }

  void stopBgm() async {
    await _bgmPlayer.stop();
  }

  void setVolume(double volume) {
    _volume = volume.clamp(0.0, 1.0);
    _bgmPlayer.setVolume(_volume);
    LegacyRms.saveRmsInt('sound', (_volume * 100).toInt());
    _logger.info('Volume set to $_volume');
  }

  void setMuted(bool muted) {
    _muted = muted;
    if (_muted) {
      stopBgm();
    }
    LegacyRms.saveRmsInt('vibrate', _muted ? 1 : 0);
  }

  void dispose() {
    _bgmPlayer.dispose();
    for (final p in _sfxPlayers) {
      p.dispose();
    }
  }
}

