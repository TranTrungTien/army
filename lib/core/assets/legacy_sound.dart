import 'package:audioplayers/audioplayers.dart';
import 'legacy_rms.dart';

/// Port CLib/mSound + SoundSystem. AssetSource tinh tu assets/:
///   assets/sound/{0,1,2}.wav + assets/music/0.mp3
abstract final class LegacySound {
  static final _sfx = AudioPlayer(playerId: 'sfx');
  static final _bgm = AudioPlayer(playerId: 'bgm');
  static double _volume = 1.0;

  static Future<void> init() async {
    try {
      final v = await LegacyRms.loadInt('sound');
      _volume = ((v < 0 ? 100 : v) / 100.0).clamp(0.0, 1.0);
    } catch (_) {
      // web / chua co RMS — mac dinh 100
    }
  }

  static double get volume => _volume;

  static Future<void> playMusic(int id, {bool loop = true}) async {
    await _bgm.setReleaseMode(loop ? ReleaseMode.loop : ReleaseMode.release);
    await _bgm.setVolume(_volume);
    await _bgm.play(AssetSource('music/' + id.toString() + '.mp3'));
  }

  static Future<void> playEffect(int id) async {
    if (id < 0 || id > 2) return;
    await _sfx.setVolume(_volume);
    await _sfx.play(AssetSource('sound/' + id.toString() + '.wav'));
  }

  static Future<void> stopMusic() => _bgm.stop();
}