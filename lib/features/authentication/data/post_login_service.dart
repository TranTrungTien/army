import 'package:mobiarmy_flutter/core/assets/legacy_rms.dart';
import 'package:mobiarmy_flutter/core/network/command/commands.dart';
import 'package:mobiarmy_flutter/core/network/data_sync_service.dart';
import 'package:mobiarmy_flutter/core/network/protocol/message.dart';
import 'package:mobiarmy_flutter/core/network/transport/tcp_session.dart';

/// Port doan cu MessageHandler case 3 (onLoginSuccess) — chay NGAY sau khi
/// nhan cmd 3 loadInfoAll thanh cong:
///   1. luu caroun/caropass (RMS UTF-8) — tich "nho dang nhap"
///   2. gui platform_request (cmd 114) — thong tin thiet bi
///   3. gui bangxephang (-14) — bang xep hang
///   4. bat dau DataSyncService (sendMapData chain)
/// Note: MessageHandler goc con set CCanvas.loginScr timePing o day.
abstract final class PostLoginService {
  static Future<void> run(
    TcpSession session,
    DataSyncService sync, {
    required String username,
    required String password,
    required bool remember,
  }) async {
    if (remember) {
      await LegacyRms.saveString('caroun', username);
      await LegacyRms.saveString('caropass', password);
    } else {
      await LegacyRms.clear('caroun');
      await LegacyRms.clear('caropass');
    }

    // GameService.platform_request() — cmd 114, ghi 3 UTF
    final p = Message(114);
    p.writer().writeUTF(''); // agent/device info (ban goc de trong nhieu noi)
    p.writer().writeUTF('');
    p.writer().writeUTF('');
    await session.sendMessage(p);

    // GameService.bangxephang((byte)-1, -1) — cmd -14: type + page
    final b = Message(Commands.topInfo);
    b.writer().writeByte(-1);
    b.writer().writeByte(-1);
    await session.sendMessage(b);

    await sync.start(); // sendMapData chain
  }

  /// Doc lai tai khoan da nho (LoginScr.init prefill).
  static Future<(String, String)?> loadRemembered() async {
    final u = await LegacyRms.loadString('caroun');
    final p = await LegacyRms.loadString('caropass');
    if (u == null || p == null) return null;
    return (u, p);
  }
}