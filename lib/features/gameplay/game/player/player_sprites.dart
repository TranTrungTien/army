import 'dart:typed_data';
import 'dart:ui' as ui;
import 'package:mobiarmy_flutter/core/assets/file_pack_decoder.dart';

/// Port player/CPlayer.init — QUAN TRONG: playerdata2 (sync cmd 90 type 3)
/// la mot FilePack chua toan bo sprite nguoi choi:
///   pImg[0..14]: yellowP, cuteGirl, greenP, conKhiP, rocketer, robot, ga,
///                tazz, apache, cowg, magenta, bosssmall, bossbig,
///                (13 trong), bossrobot
///   + robot parts: arm, leg, body, body_injured
///   + bug parts: bug_gun, bug_body, bug_leg
///   + fire, UFO, UFOFire, khicau, gun (khicau)
/// paintFace dung pImg[glass] voi strip H = height/10 (BodyStrip).
class PlayerSprites {
  PlayerSprites._(this.pack);
  final FilePack pack;

  static late final PlayerSprites instance;

  static Future<void> init(List<int> playerData2) async {
    instance = PlayerSprites._(FilePackDecoder.decode(
      Uint8List.fromList(playerData2),
    ));
  }

  static const bodyNames = [
    'yellowP.png', 'cuteGirl.png', 'greenP.png', 'conKhiP.png',
    'rocketer.png', 'robot.png', 'ga.png', 'tazz.png', 'apache.png',
    'cowg.png', 'magenta.png', 'bosssmall.png', 'bossbig.png',
  ];

  Future<ui.Image?> body(int glass) async {
    if (glass < 0 || glass >= bodyNames.length) return null;
    try {
      return await pack.loadImage(bodyNames[glass]);
    } catch (_) {
      return null;
    }
  }

  Future<ui.Image?> extra(String name) async {
    try {
      return await pack.loadImage(name);
    } catch (_) {
      return null;
    }
  }
}