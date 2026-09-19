import 'package:audioplayers/audioplayers.dart';
import 'legacy_rms.dart';

/// Port CLib/mSound + SoundSystem. AssetSource tinh tu assets/:
///   assets/sound/{0,1,2}.wav + assets/music/0.mp3
abstract final class LegacySound {
  static final _sfx = AudioPlayer(playerId: 'sfx');
  static final _bgm = AudioPlayer(playerId: 'bgm');
  static double _volume = 1.0;
  static bool _muted = false;

  static Future<void> init() async {
    try {
      final v = await LegacyRms.loadInt('sound');
      _volume = ((v < 0 ? 100 : v) / 100.0).clamp(0.0, 1.0);

      final m = await LegacyRms.loadInt('mute');
      _muted = m == 1;
    } catch (_) {}
  }

  static double get volume => _muted ? 0.0 : _volume;

  static Future<void> setVolume(double value) async {
    _volume = value.clamp(0.0, 1.0);
    await LegacyRms.saveRmsInt('sound', (_volume * 100).round());
    if (!_muted) {
      await _bgm.setVolume(_volume);
      await _sfx.setVolume(_volume);
    }
  }

  static Future<void> setMuted(bool value) async {
    _muted = value;
    await LegacyRms.saveRmsInt('mute', _muted ? 1 : 0);
    final v = volume;
    await _bgm.setVolume(v);
    await _sfx.setVolume(v);
  }

  static Future<void> playMusic(int id, {bool loop = true}) async {
    await _bgm.setReleaseMode(loop ? ReleaseMode.loop : ReleaseMode.release);
    await _bgm.setVolume(volume);
    await _bgm.play(AssetSource('music/$id.mp3'));
  }

  static Future<void> playEffect(int id) async {
    // SFX mapping usually from 0..N
    await _sfx.setVolume(volume);
    await _sfx.play(AssetSource('sound/$id.wav'));
  }

  static Future<void> stopMusic() => _bgm.stop();
}