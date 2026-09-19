import 'package:mobiarmy_flutter/core/assets/legacy_rms.dart';
import 'package:mobiarmy_flutter/core/network/command/commands.dart';
import 'package:mobiarmy_flutter/core/network/data_sync_service.dart';
import 'package:mobiarmy_flutter/core/network/protocol/message.dart';
import 'package:mobiarmy_flutter/core/network/transport/tcp_session.dart';

/// Port doan cu MessageHandler case 3 (onLoginSuccess) — chay NGAY sau khi
/// nhan cmd 3 loadInfoAll thanh cong.
abstract final class PostLoginService {
  static const String kDefaultAgent = '';

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

    // GameService.platform_request() — cmd 114, ghi 3 UTF.
    // Port parity: server checks agent for custom client behavior.
    final p = Message(Commands.platformRequest);
    p.writer().writeUTF(kDefaultAgent);
    p.writer().writeUTF('');
    p.writer().writeUTF('');
    await session.sendMessage(p);

    // getString() — cmd 115
    final s = Message(Commands.getString);
    s.writer().writeUTF('abc'); // Default handshake string
    await session.sendMessage(s);

    // GameService.bangxephang((byte)-1, -1) — cmd -14: type + page.
    final b = Message(Commands.topInfo);
    b.writer().writeByte(-1);
    b.writer().writeByte(-1);
    await session.sendMessage(b);

    // Mandatory data sync chain start
    await sync.start();
  }

  /// Doc lai tai khoan da nho (LoginScr.init prefill).
  static Future<(String, String)?> loadRemembered() async {
    final u = await LegacyRms.loadString('caroun');
    final p = await LegacyRms.loadString('caropass');
    if (u == null || p == null) return null;
    return (u, p);
  }
}