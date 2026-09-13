# Project Context for AI Study

---

## Directory Structure (`lib/`)

```
lib/
├── app
│   ├── lifecycle
│   │   └── app_lifecycle_coordinator.dart
│   ├── router
│   │   ├── app_route.dart
│   │   ├── app_router.dart
│   │   └── navigation_state.dart
│   ├── army_app.dart
│   └── bootstrap.dart
├── core
│   ├── assets
│   │   ├── asset_manifest.dart
│   │   ├── asset_scope.dart
│   │   ├── bmfont.dart
│   │   ├── file_pack_decoder.dart
│   │   ├── game_asset_bundle.dart
│   │   ├── game_asset_loader.dart
│   │   ├── legacy_rms.dart
│   │   ├── legacy_sound.dart
│   │   ├── map_asset_repository.dart
│   │   └── sprite_atlas_repository.dart
│   ├── config
│   │   └── app_config.dart
│   ├── diagnostics
│   │   └── app_logger.dart
│   ├── errors
│   │   └── app_error_boundary.dart
│   ├── legacy_math
│   │   ├── fixed_point.dart
│   │   ├── legacy_angle.dart
│   │   ├── legacy_collision_math.dart
│   │   ├── legacy_interpolation.dart
│   │   ├── legacy_position.dart
│   │   ├── legacy_random.dart
│   │   └── legacy_trigonometry.dart
│   └── network
│       ├── codec
│       │   ├── byte_reader.dart
│       │   └── byte_writer.dart
│       ├── command
│       │   └── commands.dart
│       ├── dispatcher
│       │   └── message_dispatcher.dart
│       ├── protocol
│       │   └── message.dart
│       ├── security
│       │   └── xor_codec.dart
│       ├── transport
│       │   ├── session_state_listener.dart
│       │   └── tcp_session.dart
│       ├── connection_lifecycle.dart
│       ├── data_cache_parsers.dart
│       ├── data_sync_service.dart
│       ├── network_provider.dart
│       └── ping_heartbeat.dart
├── features
│   ├── authentication
│   │   ├── application
│   │   │   ├── auth_controller.dart
│   │   │   └── auth_state_machine.dart
│   │   ├── data
│   │   │   ├── account_storage.dart
│   │   │   ├── auth_repository.dart
│   │   │   ├── post_login_service.dart
│   │   │   ├── server_catalog.dart
│   │   │   ├── server_list_store.dart
│   │   │   └── session_packet_mapper.dart
│   │   ├── domain
│   │   │   ├── account_credentials.dart
│   │   │   ├── authentication_state.dart
│   │   │   ├── game_server.dart
│   │   │   └── user_session.dart
│   │   └── presentation
│   │       ├── login_screen.dart
│   │       └── server_selection_screen.dart
│   └── gameplay
│       ├── application
│       │   ├── chat_service.dart
│       │   ├── game_controls.dart
│       │   ├── game_session_bootstrap.dart
│       │   ├── game_start_handler.dart
│       │   ├── gameplay_handler.dart
│       │   ├── gameplay_provider.dart
│       │   ├── lobby_service.dart
│       │   ├── online_game_service.dart
│       │   └── room_service.dart
│       ├── data
│       │   └── character
│       │       └── equipment_manifest_parser.dart
│       ├── domain
│       │   ├── camera
│       │   │   └── camera_mode.dart
│       │   ├── character
│       │   │   ├── character_animation_state.dart
│       │   │   ├── character_appearance.dart
│       │   │   ├── character_definition.dart
│       │   │   └── equipment_definition.dart
│       │   ├── player
│       │   │   └── player_movement_state.dart
│       │   └── room_list_models.dart
│       ├── game
│       │   ├── effects
│       │   │   └── effects.dart
│       │   ├── input
│       │   │   ├── gameplay_input_controller.dart
│       │   │   └── gameplay_input_state.dart
│       │   ├── map
│       │   │   ├── background_component.dart
│       │   │   ├── destructible_terrain.dart
│       │   │   ├── game_map_definition.dart
│       │   │   ├── icon_preview.dart
│       │   │   ├── legacy_map_parser.dart
│       │   │   ├── map_binary_parser.dart
│       │   │   ├── map_component.dart
│       │   │   ├── map_debug_overlay.dart
│       │   │   ├── map_json_loader.dart
│       │   │   ├── map_repository.dart
│       │   │   ├── map_world_controller.dart
│       │   │   └── terrain_component.dart
│       │   ├── player
│       │   │   ├── character_animation_controller.dart
│       │   │   ├── character_component.dart
│       │   │   ├── character_sprite_resolver.dart
│       │   │   ├── equip_anchor.dart
│       │   │   ├── equipment_layer_component.dart
│       │   │   ├── game_player.dart
│       │   │   ├── online_character.dart
│       │   │   ├── player_sprites.dart
│       │   │   └── sandbox_character_component.dart
│       │   ├── projectile
│       │   │   ├── bullet_simulator.dart
│       │   │   ├── projectile_component.dart
│       │   │   ├── projectile_trajectory.dart
│       │   │   └── trajectory_simulator.dart
│       │   ├── sandbox
│       │   │   ├── sandbox_equipment_data.dart
│       │   │   └── sandbox_scenario.dart
│       │   ├── systems
│       │   │   ├── camera_system.dart
│       │   │   ├── combat_system.dart
│       │   │   ├── ground_probe.dart
│       │   │   ├── legacy_camera.dart
│       │   │   ├── player_collision_system.dart
│       │   │   ├── player_movement_system.dart
│       │   │   └── screen_shake_effect.dart
│       │   └── army_game.dart
│       └── presentation
│           ├── widgets
│           │   ├── aim_controls.dart
│           │   ├── movement_controls.dart
│           │   └── power_bar.dart
│           ├── gameplay_page.dart
│           ├── gameplay_sandbox_screen.dart
│           ├── lobby_screen.dart
│           ├── offline_demo_screen.dart
│           ├── online_game_screen.dart
│           └── room_screen.dart
├── shared
│   ├── overlays
│   │   └── gameplay_hud.dart
│   ├── theme
│   │   └── army_theme.dart
│   └── widgets
│       └── placeholder_screen.dart
└── main.dart
```

## `pubspec.yaml`
```yaml
name: mobiarmy_flutter
description: Flutter and Flame migration foundation for MobiArmy2.
publish_to: none
version: 0.1.0+1

environment:
  sdk: '>=3.11.0 <4.0.0'

dependencies:
  flutter:
    sdk: flutter
  flame: ^1.38.2
  flutter_riverpod: ^3.0.0
  go_router: ^16.0.0
  collection: ^1.19.1
  logging: ^1.3.0
  path_provider: ^2.1.0
  audioplayers: ^6.0.0
  http: ^1.2.0

dev_dependencies:
  flutter_test:
    sdk: flutter
  flutter_lints: ^6.0.0

flutter:
  uses-material-design: true
  assets:
    - assets/
```

## Source Code

### `D:\personal\army/lib\app\army_app.dart`
```dart
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mobiarmy_flutter/app/router/app_router.dart';
import 'package:mobiarmy_flutter/shared/theme/army_theme.dart';

class ArmyApp extends ConsumerWidget {
  const ArmyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final router = ref.watch(appRouterProvider);
    return MaterialApp.router(
      title: 'MobiArmy Flutter',
      debugShowCheckedModeBanner: false,
      theme: ArmyTheme.dark,
      routerConfig: router,
    );
  }
}
```

### `D:\personal\army/lib\app\bootstrap.dart`
```dart
import 'dart:async';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logging/logging.dart';
import 'package:mobiarmy_flutter/app/army_app.dart';
import 'package:mobiarmy_flutter/core/diagnostics/app_logger.dart';
import 'package:mobiarmy_flutter/core/errors/app_error_boundary.dart';

/// FIX: binding init phai CUNG ZONE voi runApp (tranh "Zone mismatch").
Future<void> bootstrap({bool debug = false}) async {
  await runZonedGuarded(() async {
    WidgetsFlutterBinding.ensureInitialized();
    configureLogging(debug: debug);
    await SystemChrome.setPreferredOrientations(const [
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
    ]);
    await SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);

    FlutterError.onError = (details) {
      FlutterError.presentError(details);
      Logger('FlutterError').severe(
        details.exceptionAsString(),
        details.exception,
        details.stack,
      );
    };
    PlatformDispatcher.instance.onError = (error, stack) {
      Logger('PlatformDispatcher').severe('Uncaught platform error', error, stack);
      return true;
    };

    runApp(const ProviderScope(child: AppErrorBoundary(child: ArmyApp())));
  }, (error, stack) => Logger('Zone').severe('Uncaught zone error', error, stack));
}
```

### `D:\personal\army/lib\app\lifecycle\app_lifecycle_coordinator.dart`
```dart
import 'package:flutter/widgets.dart';
import 'package:mobiarmy_flutter/core/network/connection_lifecycle.dart';
import 'package:mobiarmy_flutter/features/gameplay/game/army_game.dart';

class AppLifecycleCoordinator with WidgetsBindingObserver {
  AppLifecycleCoordinator({required this.game, required this.connection});
  final ArmyGame game;
  final ConnectionLifecycle connection;
  bool _disposed = false;

  void start() => WidgetsBinding.instance.addObserver(this);

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (_disposed) return;
    switch (state) {
      case AppLifecycleState.resumed:
        connection.onForeground();
        game.resumeSafely();
      case AppLifecycleState.inactive:
      case AppLifecycleState.hidden:
      case AppLifecycleState.paused:
      case AppLifecycleState.detached:
        game.pauseSafely();
        connection.onBackground();
    }
  }

  void dispose() {
    if (_disposed) return;
    _disposed = true;
    WidgetsBinding.instance.removeObserver(this);
  }
}
```

### `D:\personal\army/lib\app\router\app_route.dart`
```dart
enum AppRoute {
  bootstrap('/'),
  serverSelection('/servers'),
  login('/login'),
  lobby('/lobby'),
  room('/room'),
  gameplaySandbox('/gameplay-sandbox');

  const AppRoute(this.path);
  final String path;
}
```

### `D:\personal\army/lib\app\router\app_router.dart`
```dart
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:mobiarmy_flutter/app/router/app_route.dart';
import 'package:mobiarmy_flutter/app/router/navigation_state.dart';
import 'package:mobiarmy_flutter/features/authentication/application/auth_controller.dart';
import 'package:mobiarmy_flutter/features/authentication/domain/authentication_state.dart';
import 'package:mobiarmy_flutter/features/authentication/presentation/login_screen.dart';
import 'package:mobiarmy_flutter/features/authentication/presentation/server_selection_screen.dart';
import 'package:mobiarmy_flutter/features/gameplay/presentation/gameplay_sandbox_screen.dart';
import 'package:mobiarmy_flutter/shared/widgets/placeholder_screen.dart';

final appRouterProvider = Provider<GoRouter>((ref) {
  final router = GoRouter(
    initialLocation: AppRoute.bootstrap.path,
    refreshListenable: _RouterRefresh(ref),
    redirect: (context, state) {
      final nav = ref.read(navigationControllerProvider);
      final auth = ref.read(authControllerProvider);
      final location = state.matchedLocation;

      if (!nav.bootstrapped && location != AppRoute.bootstrap.path) {
        return AppRoute.bootstrap.path;
      }
      if (nav.bootstrapped && location == AppRoute.bootstrap.path) {
        return auth.isAuthenticated
            ? AppRoute.lobby.path
            : AppRoute.serverSelection.path;
      }

      final inAuthFlow =
          location == AppRoute.serverSelection.path ||
          location == AppRoute.login.path;

      if (auth.isAuthenticated) {
        // Never allow an authenticated user back into the auth flow.
        if (inAuthFlow) return AppRoute.lobby.path;
        return null;
      }

      if ({AppRoute.lobby.path, AppRoute.room.path}.contains(location)) {
        return AppRoute.serverSelection.path;
      }

      // Login screen is only reachable with a live, handshaked connection
      // (or while a login round-trip / failure is being shown).
      if (location == AppRoute.login.path &&
          auth.status != AuthStatus.connected &&
          auth.status != AuthStatus.authenticating &&
          auth.status != AuthStatus.failed) {
        return AppRoute.serverSelection.path;
      }

      return null;
    },
    errorBuilder: (context, state) => PlaceholderScreen(
      title: 'Navigation error',
      message: state.error.toString(),
    ),
    routes: [
      GoRoute(
        path: AppRoute.bootstrap.path,
        builder: (_, _) => const BootstrapScreen(),
      ),
      GoRoute(
        path: AppRoute.serverSelection.path,
        builder: (_, _) => const ServerSelectionScreen(),
      ),
      GoRoute(
        path: AppRoute.login.path,
        builder: (_, _) => const LoginScreen(),
      ),
      GoRoute(
        path: AppRoute.lobby.path,
        builder: (_, _) => const PlaceholderScreen(title: 'Lobby (Phase 14)'),
      ),
      GoRoute(
        path: AppRoute.room.path,
        builder: (_, _) => const PlaceholderScreen(title: 'Room (Phase 15)'),
      ),
      GoRoute(
        path: AppRoute.gameplaySandbox.path,
        builder: (_, _) => const GameplaySandboxScreen(),
      ),
    ],
  );
  ref.onDispose(router.dispose);
  return router;
});

class _RouterRefresh extends ChangeNotifier {
  _RouterRefresh(this.ref) {
    ref.listen(navigationControllerProvider, (_, _) => notifyListeners());
    ref.listen(authControllerProvider, (_, _) => notifyListeners());
  }
  final Ref ref;
}

class BootstrapScreen extends ConsumerStatefulWidget {
  const BootstrapScreen({super.key});
  @override
  ConsumerState<BootstrapScreen> createState() => _BootstrapScreenState();
}

class _BootstrapScreenState extends ConsumerState<BootstrapScreen> {
  @override
  void initState() {
    super.initState();
    Future<void>.microtask(
      () => ref.read(navigationControllerProvider.notifier).completeBootstrap(),
    );
  }

  @override
  Widget build(BuildContext context) =>
      const Scaffold(body: Center(child: CircularProgressIndicator()));
}
```

### `D:\personal\army/lib\app\router\navigation_state.dart`
```dart
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mobiarmy_flutter/features/authentication/application/auth_controller.dart';
import 'package:mobiarmy_flutter/features/authentication/domain/authentication_state.dart';

class NavigationState {
  const NavigationState({
    required this.bootstrapped,
    required this.authenticated,
  });
  const NavigationState.initial() : bootstrapped = false, authenticated = false;
  final bool bootstrapped;
  final bool authenticated;

  NavigationState copyWith({bool? bootstrapped, bool? authenticated}) =>
      NavigationState(
        bootstrapped: bootstrapped ?? this.bootstrapped,
        authenticated: authenticated ?? this.authenticated,
      );
}

class NavigationController extends Notifier<NavigationState> {
  @override
  NavigationState build() {
    // Route guards read navigationState.authenticated; mirror it from the
    // auth state machine so packet-driven transitions re-route automatically.
    ref.listen<AuthenticationState>(authControllerProvider, (previous, next) {
      final authenticated = next.isAuthenticated;
      if (state.authenticated != authenticated) {
        state = state.copyWith(authenticated: authenticated);
      }
    });
    return const NavigationState.initial();
  }

  void completeBootstrap() => state = state.copyWith(bootstrapped: true);
  void setAuthenticated(bool value) =>
      state = state.copyWith(authenticated: value);
}

final navigationControllerProvider =
    NotifierProvider<NavigationController, NavigationState>(
      NavigationController.new,
    );
```

### `D:\personal\army/lib\core\assets\asset_manifest.dart`
```dart
import 'dart:convert';

class AssetManifestFormatException implements FormatException {
  const AssetManifestFormatException(this.message, [this.source, this.offset]);
  @override
  final String message;
  @override
  final dynamic source;
  @override
  final int? offset;
}

enum GameAssetKind { image, tile, map, font, audio }

class GameAssetEntry {
  const GameAssetEntry({
    required this.id,
    required this.kind,
    required this.path,
    required this.available,
  });
  final String id;
  final GameAssetKind kind;
  final String path;
  final bool available;
}

class AtlasFrame {
  const AtlasFrame({
    required this.name,
    required this.x,
    required this.y,
    required this.width,
    required this.height,
  });
  final String name;
  final int x, y, width, height;
}

class AtlasDefinition {
  const AtlasDefinition({
    required this.id,
    required this.imagePath,
    required this.width,
    required this.height,
    required this.frames,
  });
  final String id, imagePath;
  final int width, height;
  final List<AtlasFrame> frames;
}

class GameAssetManifest {
  const GameAssetManifest({required this.assets, required this.atlases});
  final Map<String, GameAssetEntry> assets;
  final Map<String, AtlasDefinition> atlases;

  factory GameAssetManifest.fromJsonString(String source) {
    final value = jsonDecode(source);
    if (value is! Map<String, dynamic> || value['schemaVersion'] != 1) {
      throw const AssetManifestFormatException(
        'Unsupported asset manifest schema',
      );
    }
    final assets = <String, GameAssetEntry>{};
    for (final raw in (value['assets'] as List<dynamic>? ?? const [])) {
      final m = raw as Map<String, dynamic>;
      final id = m['id'] as String;
      if (assets.containsKey(id)) {
        throw AssetManifestFormatException('Duplicate asset id: $id');
      }
      assets[id] = GameAssetEntry(
        id: id,
        kind: GameAssetKind.values.byName(m['kind'] as String),
        path: m['path'] as String,
        available: m['available'] as bool? ?? true,
      );
    }
    final atlases = <String, AtlasDefinition>{};
    for (final raw in (value['atlases'] as List<dynamic>? ?? const [])) {
      final m = raw as Map<String, dynamic>;
      final id = m['id'] as String;
      if (atlases.containsKey(id)) {
        throw AssetManifestFormatException('Duplicate atlas id: $id');
      }
      final width = m['width'] as int, height = m['height'] as int;
      final names = <String>{};
      final frames = <AtlasFrame>[];
      for (final frameRaw in m['frames'] as List<dynamic>) {
        final f = frameRaw as Map<String, dynamic>;
        final name = f['name'] as String;
        if (!names.add(name)) {
          throw AssetManifestFormatException('Duplicate frame: $id/$name');
        }
        final frame = AtlasFrame(
          name: name,
          x: f['x'] as int,
          y: f['y'] as int,
          width: f['width'] as int,
          height: f['height'] as int,
        );
        if (frame.x < 0 ||
            frame.y < 0 ||
            frame.width <= 0 ||
            frame.height <= 0 ||
            frame.x + frame.width > width ||
            frame.y + frame.height > height) {
          throw AssetManifestFormatException(
            'Atlas frame out of bounds: $id/$name',
          );
        }
        frames.add(frame);
      }
      atlases[id] = AtlasDefinition(
        id: id,
        imagePath: m['imagePath'] as String,
        width: width,
        height: height,
        frames: List.unmodifiable(frames),
      );
    }
    return GameAssetManifest(
      assets: Map.unmodifiable(assets),
      atlases: Map.unmodifiable(atlases),
    );
  }
}
```

### `D:\personal\army/lib\core\assets\asset_scope.dart`
```dart
class AssetScope {
  AssetScope({required this.name});
  final String name;
  final Map<String, int> _references = {};
  final Map<String, void Function()> _disposers = {};
  bool _disposed = false;
  int referenceCount(String id) => _references[id] ?? 0;
  void retain(String id, void Function() dispose) {
    if (_disposed) throw StateError('AssetScope disposed');
    _references[id] = referenceCount(id) + 1;
    _disposers[id] = dispose;
  }

  void release(String id) {
    final count = referenceCount(id);
    if (count <= 1) {
      _references.remove(id);
      _disposers.remove(id)?.call();
    } else {
      _references[id] = count - 1;
    }
  }

  void dispose() {
    if (_disposed) return;
    _disposed = true;
    for (final dispose in _disposers.values) {
      dispose();
    }
    _disposers.clear();
    _references.clear();
  }
}
```

### `D:\personal\army/lib\core\assets\bmfont.dart`
```dart
import 'dart:ui' as ui;

/// Port cua CLib/SysTemFont: font BitmapFont chuan AngelCode (.fnt TEXT).
/// Bản gốc load: res/FontSys/x{zoom}/{big|mini}.fnt + .png
/// (LibSysTem.font = "FontSys/x", SysTemFont chọn big/mini theo ID).
///
/// Chi can parser duoc BMFont text format la render duoc dung giao dien,
/// dung bang mau colorJava[] trong mFont.java (id + 1).
class BmChar {
  BmChar(this.id, this.x, this.y, this.w, this.h, this.xOff, this.yOff, this.xAdv);
  final int id, x, y, w, h, xOff, yOff, xAdv;
}

class BmFont {
  BmFont._(this.atlas, this.chars, this.lineHeight, this.charSpace);
  final ui.Image atlas;
  final Map<int, BmChar> chars;
  final int lineHeight;
  final double charSpace; // tuong duong charSpace trong SysTemFont

  /// Parse .fnt dang TEXT (AngelCode BMFont). Ho tro common + char blocks.
  static Future<BmFont> load(
    String fntPath,
    Future<ui.Image> Function(String imagePath) loadAtlas,
  ) async {
    final fntSource = await _readAssetString(fntPath);
    return parse(fntSource, await loadAtlas(_imagePathOf(fntPath, fntSource)));
  }

  static Future<String> _readAssetString(String path) async =>
      throw UnimplementedError('inject AssetBundle: rootBundle.loadString(path)');

  static String _imagePathOf(String fntPath, String source) {
    final m = RegExp(r'^page id=\d+ file="([^"]+)"', multiLine: true).firstMatch(source);
    final file = m?.group(1) ?? 'big.png';
    final dir = fntPath.substring(0, fntPath.lastIndexOf('/'));
    return '$dir/$file';
  }

  static BmFont parse(String source, ui.Image atlas) {
    var lineHeight = 12;
    var charSpace = 2.0;
    final chars = <int, BmChar>{};
    for (final line in source.split('\n')) {
      if (line.startsWith('common ')) {
        final h = RegExp(r'lineHeight=(\d+)').firstMatch(line);
        if (h != null) lineHeight = int.parse(h.group(1)!);
      } else if (line.startsWith('char ')) {
        int v(String k) => int.parse(RegExp('$k=(-?\\d+)').firstMatch(line)!.group(1)!);
        final c = BmChar(v('id'), v('x'), v('y'), v('width'), v('height'),
            v('xoffset'), v('yoffset'), v('xadvance'));
        chars[c.id] = c;
      }
    }
    return BmFont._(atlas, chars, lineHeight, charSpace);
  }

  /// SysTemFont.getWidth: cong xadvance tung ky tu + charSpace.
  int getWidth(String s) {
    var w = 0.0;
    for (final ch in s.codeUnits) {
      w += (chars[ch]?.xAdv ?? chars[32]?.xAdv ?? 4) + charSpace;
    }
    return w.round();
  }

  /// SysTemFont.drawString voi align LEFT(0)/CENTER(2 tuong ung anchor giua).
  void drawString(ui.Canvas canvas, String s, double x, double y, int align) {
    var cx = x;
    if (align == 2) cx -= getWidth(s) / 2;
    if (align == 1) cx -= getWidth(s).toDouble(); // RIGHT
    for (final ch in s.codeUnits) {
      final c = chars[ch];
      if (c != null && c.w > 0 && c.h > 0) {
        canvas.drawImageRect(
          atlas,
          ui.Rect.fromLTWH(c.x.toDouble(), c.y.toDouble(), c.w.toDouble(), c.h.toDouble()),
          ui.Rect.fromLTWH(cx + c.xOff, y + c.yOff, c.w.toDouble(), c.h.toDouble()),
          ui.Paint(),
        );
        cx += c.xAdv + charSpace;
      } else {
        cx += (chars[32]?.xAdv ?? 4) + charSpace;
      }
    }
  }
}
```

### `D:\personal\army/lib\core\assets\file_pack_decoder.dart`
```dart
import 'dart:typed_data';
import 'dart:ui' as ui;

/// Port chính xác `model/FilePack.java` của bản gốc LibGDX.
///
/// Các file res/gui/gui, res/item/item, res/effect/effect, res/map/bg
/// (và res/item/delete) đều là FilePack: archive gồm nhiều PNG nhỏ đặt cạnh
/// nhau, header lưu tên file, mọi thứ XOR với key chuỗi "NguyenVanMinh".
///
/// Định dạng (theo đúng FilePack.java):
///   [1 byte]  nFile                    -> RAW (encode(int) la identity)
///   lap nFile lan:
///     [1 byte]  lname                  -> RAW
///     [lname]   filename               -> XOR key
///     [2 bytes] flen (big-endian)      -> RAW
///   [con lai] fullData                 -> XOR key (tu dau key)
///
/// Cach dung dung nhu Explosion.java / Smoke.java:
///   final pack = FilePack.decode(await rootBundle.load('assets/res/effect/effect').then(...));
///   final img = await pack.loadImage('ex3.png');
abstract final class FilePackDecoder {
  static const List<int> _key = <int>[
    78, 103, 117, 121, 101, 110, 86, 97, 110, 77, 105, 110, 104, // "NguyenVanMinh"
  ];

  static Uint8List _unxor(Uint8List data) {
    final out = Uint8List(data.length);
    for (var i = 0; i < data.length; i++) {
      out[i] = data[i] ^ _key[i % _key.length];
    }
    return out;
  }

  static FilePack decode(Uint8List data) {
    var pos = 0;
    int u8() => data[pos++];
    int u16() {
      final v = (data[pos] << 8) | data[pos + 1];
      pos += 2;
      return v;
    }

    final nFile = u8(); // RAW
    final names = <String>[];
    final lens = <int>[];
    for (var i = 0; i < nFile; i++) {
      final lname = u8(); // RAW
      final nameBytes = _unxor(data.sublist(pos, pos + lname)); // XOR
      pos += lname;
      names.add(String.fromCharCodes(nameBytes));
      lens.add(u16()); // RAW
    }
    final fullData = _unxor(data.sublist(pos));
    final files = <String, Uint8List>{};
    var off = 0;
    for (var i = 0; i < nFile; i++) {
      files[names[i]] = Uint8List.fromList(fullData.sublist(off, off + lens[i]));
      off += lens[i];
    }
    return FilePack(files);
  }
}

class FilePack {
  FilePack(this.files);
  final Map<String, Uint8List> files;

  List<String> get names => files.keys.toList(growable: false);

  /// mImage.createImage(byte[], offset, len) -> Texture -> ui.Image
  Future<ui.Image> loadImage(String name) async {
    final png = files[name];
    if (png == null) throw StateError('FilePack: khong co file "$name"');
    final codec = await ui.instantiateImageCodec(png);
    return (await codec.getNextFrame()).image;
  }
}
```

### `D:\personal\army/lib\core\assets\game_asset_bundle.dart`
```dart
import 'package:flutter/services.dart';
import 'package:mobiarmy_flutter/core/assets/asset_manifest.dart';

class MissingGameAssetException implements Exception {
  const MissingGameAssetException(this.assetId);
  final String assetId;
  @override
  String toString() => 'MissingGameAssetException: $assetId';
}

class GameAssetBundle {
  GameAssetBundle(this.bundle);
  final AssetBundle bundle;
  Future<GameAssetManifest> loadManifest(String path) async =>
      GameAssetManifest.fromJsonString(await bundle.loadString(path));
  Future<ByteData> loadAvailable(GameAssetEntry entry) {
    if (!entry.available) throw MissingGameAssetException(entry.id);
    return bundle.load(entry.path);
  }
}
```

### `D:\personal\army/lib\core\assets\game_asset_loader.dart`
```dart
import 'dart:ui' as ui;
import 'package:flutter/services.dart' show rootBundle;
import 'bmfont.dart';
import 'file_pack_decoder.dart';

/// Trung tam load asset goc MobiArmy2.
/// NOTE: asset cua project dat THANG o assets/ (assets/gui/gui, assets/effect/...)
/// chung toi khong cong 'res/' vao prefix.
class GameAssets {
  GameAssets._();

  static const kPrefix = 'assets/';
  static FilePack? gui, item, effect, mapBg;
  static final Map<String, ui.Image> looseImages = {};
  static BmFont? fontBig, fontMini;
  static bool _loaded = false;
  static bool get isLoaded => _loaded;

  static Future<FilePack?> _tryPack(String path) async {
    try {
      final bytes = await rootBundle.load('$kPrefix$path');
      return FilePackDecoder.decode(bytes.buffer.asUint8List());
    } catch (_) {
      return null;
    }
  }

  static Future<void> load() async {
    if (_loaded) return;
    gui = await _tryPack('gui/gui');
    item = await _tryPack('item/item');
    effect = await _tryPack('effect/effect');
    mapBg = await _tryPack('map/bg');

    const looseNames = [
      'coin', 'cup', 'kim', 'wind', 'wind2', 'mua', 'tuyet', 'icon',
      'iconChat', 'iconcam', 'iconmenu', 'remember', 'lever-up', 'er',
      'tick0', 'tick1', 'v', 'x', 'vong', 'vong_tron', 'arrow', 'randomMap',
    ];
    for (final n in looseNames) {
      try {
        final bd = await rootBundle.load('$kPrefix$n.png');
        final codec = await ui.instantiateImageCodec(bd.buffer.asUint8List());
        looseImages[n] = (await codec.getNextFrame()).image;
      } catch (_) {}
    }

    // Font: thu FontSys roi x1/font. KHONG throw neu thieu — dung null font.
    fontBig = await _tryFont('FontSys/x1/big');
    fontBig ??= await _tryFont('x1/font/big');
    fontMini = await _tryFont('FontSys/x1/mini');
    fontMini ??= await _tryFont('x1/font/mini') ?? fontBig;

    _loaded = true;
  }

  static Future<BmFont?> _tryFont(String base) async {
    try {
      return await BmFont.load(
        kPrefix + base + '.fnt',
        (path) async {
          final bd = await rootBundle.load(path);
          final codec = await ui.instantiateImageCodec(bd.buffer.asUint8List());
          return (await codec.getNextFrame()).image;
        },
      );
    } catch (_) {
      return null;
    }
  }

  static ui.Image? loose(String name) => looseImages[name];
}
```

### `D:\personal\army/lib\core\assets\legacy_rms.dart`
```dart
import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/services.dart' show rootBundle;
import 'package:path_provider/path_provider.dart';

/// Port CLib/RMS + CRes.loadRMSData/saveRMSInt:
///   moi record = 1 file nguyen trang trong thu muc rms/.
///   saveRmsInt viet 1 byte; loadInt doc SBYTE, thieu = -1.
///   saveString/loadString: UTF-8 (caroun, caropass, ...).
/// Record quan trong cua game goc (giu NGUYEN ten):
///   bigImage0..9  - cache anh nen lon tai tu server
///   equipdata2/icondata2/levelCData2/playerdata2/valuesdata2 + *version2
///   ipArmy2       - danh sach server (byte n + [UTF][UTF][short]*n)
///   caroun/caropass - tai khoan "nho dang nhap"
///   sound         - INT 0..100 volume; vibrate - sbyte 0/1
abstract final class LegacyRms {
  static Directory? _root;

  static Future<Directory> _dir() async {
    if (_root != null) return _root!;
    final docs = await getApplicationDocumentsDirectory();
    final d = Directory('${docs.path}/rms');
    if (!d.existsSync()) d.createSync(recursive: true);
    return _root = d;
  }

  static Future<void> seedFromBundle(List<String> files) async {
    final root = await _dir();
    for (final name in files) {
      final target = File('${root.path}/$name');
      if (target.existsSync()) continue;
      try {
        final data = await rootBundle.load('assets/rms/$name');
        target.writeAsBytesSync(data.buffer.asUint8List());
      } catch (_) {}
    }
  }

  static Future<Uint8List?> load(String filename) async {
    final f = File('${(await _dir()).path}/$filename');
    return f.existsSync() ? f.readAsBytesSync() : null;
  }

  static Future<int> loadInt(String filename) async {
    final b = await load(filename);
    if (b == null || b.isEmpty) return -1;
    return b[0] > 127 ? b[0] - 256 : b[0];
  }

  static Future<void> save(String filename, List<int> data) async =>
      File('${(await _dir()).path}/$filename').writeAsBytes(data);

  static Future<void> saveRmsInt(String filename, int x) =>
      save(filename, <int>[x & 0xFF]);

  static Future<String?> loadString(String filename) async {
    final b = await load(filename);
    return b == null ? null : utf8.decode(b);
  }

  static Future<void> saveString(String filename, String s) =>
      save(filename, utf8.encode(s));

  static Future<void> clear(String filename) async {
    final f = File('${(await _dir()).path}/$filename');
    if (f.existsSync()) f.deleteSync();
  }
}
```

### `D:\personal\army/lib\core\assets\legacy_sound.dart`
```dart
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
```

### `D:\personal\army/lib\core\assets\map_asset_repository.dart`
```dart
import 'package:mobiarmy_flutter/core/assets/asset_manifest.dart';

class MapAssetRepository {
  MapAssetRepository(this.manifest);
  final GameAssetManifest manifest;
  GameAssetEntry definition(String id) {
    final entry = manifest.assets[id];
    if (entry == null || entry.kind != GameAssetKind.map) {
      throw StateError('Unknown map asset: $id');
    }
    return entry;
  }
}
```

### `D:\personal\army/lib\core\assets\sprite_atlas_repository.dart`
```dart
import 'dart:ui';
import 'package:flame/components.dart';
import 'package:mobiarmy_flutter/core/assets/asset_manifest.dart';

class SpriteAtlasRepository {
  SpriteAtlasRepository(this.manifest);
  final GameAssetManifest manifest;
  final Map<String, Image> _images = {};
  Sprite frame(String atlasId, String frameName) {
    final atlas = manifest.atlases[atlasId];
    if (atlas == null) throw StateError('Unknown atlas: $atlasId');
    final image = _images[atlasId];
    if (image == null) throw StateError('Atlas not loaded: $atlasId');
    AtlasFrame? frame;
    for (final candidate in atlas.frames) {
      if (candidate.name == frameName) {
        frame = candidate;
        break;
      }
    }
    if (frame == null) throw StateError('Unknown frame: $atlasId/$frameName');
    return Sprite(
      image,
      srcPosition: Vector2(frame.x.toDouble(), frame.y.toDouble()),
      srcSize: Vector2(frame.width.toDouble(), frame.height.toDouble()),
    );
  }

  void registerImage(String atlasId, Image image) => _images[atlasId] = image;
  void unload(String atlasId) => _images.remove(atlasId)?.dispose();
  void dispose() {
    for (final image in _images.values) {
      image.dispose();
    }
    _images.clear();
  }
}
```

### `D:\personal\army/lib\core\config\app_config.dart`
```dart
class AppConfig {
  const AppConfig({this.debug = false, this.enableDiagnostics = false});
  final bool debug;
  final bool enableDiagnostics;
}
```

### `D:\personal\army/lib\core\diagnostics\app_logger.dart`
```dart
import 'package:logging/logging.dart';

void configureLogging({required bool debug}) {
  hierarchicalLoggingEnabled = true;
  Logger.root.level = debug ? Level.ALL : Level.INFO;
  Logger.root.onRecord.listen((record) {
    // Replace with an injected log sink before production telemetry is added.
  });
}
```

### `D:\personal\army/lib\core\errors\app_error_boundary.dart`
```dart
import 'package:flutter/material.dart';

class AppErrorBoundary extends StatefulWidget {
  const AppErrorBoundary({required this.child, super.key});
  final Widget child;
  @override
  State<AppErrorBoundary> createState() => _AppErrorBoundaryState();
}

class _AppErrorBoundaryState extends State<AppErrorBoundary> {
  @override
  void initState() {
    super.initState();
    ErrorWidget.builder = (details) => Material(
      color: const Color(0xFF111827),
      child: Center(
        child: Text(
          'Unexpected UI error\n${details.exceptionAsString()}',
          textAlign: TextAlign.center,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) => widget.child;
}
```

### `D:\personal\army/lib\core\legacy_math\fixed_point.dart`
```dart
abstract final class JavaInt32 {
  static const int minValue = -0x80000000;
  static const int maxValue = 0x7fffffff;
  static const int mask = 0xffffffff;

  static int wrap(int value) {
    final unsigned = value & mask;
    return unsigned >= 0x80000000 ? unsigned - 0x100000000 : unsigned;
  }

  static int add(int a, int b) => wrap(a + b);
  static int subtract(int a, int b) => wrap(a - b);
  static int multiply(int a, int b) => wrap(a * b);
  static int shiftLeft(int value, int bits) => wrap(value << (bits & 0x1f));
  static int divide(int dividend, int divisor) {
    if (divisor == 0) throw UnsupportedError('Integer division by zero');
    if (dividend == minValue && divisor == -1) return minValue;
    return dividend ~/ divisor;
  }

  static int remainder(int dividend, int divisor) =>
      dividend - divide(dividend, divisor) * divisor;
}

class LegacyFixedPoint {
  const LegacyFixedPoint._();
  static const int trigonometryShift = 10;
  static const int one = 1 << trigonometryShift;
  static int multiplyQ10(int a, int b) =>
      JavaInt32.wrap(JavaInt32.multiply(a, b) >> trigonometryShift);
  static int divideQ10(int numerator, int denominator) => JavaInt32.divide(
    JavaInt32.shiftLeft(numerator, trigonometryShift),
    denominator,
  );
}
```

### `D:\personal\army/lib\core\legacy_math\legacy_angle.dart`
```dart
import 'dart:math' as math;
import 'package:mobiarmy_flutter/core/legacy_math/fixed_point.dart';
import 'package:mobiarmy_flutter/core/legacy_math/legacy_trigonometry.dart';

abstract final class LegacyAngle {
  /// Exact CRes.fixangle behavior. It adjusts only once and is intentionally
  /// not a general modulo normalization function.
  static int fixOnce(int angle) {
    var result = angle;
    if (result >= 360) result -= 360;
    if (result < 0) result += 360;
    return result;
  }

  static int normalized(int angle) {
    final value = JavaInt32.remainder(angle, 360);
    return value < 0 ? value + 360 : value;
  }

  static int difference(int from, int to) {
    final value = to - from;
    if (value < -180) return value + 360;
    return value > 180 ? value - 360 : value;
  }

  static int fromDelta(int dx, int dy) {
    int angle;
    if (dx != 0) {
      final shifted = JavaInt32.shiftLeft(dy, 10);
      final tangent = JavaInt32.divide(shifted, dx).abs();
      angle = LegacyTrigonometry.atan(tangent);
      if (dy >= 0 && dx < 0) angle = 180 - angle;
      if (dy < 0 && dx < 0) angle += 180;
      if (dy < 0 && dx >= 0) angle = 360 - angle;
    } else {
      angle = dy > 0 ? 90 : 270;
    }
    return angle;
  }

  static int myAngle(int dx, int dy) {
    var value = fromDelta(dx, dy);
    if (value >= 315) value = 360 - value;
    return value;
  }

  static double uiRadians(int degrees) => degrees * math.pi / 180.0;
}
```

### `D:\personal\army/lib\core\legacy_math\legacy_collision_math.dart`
```dart
import 'package:mobiarmy_flutter/core/legacy_math/fixed_point.dart';

abstract final class LegacyCollisionMath {
  static bool isLand(int argb) => (argb & 0xff000000) != 0;

  static bool pointInRect(
    int x,
    int y,
    int left,
    int top,
    int width,
    int height,
  ) => x >= left && x < left + width && y >= top && y < top + height;

  static bool rectanglesHit(
    int x,
    int y,
    int width,
    int height,
    int targetX,
    int targetY,
    int targetWidth,
    int targetHeight,
  ) =>
      x + width >= targetX &&
      x <= targetX + targetWidth &&
      y + height >= targetY &&
      y <= targetY + targetHeight;

  static int integerSqrt(int value) {
    if (value <= 0) return 0;
    var x = JavaInt32.divide(JavaInt32.add(value, 1), 2);
    int previous;
    do {
      previous = x;
      x = JavaInt32.add(
        JavaInt32.divide(x, 2),
        JavaInt32.divide(value, JavaInt32.multiply(2, x)),
      );
    } while ((previous - x).abs() > 1);
    return x;
  }

  static int distance(int x1, int y1, int x2, int y2) {
    final dx = JavaInt32.subtract(x1, x2);
    final dy = JavaInt32.subtract(y1, y2);
    final squared = JavaInt32.add(
      JavaInt32.multiply(dx, dx),
      JavaInt32.multiply(dy, dy),
    );
    return integerSqrt(squared);
  }
}
```

### `D:\personal\army/lib\core\legacy_math\legacy_interpolation.dart`
```dart
abstract final class LegacyInterpolation {
  static double lerp(double start, double end, double time) =>
      start + time * (end - start);
  static double clamp01(double value) =>
      value < 0 ? 0 : (value > 1 ? 1 : value);
  static int clampInt(int value, int min, int max) =>
      value < min ? min : (value > max ? max : value);
}
```

### `D:\personal\army/lib\core\legacy_math\legacy_position.dart`
```dart
class LegacyPosition {
  const LegacyPosition.xy(this.x, this.y)
    : xFrom = 0,
      yFrom = 0,
      xTo = 0,
      yTo = 0,
      frame = 0;
  const LegacyPosition.xyFrame(this.x, this.y, this.frame)
    : xFrom = 0,
      yFrom = 0,
      xTo = 0,
      yTo = 0;
  const LegacyPosition.transition(this.xFrom, this.yFrom, this.xTo, this.yTo)
    : x = 0,
      y = 0,
      frame = 0;
  final int x, y, xFrom, yFrom, xTo, yTo, frame;
}
```

### `D:\personal\army/lib\core\legacy_math\legacy_random.dart`
```dart
import 'dart:math';
import 'package:mobiarmy_flutter/core/legacy_math/fixed_point.dart';

class LegacyRandom {
  LegacyRandom([Random? random]) : _random = random ?? Random();
  final Random _random;

  int between(int minInclusive, int maxExclusive) =>
      minInclusive + _random.nextInt(maxExclusive - minInclusive);

  /// Mirrors Java `nextInt() % bound`, including negative results.
  int signedRemainder(int bound) {
    final high = _random.nextInt(1 << 16);
    final low = _random.nextInt(1 << 16);
    final value = JavaInt32.wrap((high << 16) | low);
    return JavaInt32.remainder(value, bound);
  }
}
```

### `D:\personal\army/lib\core\legacy_math\legacy_trigonometry.dart`
```dart
import 'package:mobiarmy_flutter/core/legacy_math/fixed_point.dart';

abstract final class LegacyTrigonometry {
  static int _fixOnce(int angle) {
    var result = angle;
    if (result >= 360) result -= 360;
    if (result < 0) result += 360;
    return result;
  }

  static const List<int> _sinTable = <int>[
    0,
    18,
    36,
    54,
    71,
    89,
    107,
    125,
    143,
    160,
    178,
    195,
    213,
    230,
    248,
    265,
    282,
    299,
    316,
    333,
    350,
    367,
    384,
    400,
    416,
    433,
    449,
    465,
    481,
    496,
    512,
    527,
    543,
    558,
    573,
    587,
    602,
    616,
    630,
    644,
    658,
    672,
    685,
    698,
    711,
    724,
    737,
    749,
    761,
    773,
    784,
    796,
    807,
    818,
    828,
    839,
    849,
    859,
    868,
    878,
    887,
    896,
    904,
    912,
    920,
    928,
    935,
    943,
    949,
    956,
    962,
    968,
    974,
    979,
    984,
    989,
    994,
    998,
    1002,
    1005,
    1008,
    1011,
    1014,
    1016,
    1018,
    1020,
    1022,
    1023,
    1023,
    1024,
    1024,
  ];
  static final List<int> _cosTable = List<int>.generate(
    91,
    (i) => _sinTable[90 - i],
    growable: false,
  );
  static final List<int> _tanTable = List<int>.generate(91, (i) {
    final cosine = _cosTable[i];
    return cosine == 0
        ? JavaInt32.maxValue
        : JavaInt32.divide(JavaInt32.shiftLeft(_sinTable[i], 10), cosine);
  }, growable: false);

  static int sin(int angle) {
    final a = _fixOnce(angle);
    if (a >= 0 && a < 90) return _sinTable[a];
    if (a >= 90 && a < 180) return _sinTable[180 - a];
    if (a >= 180 && a < 270) return -_sinTable[a - 180];
    return -_sinTable[360 - a];
  }

  static int cos(int angle) {
    final a = _fixOnce(angle);
    if (a >= 0 && a < 90) return _cosTable[a];
    if (a >= 90 && a < 180) return -_cosTable[180 - a];
    if (a >= 180 && a < 270) return -_cosTable[a - 180];
    return _cosTable[360 - a];
  }

  static int tan(int angle) {
    final a = _fixOnce(angle);
    if (a >= 0 && a < 90) return _tanTable[a];
    if (a >= 90 && a < 180) return -_tanTable[180 - a];
    if (a >= 180 && a < 270) return _tanTable[a - 180];
    return -_tanTable[360 - a];
  }

  static int atan(int tangent) {
    for (var i = 0; i <= 90; i++) {
      if (_tanTable[i] >= tangent) return i;
    }
    return 0;
  }
}
```

### `D:\personal\army/lib\core\network\codec\byte_reader.dart`
```dart
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
```

### `D:\personal\army/lib\core\network\codec\byte_writer.dart`
```dart
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
```

### `D:\personal\army/lib\core\network\command\commands.dart`
```dart
abstract final class Commands {
  static const int login = 1;
  static const int register = 2;
  static const int loadInfoAll = 3;
  static const int messageTo = 5;
  static const int roomList = 6;
  static const int roomWaitList = 7;
  static const int joinRoomWait = 8;
  static const int chat = 9;
  static const int kick = 11;
  static const int leaveRoomWait = 15;
  static const int ready = 16;
  static const int confirm = 17;
  static const int bet = 19;
  static const int startGame = 20;
  static const int move = 21;
  static const int shoot = 22;
  static const int setTurn = 24;
  static const int setWind = 25;
  static const int useItem = 26;
  static const int quickPlay = 28;
  static const int friendList = 29;
  static const int addFriend = 32;
  static const int deleteFriend = 33;
  static const int userInfo = 34;
  static const int findUser = 36;
  static const int ping = 42;
  static const int log =
      45; // SessionHandler.log — server notice / auth failure
  static const int skipTurn = 49;
  static const int setXy = 53;
  static const int dynamicSync = 90;
  static const int idNotCollision = 92;
  static const int changeTeam = 71;
  static const int buyItem = 72;
  static const int buyGlass = 74;
  static const int selectMap = 75;
  static const int getKey = -27;
  static const int requestRenewal = -25;
  static const int missions = -23;
  static const int roomInfoNames = -19;
  static const int topInfo = -14;
  static const int quit = -4;
  static const int shopSpecial = -3;
  static const int setEquipVip = -2;
}
```

### `D:\personal\army/lib\core\network\connection_lifecycle.dart`
```dart
abstract interface class ConnectionLifecycle {
  void onBackground();
  void onForeground();
  Future<void> dispose();
}

class NoopConnectionLifecycle implements ConnectionLifecycle {
  @override
  void onBackground() {}
  @override
  void onForeground() {}
  @override
  Future<void> dispose() async {}
}
```

### `D:\personal\army/lib\core\network\data_cache_parsers.dart`
```dart
import 'dart:typed_data';
import 'package:mobiarmy_flutter/core/network/codec/byte_reader.dart';

/// Port CCanvas.readMess(data, command) — parse cac record cache tu server:
///   command 0 (valuesdata2): danh sach map — MM.mapFiles + MM.mapName
///   command 1 (equipdata2) : cay trang bi — EquipGlass/TypeEquip/Equip
///   command 2 (levelCData2): danh hieu level
///
/// Du lieu equip/atlas tu server se gan vao render qua EquipAnchor.
class MapFileEntry {
  MapFileEntry(this.fileId, this.data, this.values, this.name, this.fileName);
  final int fileId;
  final Uint8List data;       // fData — binary map (MapFile format)
  final List<int> values;     // 5 short: bg, mapAddY, bullEffShower, inWaterAddY, cl2AddY
  final String name;
  final String fileName;
}

class EquipFrameData {
  EquipFrameData(this.x, this.y, this.w, this.h, this.dx, this.dy);
  final int x, y, w, h, dx, dy;
}

class EquipEntry {
  EquipEntry({
    required this.id, required this.type, required this.glass,
    required this.bullet, required this.icon, required this.level,
    required this.frames, required this.invAbility, required this.invPercen,
  });
  final int id, type, glass, bullet, icon, level;
  final List<EquipFrameData> frames; // 6 frame
  final List<int> invAbility;        // 5
  final List<int> invPercen;         // 5
}

class DataCache {
  DataCache._();
  static final List<MapFileEntry> mapFiles = [];
  static final List<String> mapNames = [];
  static List<EquipEntry> equips = [];
  static List<String> levelCaptions = [];
  static List<int> levelCaptionTypes = [];
}

abstract final class DataCacheParsers {
  /// readMess(data, 0): MM maps
  static void parseMapList(Uint8List data) {
    final r = ByteReader(data);
    final n = r.readByte();
    DataCache.mapFiles.clear();
    DataCache.mapNames.clear();
    for (var i = 0; i < n; i++) {
      final fileId = r.readByte();
      final len = r.readUnsignedShort();
      final fData = r.readBytes(len);
      final values = [for (var j = 0; j < 5; j++) r.readShort()];
      final name = r.readUTF();
      final fileName = r.readUTF();
      DataCache.mapFiles.add(MapFileEntry(fileId, fData, values, name, fileName));
      DataCache.mapNames.add(name);
    }
  }

  /// readMess(data, 1): PlayerEquip tree. Icon image + 10 bullet PNG nam SAU
  /// trong cung message (iconImg: short len + bytes; bullets: 10 x short len + bytes).
  static void parseEquipTree(Uint8List data) {
    final r = ByteReader(data);
    DataCache.equips = [];
    final nGlass = r.readByte();
    for (var g = 0; g < nGlass; g++) {
      final glassId = r.readByte();
      r.readShort(); // maxDamage
      final nType = r.readByte();
      for (var t = 0; t < nType; t++) {
        final type = r.readByte();
        final nEquip = r.readByte();
        for (var e = 0; e < nEquip; e++) {
          final id = r.readShort();
          var bullet = -1;
          if (type == 0) bullet = r.readByte();
          final icon = r.readShort();
          final level = r.readByte();
          final frames = <EquipFrameData>[];
          for (var k = 0; k < 6; k++) {
            frames.add(EquipFrameData(
              r.readShort(), r.readShort(), r.readByte(), r.readByte(),
              r.readByte(), r.readByte(),
            ));
          }
          final ability = <int>[for (var b = 0; b < 10; b++) r.readByte()];
          DataCache.equips.add(EquipEntry(
            id: id, type: type, glass: glassId, bullet: bullet,
            icon: icon, level: level, frames: frames,
            invAbility: [ability[0], ability[2], ability[4], ability[6], ability[8]],
            invPercen: [ability[1], ability[3], ability[5], ability[7], ability[9]],
          ));
        }
      }
    }
    // iconImg + bullets: duoc tach boi caller (can decode PNG qua FilePack path khac)
  }

  /// readMess(data, 2): level captions
  static void parseLevelCaptions(Uint8List data) {
    final r = ByteReader(data);
    final n = r.readByte();
    DataCache.levelCaptions = [];
    DataCache.levelCaptionTypes = [];
    for (var i = 0; i < n; i++) {
      DataCache.levelCaptions.add(r.readUTF());
      DataCache.levelCaptionTypes.add(r.readUnsignedByte());
    }
  }
}
```

### `D:\personal\army/lib\core\network\data_sync_service.dart`
```dart
import 'dart:async';
import 'package:logging/logging.dart';
import 'package:mobiarmy_flutter/core/assets/legacy_rms.dart';
import 'package:mobiarmy_flutter/core/network/command/commands.dart';
import 'package:mobiarmy_flutter/core/network/dispatcher/message_dispatcher.dart';
import 'package:mobiarmy_flutter/core/network/protocol/message.dart';
import 'package:mobiarmy_flutter/core/network/transport/tcp_session.dart';
import 'data_cache_parsers.dart';

/// Port CCanvas.sendMapData + MessageHandler case 90 (dynamicSync):
/// Chuoi dong bo du lieu theo cap, MỖI goi tu server kich hoat goi tiep theo:
///   login -> sendVersion(2, valuesVersion)
///   cmd90 type 2 (values) -> luu + readMess(0) -> sendVersion(1, tileVersion)
///   cmd90 type 1 (icon)   -> luu -> sendVersion(3, iconVersion)
///   cmd90 type 3 (player) -> luu + CPlayer.init -> sendVersion(4, equipVersion)
///   cmd90 type 4 (equip)  -> luu + readMess(1) -> sendVersion(5, levelCVersion)
///   cmd90 type 5 (levelC) -> luu + readMess(2) -> HOAN TAT -> vao lobby
class DataSyncService {
  DataSyncService(this._session, this._dispatcher) {
    _dispatcher.register(Commands.dynamicSync, _onDynamicSync);
  }

  final TcpSession _session;
  final MessageDispatcher _dispatcher;
  final _logger = Logger('DataSyncService');
  final _completer = Completer<void>();
  final int _tileMapVersion = 0;
  int _iconVersion = 0, _valuesVersion = 0,
      _playerVersion = 0, _equipVersion = 0, _levelCVersion = 0;

  Future<void> get done => _completer.future;

  /// CCanvas.sendMapData()
  Future<void> start() async {
    _iconVersion = await LegacyRms.loadInt('iconversion2');
    if (_iconVersion < 0) _iconVersion = 0;
    _valuesVersion = await LegacyRms.loadInt('valuesversion2');
    if (_valuesVersion < 0) _valuesVersion = 0;
    _playerVersion = await LegacyRms.loadInt('playerVersion2');
    if (_playerVersion < 0) _playerVersion = 0;
    _equipVersion = await LegacyRms.loadInt('equipVersion2');
    if (_equipVersion < 0) _equipVersion = 0;
    _levelCVersion = await LegacyRms.loadInt('levelCVersion2');
    if (_levelCVersion < 0) _levelCVersion = 0;

    // Cache cu parse lai ngay (giong CCanvas.sendMapData doc RMS local)
    final valuesCached = await LegacyRms.load('valuesdata2');
    if (valuesCached != null) DataCacheParsers.parseMapList(valuesCached);
    final equipCached = await LegacyRms.load('equipdata2');
    if (equipCached != null) DataCacheParsers.parseEquipTree(equipCached);
    final levelCached = await LegacyRms.load('levelCData2');
    if (levelCached != null) DataCacheParsers.parseLevelCaptions(levelCached);

    await _sendVersion(2, _valuesVersion);
  }

  void _onDynamicSync(Message msg) {
    final r = msg.reader();
    final type = r.readByte();
    switch (type) {
      case 2: // values
        final v = r.readByte();
        if (v != _valuesVersion) {
          final len = r.readUnsignedShort();
          final data = r.readBytes(len);
          DataCacheParsers.parseMapList(data);
          LegacyRms.save('valuesdata2', data);
          LegacyRms.saveRmsInt('valuesversion2', v);
          _valuesVersion = v;
        }
        _sendVersion(1, _tileMapVersion);
        break;
      case 1: // icon
        final v = r.readByte();
        if (v != _iconVersion) {
          final len = r.readUnsignedShort();
          final data = r.readBytes(len);
          // PrepareScr.fileData = data; PrepareScr.init() — icon atlas
          LegacyRms.save('icondata2', data);
          LegacyRms.saveRmsInt('iconversion2', v);
          _iconVersion = v;
        }
        _sendVersion(3, _iconVersion);
        break;
      case 3: // player
        final v = r.readByte();
        if (v != _playerVersion) {
          final len = r.readUnsignedShort();
          final data = r.readBytes(len);
          // CPlayer.fileData -> init body sprites
          LegacyRms.save('playerdata2', data);
          LegacyRms.saveRmsInt('playerVersion2', v);
          _playerVersion = v;
        }
        _sendVersion(4, _equipVersion);
        break;
      case 4: // equip
        final v = r.readByte();
        if (v != _equipVersion) {
          final len = r.readInt();
          final data = r.readBytes(len);
          DataCacheParsers.parseEquipTree(data);
          LegacyRms.save('equipdata2', data);
          LegacyRms.saveRmsInt('equipVersion2', v);
          _equipVersion = v;
        }
        _sendVersion(5, _levelCVersion);
        break;
      case 5: // level captions
        final v = r.readByte();
        if (v != _levelCVersion) {
          final len = r.readUnsignedShort();
          final data = r.readBytes(len);
          DataCacheParsers.parseLevelCaptions(data);
          LegacyRms.save('levelCData2', data);
          LegacyRms.saveRmsInt('levelCVersion2', v);
          _levelCVersion = v;
        }
        _logger.info('Data sync HOAN TAT');
        if (!_completer.isCompleted) _completer.complete();
        break;
    }
  }

  /// GameService.sendVersion(type, version) — cmd 90
  Future<void> _sendVersion(int type, int version) {
    final m = Message(Commands.dynamicSync);
    m.writer().writeByte(type);
    m.writer().writeByte(version);
    return _session.sendMessage(m);
  }
}
```

### `D:\personal\army/lib\core\network\dispatcher\message_dispatcher.dart`
```dart
import '../protocol/message.dart';

typedef MessageHandler = void Function(Message message);

class MessageDispatcher {
  final Map<int, List<MessageHandler>> _handlers = {};

  void register(int command, MessageHandler handler) {
    _handlers.putIfAbsent(command, () => []).add(handler);
  }

  void unregister(int command, MessageHandler handler) {
    _handlers[command]?.remove(handler);
  }

  void dispatch(Message message) {
    final handlers = _handlers[message.command];
    if (handlers != null) {
      for (final handler in handlers) {
        handler(message);
      }
    }
  }
}
```

### `D:\personal\army/lib\core\network\network_provider.dart`
```dart
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mobiarmy_flutter/core/network/transport/session_state_listener.dart';
import 'dispatcher/message_dispatcher.dart';
import 'transport/tcp_session.dart';

final messageDispatcherProvider = Provider<MessageDispatcher>((ref) {
  return MessageDispatcher();
});

final sessionListenerHolderProvider = Provider<SessionListenerHolder>((ref) {
  return SessionListenerHolder();
});

final tcpSessionProvider = Provider<TcpSession>((ref) {
  final dispatcher = ref.watch(messageDispatcherProvider);
  final listener = ref.watch(sessionListenerHolderProvider);
  return TcpSession(dispatcher, listener: listener);
});

final connectionStateProvider = NotifierProvider<ConnectionStateNotifier, bool>(
  ConnectionStateNotifier.new,
);

class ConnectionStateNotifier extends Notifier<bool> {
  @override
  bool build() => false;
}
```

### `D:\personal\army/lib\core\network\ping_heartbeat.dart`
```dart
import 'dart:async';
import 'package:mobiarmy_flutter/core/network/command/commands.dart';
import 'package:mobiarmy_flutter/core/network/protocol/message.dart';
import 'package:mobiarmy_flutter/core/network/transport/tcp_session.dart';

/// Port CCanvas.update: moi 50 gameTick gui ping(cmd 42, writeShort(gameTick),
/// writeLong(-1)) — giu ket noi, server do luon latency.
class PingHeartbeat {
  PingHeartbeat(this._session);
  final TcpSession _session;
  Timer? _timer;
  int _tick = 0;

  void start() {
    _timer?.cancel();
    _timer = Timer.periodic(const Duration(milliseconds: 100), (_) async {
      _tick += 5; // 100ms x 5 = 500ms ~ 50 tick o 10ms/tick cua ban goc
      if (!_session.isConnected) return;
      final m = Message(Commands.ping);
      m.writer().writeShort(_tick);
      m.writer().writeLong(-1);
      await _session.sendMessage(m);
    });
  }

  void stop() => _timer?.cancel();
}
```

### `D:\personal\army/lib\core\network\protocol\message.dart`
```dart
import 'dart:typed_data';
import '../codec/byte_reader.dart';
import '../codec/byte_writer.dart';

class Message {
  final int command;
  late final ByteReader _reader;
  late final ByteWriter _writer;
  final Uint8List? _data;

  Message(this.command) : _data = null {
    _writer = ByteWriter();
  }

  Message.fromBytes(this.command, Uint8List data) : _data = data {
    _reader = ByteReader(data);
  }

  ByteReader reader() {
    if (_data == null) {
      throw StateError('Message was created for writing');
    }
    return _reader;
  }

  ByteWriter writer() {
    if (_data != null) {
      throw StateError('Message was created for reading');
    }
    return _writer;
  }

  Uint8List getData() {
    if (_data != null) return _data;
    return _writer.toBytes();
  }

  @override
  String toString() => 'Message(cmd: $command, len: ${getData().length})';
}
```

### `D:\personal\army/lib\core\network\security\xor_codec.dart`
```dart
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
```

### `D:\personal\army/lib\core\network\transport\session_state_listener.dart`
```dart
/// Transport-level callbacks used by the auth layer.
abstract interface class SessionStateListener {
  /// XOR key message (cmd -27) received — handshake done, encryption active.
  void onHandshakeComplete();

  /// Socket closed (by server, network loss, or local dispose).
  void onDisconnected(String? reason);

  /// Socket error before close.
  void onSocketError(Object error);
}

/// Indirection so TcpSession (created in a Riverpod provider) can forward
/// events to whatever controller currently owns the connection — without a
/// provider dependency cycle.
class SessionListenerHolder implements SessionStateListener {
  SessionStateListener? delegate;

  @override
  void onHandshakeComplete() => delegate?.onHandshakeComplete();

  @override
  void onDisconnected(String? reason) => delegate?.onDisconnected(reason);

  @override
  void onSocketError(Object error) => delegate?.onSocketError(error);
}
```

### `D:\personal\army/lib\core\network\transport\tcp_session.dart`
```dart
import 'dart:async';
import 'dart:io';
import 'dart:typed_data';

import 'package:logging/logging.dart';

import '../codec/byte_reader.dart';
import '../codec/byte_writer.dart';
import '../command/commands.dart';
import '../dispatcher/message_dispatcher.dart';
import '../protocol/message.dart';
import '../security/xor_codec.dart';
import 'session_state_listener.dart';

class TcpSession {
  TcpSession(this.dispatcher, {this.listener});

  final MessageDispatcher dispatcher;
  final SessionStateListener? listener;

  final _logger = Logger('TcpSession');

  Socket? _socket;
  XorCodec? _codec;
  bool _getKeyComplete = false;
  bool _intentionallyClosed = false;

  final BytesBuilder _buffer = BytesBuilder();

  bool get isConnected => _socket != null;

  /// TCP connect + automatic key request (cmd -27).
  ///
  /// PARITY (Session.java): the key response itself travels UNencrypted —
  /// the server marks the session key-initialized only after sending it.
  /// All subsequent bytes in both directions are XORed with the key stream.
  Future<void> connect(String host, int port) async {
    _logger.info('Connecting to $host:$port');
    _intentionallyClosed = false;
    try {
      _socket = await Socket.connect(
        host,
        port,
        timeout: const Duration(seconds: 20),
      );
      _getKeyComplete = false;
      _codec = null;
      _buffer.clear();

      _socket!.listen(
        _onData,
        onError: (Object e) {
          _logger.severe('Socket error: $e');
          listener?.onSocketError(e);
        },
        onDone: () {
          _logger.info('Socket closed');
          final reason = _intentionallyClosed ? null : 'Server đóng kết nối';
          _reset();
          listener?.onDisconnected(reason);
        },
        cancelOnError: true,
      );

      await sendMessage(Message(Commands.getKey));
    } catch (e) {
      _logger.severe('Failed to connect: $e');
      _reset();
      rethrow;
    }
  }

  /// Sends are serialized by the Dart event loop (single isolate); socket.add
  /// preserves ordering, so no extra lock is needed.
  Future<void> sendMessage(Message message) async {
    final socket = _socket;
    if (socket == null) return;

    final data = message.getData();
    final cmd = message.command;
    final size = data.length;

    final writer = ByteWriter();

    if (_getKeyComplete && _codec != null) {
      writer.writeByte(_codec!.encryptByte(cmd));
      writer.writeByte(_codec!.encryptByte((size >> 8) & 0xFF));
      writer.writeByte(_codec!.encryptByte(size & 0xFF));
      for (var b in data) {
        writer.writeByte(_codec!.encryptByte(b));
      }
    } else {
      writer.writeByte(cmd);
      writer.writeShort(size);
      writer.writeBytes(data);
    }

    socket.add(writer.toBytes());
    await socket.flush();
  }

  void _onData(Uint8List data) {
    _buffer.add(data);
    _processBuffer();
  }

  void _processBuffer() {
    while (true) {
      final currentBuffer = _buffer.takeBytes();
      if (currentBuffer.isEmpty) return;

      final reader = ByteReader(currentBuffer);

      try {
        if (reader.available < 1) {
          _buffer.add(currentBuffer);
          return;
        }

        int cmd = reader.readUnsignedByte();
        if (_getKeyComplete && _codec != null) {
          cmd = _codec!.decryptByte(cmd);
        }
        final command = cmd > 127 ? cmd - 256 : cmd;

        int size;
        if (command == -120 || command == Commands.dynamicSync) {
          if (reader.available < 4) {
            _buffer.add(currentBuffer);
            return;
          }
          size = reader.readInt();
        } else {
          if (reader.available < 2) {
            _buffer.add(currentBuffer);
            return;
          }
          var b1 = reader.readUnsignedByte();
          var b2 = reader.readUnsignedByte();
          if (_getKeyComplete && _codec != null) {
            b1 = _codec!.decryptByte(b1);
            b2 = _codec!.decryptByte(b2);
          }
          size = (b1 << 8) | b2;
        }

        if (reader.available < size) {
          _buffer.add(currentBuffer);
          return;
        }

        var payload = reader.readBytes(size);
        if (_getKeyComplete && _codec != null) {
          payload = _codec!.decrypt(payload);
        }

        final message = Message.fromBytes(command, payload);
        _handleInternal(message);

        if (reader.available > 0) {
          _buffer.add(reader.readBytes(reader.available));
          continue;
        }
        break;
      } catch (e) {
        _logger.severe('Packet parsing error: $e');
        break;
      }
    }
  }

  void _handleInternal(Message message) {
    if (message.command == Commands.getKey) {
      _codec = XorCodec.fromSessionMessage(message.getData());
      _getKeyComplete = true;
      _logger.info('Key initialized');
      listener?.onHandshakeComplete();
    } else {
      dispatcher.dispatch(message);
    }
  }

  void _reset() {
    _socket = null;
    _codec = null;
    _getKeyComplete = false;
    _buffer.clear();
  }

  Future<void> dispose() async {
    _intentionallyClosed = true;
    final socket = _socket;
    _reset();
    try {
      await socket?.close();
    } catch (_) {
      // Ignore close errors — the listener was already notified via onDone.
    }
  }
}
```

### `D:\personal\army/lib\features\authentication\application\auth_controller.dart`
```dart
import 'dart:async';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logging/logging.dart';
import 'package:mobiarmy_flutter/core/network/command/commands.dart';
import 'package:mobiarmy_flutter/core/network/data_sync_service.dart';
import 'package:mobiarmy_flutter/core/network/dispatcher/message_dispatcher.dart';
import 'package:mobiarmy_flutter/core/network/network_provider.dart';
import 'package:mobiarmy_flutter/core/network/ping_heartbeat.dart';
import 'package:mobiarmy_flutter/core/network/protocol/message.dart';
import 'package:mobiarmy_flutter/core/network/transport/session_state_listener.dart';
import 'package:mobiarmy_flutter/core/network/transport/tcp_session.dart';
import 'package:mobiarmy_flutter/features/authentication/application/auth_state_machine.dart';
import 'package:mobiarmy_flutter/features/authentication/data/auth_repository.dart';
import 'package:mobiarmy_flutter/features/authentication/data/post_login_service.dart';
import 'package:mobiarmy_flutter/features/authentication/data/session_packet_mapper.dart';
import 'package:mobiarmy_flutter/features/authentication/domain/account_credentials.dart';
import 'package:mobiarmy_flutter/features/authentication/domain/authentication_state.dart';
import 'package:mobiarmy_flutter/features/authentication/domain/game_server.dart';

class AuthController extends Notifier<AuthenticationState>
    implements SessionStateListener {
  final _logger = Logger('AuthController');

  late final AuthStateMachine _machine;
  late final TcpSession _session;
  late final AuthRepository _repository;
  late final SessionPacketMapper _mapper;
  PingHeartbeat? _ping;
  Timer? _authTimeout;

  @override
  AuthenticationState build() {
    _machine = AuthStateMachine();
    final dispatcher = ref.watch(messageDispatcherProvider);
    _session = ref.watch(tcpSessionProvider);
    _repository = AuthRepository(_session);
    _mapper = const SessionPacketMapper();
    final listenerHolder = ref.watch(sessionListenerHolderProvider);
    listenerHolder.delegate = this;

    _registerHandlers(dispatcher);

    ref.onDispose(() {
      listenerHolder.delegate = null;
      _authTimeout?.cancel();
      _ping?.stop();
    });

    return _machine.state;
  }

  void _registerHandlers(MessageDispatcher dispatcher) {
    dispatcher
      ..register(Commands.loadInfoAll, _onLoadInfoAll)
      ..register(Commands.log, _onLog)
      ..register(Commands.idNotCollision, _onIdNotCollision);
  }

  // ---------------------------------------------------------------- commands

  Future<void> connect(GameServer server) async {
    state = _machine.connectTo(server);
    state = _machine.handshakeStarted();
    try {
      await _session.connect(server.host, server.port);
    } catch (e) {
      state = _machine.connectionLost('Khong ket noi duoc ${server.endpoint}');
    }
  }

  Future<void> login(
    AccountCredentials credentials, {
    bool remember = false,
  }) async {
    if (state.status != AuthStatus.connected) return;
    state = _machine.loginRequested();
    _authTimeout?.cancel();
    _authTimeout = Timer(const Duration(seconds: 20), () {
      if (state.status == AuthStatus.authenticating) {
        state = _machine.connectionLost('Dang nhap qua lau — server khong phan hoi');
      }
    });
    try {
      await _repository.login(credentials);
      // Cho cmd 3 toi qua _onLoadInfoAll — o do moi chay PostLogin + sync.
      _pendingCredentials = (credentials, remember);
    } catch (e) {
      _authTimeout?.cancel();
      state = _machine.connectionLost('Gui yeu cau dang nhap that bai: $e');
    }
  }

  (AccountCredentials, bool)? _pendingCredentials;

  Future<AccountCredentials?> loadRememberedCredentials() async {
    final remembered = await PostLoginService.loadRemembered();
    if (remembered == null) return null;
    return AccountCredentials(
      username: remembered.$1,
      password: remembered.$2,
    );
  }

  Future<void> disconnect() async {
    try {
      if (_session.isConnected) await _repository.sendQuit();
    } catch (_) {}
    await _session.dispose();
    _authTimeout?.cancel();
    _ping?.stop();
    state = _machine.logout();
  }

  // ------------------------------------------------------------- transport

  @override
  void onHandshakeComplete() {
    state = _machine.handshakeComplete();
  }

  @override
  void onDisconnected(String? reason) {
    _authTimeout?.cancel();
    state = _machine.connectionLost(reason);
  }

  @override
  void onSocketError(Object error) {
    _logger.warning('Socket error: $error');
  }

  // --------------------------------------------------------------- packets

  void _onLoadInfoAll(Message message) {
    try {
      final session = _mapper.decodeLoadInfoAll(message);
      final pending = _pendingCredentials;
      _authTimeout?.cancel();

      // Post-login flow: platform_request + bangxephang + sync chain 90.
      final sync = DataSyncService(_session, ref.read(messageDispatcherProvider));
      if (pending != null) {
        PostLoginService.run(
          _session,
          sync,
          username: pending.$1.username,
          password: pending.$1.password,
          remember: pending.$2,
        );
      } else {
        sync.start();
      }
      sync.done.then((_) {
        state = _machine.loginSucceeded(session);
        _ping = PingHeartbeat(_session)..start();
      }).catchError((Object e) {
        state = _machine.connectionLost('Dong bo du lieu that bai: $e');
      });
    } catch (e, stack) {
      _logger.severe('loadInfoAll parse failed', e, stack);
      state = _machine.connectionLost('Phan hoi dang nhap khong hop le');
    }
  }

  void _onLog(Message message) {
    final text = _mapper.decodeLog(message);
    final next = _machine.logReceived(text);
    if (next != state) {
      _authTimeout?.cancel();
      state = next;
    } else {
      _logger.info('Server notice: $text');
    }
  }

  void _onIdNotCollision(Message message) {
    _logger.info('idNotCollision: ${_mapper.decodeIdNotCollision(message)}');
  }
}

final authControllerProvider =
    NotifierProvider<AuthController, AuthenticationState>(AuthController.new);
```

### `D:\personal\army/lib\features\authentication\application\auth_state_machine.dart`
```dart
import 'package:mobiarmy_flutter/features/authentication/domain/authentication_state.dart';
import 'package:mobiarmy_flutter/features/authentication/domain/game_server.dart';
import 'package:mobiarmy_flutter/features/authentication/domain/user_session.dart';

/// Pure state machine for the auth flow. No Riverpod, no sockets — fully
/// unit-testable. Invalid transitions are no-ops (asserted in debug).
///
/// Flow (mirrors Session.java / ControlHandler.java on the server):
///   disconnected -> connecting -> handshaking -> connected
///   connected -> authenticating -> authenticated | failed
///   any -> disconnected (logout) | failed (connection lost)
class AuthStateMachine {
  AuthenticationState _state = const AuthenticationState.disconnected();

  AuthenticationState get state => _state;

  AuthenticationState connectTo(GameServer server) {
    if (!_isAny(const {AuthStatus.disconnected, AuthStatus.failed})) {
      return _state;
    }
    return _set(AuthenticationState.connecting(server));
  }

  AuthenticationState handshakeStarted() {
    if (!_isAny(const {AuthStatus.connecting})) return _state;
    final server = _state.server;
    if (server == null) return _state;
    return _set(AuthenticationState.handshaking(server));
  }

  AuthenticationState handshakeComplete() {
    if (!_isAny(const {AuthStatus.connecting, AuthStatus.handshaking})) {
      return _state;
    }
    final server = _state.server;
    if (server == null) return _state;
    return _set(AuthenticationState.connected(server));
  }

  AuthenticationState loginRequested() {
    if (!_isAny(const {AuthStatus.connected})) return _state;
    final server = _state.server!;
    return _set(AuthenticationState.authenticating(server));
  }

  AuthenticationState loginSucceeded(UserSession session) {
    if (!_isAny(const {AuthStatus.authenticating})) return _state;
    final server = _state.server!;
    return _set(AuthenticationState.authenticated(server, session));
  }

  /// Server command 45 (`log`). Only meaningful while authenticating —
  /// that is the login-failure path. Outside auth it is a general notice
  /// and must not change auth state.
  AuthenticationState logReceived(String message) {
    if (!_isAny(const {AuthStatus.authenticating})) return _state;
    final server = _state.server;
    return _set(AuthenticationState.failed(server, message));
  }

  AuthenticationState connectionLost([String? reason]) {
    if (_isAny(const {AuthStatus.disconnected})) return _state;
    final server = _state.server;
    if (server == null) return _set(AuthenticationState.disconnected(reason));
    return _set(
      AuthenticationState.failed(server, reason ?? 'Mất kết nối đến server'),
    );
  }

  AuthenticationState logout() {
    if (_isAny(const {AuthStatus.disconnected})) return _state;
    return _set(const AuthenticationState.disconnected());
  }

  bool _isAny(Set<AuthStatus> allowed) => allowed.contains(_state.status);

  AuthenticationState _set(AuthenticationState next) {
    assert(
      _state.status != next.status || _state.server != next.server,
      'No-op auth transition ${_state.status} -> ${next.status}',
    );
    _state = next;
    return next;
  }
}
```

### `D:\personal\army/lib\features\authentication\data\account_storage.dart`
```dart
import 'package:mobiarmy_flutter/features/authentication/domain/account_credentials.dart';

abstract interface class AccountStorage {
  Future<AccountCredentials?> load();
  Future<void> save(AccountCredentials credentials);
}

class InMemoryAccountStorage implements AccountStorage {
  AccountCredentials? _credentials;

  @override
  Future<AccountCredentials?> load() async => _credentials;

  @override
  Future<void> save(AccountCredentials credentials) async {
    _credentials = credentials;
  }
}
```

### `D:\personal\army/lib\features\authentication\data\auth_repository.dart`
```dart
import 'package:mobiarmy_flutter/core/network/command/commands.dart';
import 'package:mobiarmy_flutter/core/network/protocol/message.dart';
import 'package:mobiarmy_flutter/core/network/transport/tcp_session.dart';
import 'package:mobiarmy_flutter/features/authentication/domain/account_credentials.dart';

class AuthRepository {
  AuthRepository(this._session);
  final TcpSession _session;

  Future<void> login(AccountCredentials credentials) async {
    final message = Message(Commands.login);
    message.writer().writeUTF(credentials.username);
    message.writer().writeUTF(credentials.password);
    message.writer().writeUTF(AccountCredentials.kClientVersion);
    await _session.sendMessage(message);
  }

  Future<void> sendQuit() => _session.sendMessage(Message(Commands.quit));
}
```

### `D:\personal\army/lib\features\authentication\data\post_login_service.dart`
```dart
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
```

### `D:\personal\army/lib\features\authentication\data\server_catalog.dart`
```dart
import 'package:mobiarmy_flutter/features/authentication/domain/game_server.dart';

abstract final class ServerCatalog {
  static const servers = <GameServer>[
    GameServer(name: 'Localhost', host: '127.0.0.1', port: 1919),
  ];
}
```

### `D:\personal\army/lib\features\authentication\data\server_list_store.dart`
```dart
import 'dart:convert';
import 'dart:typed_data';

import 'package:http/http.dart' as http;

import 'package:mobiarmy_flutter/core/assets/legacy_rms.dart';

/// Port GameMidlet.loadIP/saveIP + doUpdateServer (TerrainMidlet):
/// Record "ipArmy2": [byte n] + lap n lan [UTF name][UTF ip][short port].
/// Neu khong co record -> HTTP GET linkGetHost, parse CSV "name,ip,port".
class GameServerEntry {
  GameServerEntry(this.name, this.ip, this.port);
  final String name;
  final String ip;
  final int port;
}

abstract final class ServerListStore {
  /// GameMidlet.linkGetHost (TerrainMidlet dung gmb.teamobi.com).
  static const linkGetHost = 'https://sv.pro.vn/server.txt';

  static Future<List<GameServerEntry>> load() async {
    final cached = await LegacyRms.load('ipArmy2');
    if (cached != null && cached.isNotEmpty) {
      final list = _decode(cached);
      if (list.isNotEmpty) return list;
    }
    return updateFromNetwork();
  }

  static Future<List<GameServerEntry>> updateFromNetwork() async {
    final res = await http.get(Uri.parse(linkGetHost));
    final text = utf8.decode(res.bodyBytes);
    final list = <GameServerEntry>[];
    for (final raw in text.split(',')) {
      final parts = raw.trim().split(':');
      if (parts.length >= 3) {
        list.add(GameServerEntry(parts[0], parts[1], int.parse(parts[2].trim())));
      }
    }
    await save(list);
    return list;
  }

  static Future<void> save(List<GameServerEntry> servers) async {
    final out = BytesBuilder();
    out.addByte(servers.length);
    for (final s in servers) {
      _writeUtf(out, s.name);
      _writeUtf(out, s.ip);
      out.addByte((s.port >> 8) & 0xFF);
      out.addByte(s.port & 0xFF);
    }
    await LegacyRms.save('ipArmy2', out.toBytes());
  }

  static List<GameServerEntry> _decode(Uint8List data) {
    var pos = 0;
    int u8() => data[pos++];
    int u16() { final v = (data[pos] << 8) | data[pos + 1]; pos += 2; return v; }
    String utf() {
      final len = u16();
      final s = utf8.decode(data.sublist(pos, pos + len));
      pos += len;
      return s;
    }
    final n = u8();
    final list = <GameServerEntry>[];
    for (var i = 0; i < n; i++) {
      list.add(GameServerEntry(utf(), utf(), u16()));
    }
    return list;
  }

  static void _writeUtf(BytesBuilder out, String s) {
    final b = utf8.encode(s);
    out.addByte((b.length >> 8) & 0xFF);
    out.addByte(b.length & 0xFF);
    out.add(b);
  }
}
```

### `D:\personal\army/lib\features\authentication\data\session_packet_mapper.dart`
```dart
import 'package:mobiarmy_flutter/core/network/protocol/message.dart';
import 'package:mobiarmy_flutter/features/authentication/domain/user_session.dart';

/// Decoders for the auth-phase server packets.
///
/// Field order is byte-for-byte the inverse of `SessionHandler.java`:
/// loadInfoAll (cmd 3), log (cmd 45), idNotColision (cmd 92).
class SessionPacketMapper {
  const SessionPacketMapper();

  static const int glassCount = 10; // glass table ids 0..9
  static const int equipSlotCount = 5; // gun, hat, armor, glasses, wing
  static const int itemCount = 36; // item table ids 0..35
  static const int shopGlassCount = 7; // glass id > 2 -> 3..9

  /// cmd 45 `log` — UTF message. During auth this means login failure;
  /// outside auth it is a general server notice.
  String decodeLog(Message message) => message.reader().readUTF();

  /// cmd 3 `loadInfoAll`.
  UserSession decodeLoadInfoAll(Message message) {
    final r = message.reader();
    final id = r.readInt();
    final xu = r.readInt();
    final luong = r.readInt();
    final selectGlass = r.readByte();
    r.readShort(); // -1
    r.readByte(); // 0

    final glasses = <GlassSlotData>[];
    for (var i = 0; i < glassCount; i++) {
      final hasData = r.readBoolean();
      final data = hasData
          ? [for (var j = 0; j < equipSlotCount; j++) r.readShort()]
          : <int>[];
      final equipIds = [for (var j = 0; j < equipSlotCount; j++) r.readShort()];
      glasses.add(
        GlassSlotData(hasData: hasData, data: data, equipIds: equipIds),
      );
    }

    final items = <ItemStock>[];
    for (var i = 0; i < itemCount; i++) {
      items.add(
        ItemStock(num: r.readByte(), xu: r.readInt(), luong: r.readInt()),
      );
    }

    final shop = <GlassShopEntry>[];
    for (var i = 0; i < shopGlassCount; i++) {
      shop.add(
        GlassShopEntry(
          isOpen: r.readByte() == 1,
          xu: r.readShort(),
          luong: r.readShort(),
        ),
      );
    }

    // Trailing UTFs "a", "b", "c" — consume if present, but do not fail the
    // parse if a future server version appends more fields.
    if (r.available > 0) {
      r.readUTF();
      if (r.available > 0) r.readUTF();
      if (r.available > 0) r.readUTF();
    }

    return UserSession(
      id: id,
      xu: xu,
      luong: luong,
      selectGlass: selectGlass,
      glasses: List.unmodifiable(glasses),
      items: List.unmodifiable(items),
      glassShop: List.unmodifiable(shop),
    );
  }

  /// cmd 92 `idNotColision` — tile ids that ignore terrain collision.
  List<int> decodeIdNotCollision(Message message) {
    final r = message.reader();
    final count = r.readShort();
    return [for (var i = 0; i < count; i++) r.readShort()];
  }
}
```

### `D:\personal\army/lib\features\authentication\domain\account_credentials.dart`
```dart
class AccountCredentials {
  const AccountCredentials({required this.username, required this.password});

  static const kClientVersion = '2.0.0';

  final String username;
  final String password;
}
```

### `D:\personal\army/lib\features\authentication\domain\authentication_state.dart`
```dart
import 'game_server.dart';
import 'user_session.dart';

enum AuthStatus {
  disconnected,
  connecting,
  handshaking,
  connected,
  authenticating,
  authenticated,
  failed,
}

class AuthenticationState {
  const AuthenticationState._({
    required this.status,
    this.server,
    this.session,
    this.message,
  });

  const AuthenticationState.disconnected([String? message])
    : this._(status: AuthStatus.disconnected, message: message);

  const AuthenticationState.connecting(GameServer server)
    : this._(status: AuthStatus.connecting, server: server);

  const AuthenticationState.handshaking(GameServer server)
    : this._(status: AuthStatus.handshaking, server: server);

  const AuthenticationState.connected(GameServer server)
    : this._(status: AuthStatus.connected, server: server);

  const AuthenticationState.authenticating(GameServer server)
    : this._(status: AuthStatus.authenticating, server: server);

  const AuthenticationState.authenticated(
    GameServer server,
    UserSession session,
  ) : this._(
        status: AuthStatus.authenticated,
        server: server,
        session: session,
      );

  const AuthenticationState.failed(GameServer? server, String message)
    : this._(status: AuthStatus.failed, server: server, message: message);

  final AuthStatus status;
  final GameServer? server;
  final UserSession? session;
  final String? message;

  bool get isAuthenticated => status == AuthStatus.authenticated;
  bool get isBusy => {
    AuthStatus.connecting,
    AuthStatus.handshaking,
    AuthStatus.authenticating,
  }.contains(status);
}
```

### `D:\personal\army/lib\features\authentication\domain\game_server.dart`
```dart
class GameServer {
  const GameServer({
    required this.name,
    required this.host,
    required this.port,
  });

  final String name;
  final String host;
  final int port;

  String get endpoint => '$host:$port';
}
```

### `D:\personal\army/lib\features\authentication\domain\user_session.dart`
```dart
class GlassSlotData {
  const GlassSlotData({
    required this.hasData,
    required this.data,
    required this.equipIds,
  });

  final bool hasData;
  final List<int> data;
  final List<int> equipIds;
}

class ItemStock {
  const ItemStock({required this.num, required this.xu, required this.luong});

  final int num;
  final int xu;
  final int luong;
}

class GlassShopEntry {
  const GlassShopEntry({
    required this.isOpen,
    required this.xu,
    required this.luong,
  });

  final bool isOpen;
  final int xu;
  final int luong;
}

class UserSession {
  const UserSession({
    required this.id,
    required this.xu,
    required this.luong,
    required this.selectGlass,
    required this.glasses,
    required this.items,
    required this.glassShop,
  });

  final int id;
  final int xu;
  final int luong;
  final int selectGlass;
  final List<GlassSlotData> glasses;
  final List<ItemStock> items;
  final List<GlassShopEntry> glassShop;
}
```

### `D:\personal\army/lib\features\authentication\presentation\login_screen.dart`
```dart
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mobiarmy_flutter/features/authentication/application/auth_controller.dart';
import 'package:mobiarmy_flutter/features/authentication/domain/account_credentials.dart';
import 'package:mobiarmy_flutter/features/authentication/domain/authentication_state.dart';

class LoginScreen extends ConsumerStatefulWidget {
  const LoginScreen({super.key});

  @override
  ConsumerState<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends ConsumerState<LoginScreen> {
  final _username = TextEditingController();
  final _password = TextEditingController();
  bool _remember = true;

  @override
  void initState() {
    super.initState();
    Future<void>.microtask(() async {
      final saved = await ref
          .read(authControllerProvider.notifier)
          .loadRememberedCredentials();
      if (saved != null && mounted) {
        _username.text = saved.username;
        _password.text = saved.password;
        setState(() {});
      }
    });
  }

  @override
  void dispose() {
    _username.dispose();
    _password.dispose();
    super.dispose();
  }

  Future<void> _login() async {
    FocusScope.of(context).unfocus();
    await ref
        .read(authControllerProvider.notifier)
        .login(
          AccountCredentials(
            username: _username.text.trim(),
            password: _password.text,
          ),
          remember: _remember,
        );
  }

  @override
  Widget build(BuildContext context) {
    final auth = ref.watch(authControllerProvider);
    final canLogin =
        auth.status == AuthStatus.connected && _username.text.isNotEmpty;

    return Scaffold(
      body: SafeArea(
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 420),
            child: Padding(
              padding: const EdgeInsets.all(24),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text('Dang nhap',
                      style: Theme.of(context).textTheme.headlineMedium),
                  const SizedBox(height: 4),
                  Text(
                    'Server: ${auth.server?.endpoint ?? '-'} · client ${AccountCredentials.kClientVersion}',
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                  const SizedBox(height: 16),
                  TextField(
                    controller: _username,
                    decoration: const InputDecoration(labelText: 'Tai khoan'),
                    textInputAction: TextInputAction.next,
                    onChanged: (_) => setState(() {}),
                  ),
                  const SizedBox(height: 8),
                  TextField(
                    controller: _password,
                    obscureText: true,
                    decoration: const InputDecoration(labelText: 'Mat khau'),
                    textInputAction: TextInputAction.done,
                    onSubmitted: (_) => canLogin ? _login() : null,
                  ),
                  Row(
                    children: [
                      Checkbox(
                        value: _remember,
                        onChanged: (v) => setState(() => _remember = v ?? true),
                      ),
                      const Text('Nho tai khoan'),
                    ],
                  ),
                  if (auth.status == AuthStatus.failed &&
                      auth.message != null) ...[
                    Container(
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: Colors.red.withValues(alpha: 0.15),
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(color: Colors.redAccent),
                      ),
                      child: Text(auth.message!,
                          style: const TextStyle(color: Colors.redAccent)),
                    ),
                    const SizedBox(height: 8),
                  ],
                  FilledButton(
                    onPressed: canLogin ? _login : null,
                    child: auth.status == AuthStatus.authenticating
                        ? const SizedBox(
                            width: 18,
                            height: 18,
                            child: CircularProgressIndicator(strokeWidth: 2),
                          )
                        : const Text('Dang nhap'),
                  ),
                  const SizedBox(height: 8),
                  TextButton(
                    onPressed: auth.isBusy
                        ? null
                        : () => ref
                              .read(authControllerProvider.notifier)
                              .disconnect(),
                    child: const Text('Quay lai chon server'),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
```

### `D:\personal\army/lib\features\authentication\presentation\server_selection_screen.dart`
```dart
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:mobiarmy_flutter/app/router/app_route.dart';
import 'package:mobiarmy_flutter/features/authentication/application/auth_controller.dart';
import 'package:mobiarmy_flutter/features/authentication/data/server_catalog.dart';
import 'package:mobiarmy_flutter/features/authentication/domain/authentication_state.dart';

class ServerSelectionScreen extends ConsumerWidget {
  const ServerSelectionScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final auth = ref.watch(authControllerProvider);

    // Router redirect pushes us to /login automatically once connected.
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                'Chọn server',
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              const SizedBox(height: 8),
              Text(
                'Máy ảo Android dùng 10.0.2.2 · thiết bị thật dùng IP LAN của máy chạy server',
                style: Theme.of(context).textTheme.bodySmall,
              ),
              const SizedBox(height: 16),
              Expanded(
                child: ListView(
                  children: [
                    for (final server in ServerCatalog.servers)
                      Card(
                        child: ListTile(
                          leading: const Icon(Icons.dns),
                          title: Text(server.name),
                          subtitle: Text(server.endpoint),
                          trailing: FilledButton(
                            onPressed: auth.isBusy
                                ? null
                                : () => ref
                                      .read(authControllerProvider.notifier)
                                      .connect(server),
                            child: const Text('Kết nối'),
                          ),
                        ),
                      ),
                  ],
                ),
              ),
              if (auth.isBusy)
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: 18,
                        height: 18,
                        child: CircularProgressIndicator(strokeWidth: 2),
                      ),
                      SizedBox(width: 12),
                      Text('Đang kết nối / handshake…'),
                    ],
                  ),
                ),
              if (auth.status == AuthStatus.failed && auth.message != null)
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: Colors.red.withValues(alpha: 0.15),
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: Colors.redAccent),
                  ),
                  child: Text(
                    auth.message!,
                    style: const TextStyle(color: Colors.redAccent),
                  ),
                ),
              const SizedBox(height: 8),
              OutlinedButton.icon(
                icon: const Icon(Icons.sports_esports),
                label: const Text('Chơi offline (sandbox)'),
                onPressed: () => context.go(AppRoute.gameplaySandbox.path),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
```

### `D:\personal\army/lib\features\gameplay\application\chat_service.dart`
```dart
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mobiarmy_flutter/core/network/command/commands.dart';
import 'package:mobiarmy_flutter/core/network/network_provider.dart';
import 'package:mobiarmy_flutter/core/network/protocol/message.dart';
import 'package:mobiarmy_flutter/core/network/transport/tcp_session.dart';

/// Port chat in-game:
///   gui:   GameService.chatToBoard(text) — cmd 9 + writeUTF
///   nhan:  MessageHandler case 9 — from(int idDB) + text(UTF)
class ChatMessage {
  ChatMessage(this.fromId, this.fromName, this.text);
  final int fromId;
  final String fromName; // TODO: doi idDB -> ten qua room players
  final String text;
}

class ChatService extends Notifier<List<ChatMessage>> {
  late final TcpSession _session;

  @override
  List<ChatMessage> build() {
    _session = ref.watch(tcpSessionProvider);
    ref.watch(messageDispatcherProvider).register(Commands.chat, _onChat);
    return const [];
  }

  void _onChat(Message msg) {
    final r = msg.reader();
    final from = r.readInt();
    final text = r.readUTF();
    state = [...state, ChatMessage(from, 'Nguoi choi $from', text)];
  }

  Future<void> send(String text) async {
    final m = Message(Commands.chat);
    m.writer().writeUTF(text);
    await _session.sendMessage(m);
  }
}

final chatServiceProvider =
    NotifierProvider<ChatService, List<ChatMessage>>(ChatService.new);
```

### `D:\personal\army/lib\features\gameplay\application\game_controls.dart`
```dart
import 'package:mobiarmy_flutter/core/network/command/commands.dart';
import 'package:mobiarmy_flutter/core/network/protocol/message.dart';
import 'package:mobiarmy_flutter/core/network/transport/tcp_session.dart';

/// Port cac lenh gameplay client -> server (GameService):
///   waitForFire cmd 22, move cmd 21, useItem cmd 26, skipTurn cmd 49,
///   chat cmd 9, getMaterialIcon cmd 126.
class GameControls {
  GameControls(this._session);
  final TcpSession _session;

  /// GameService.waitForFIRE(type, x, y, angle, force, force_2, numShoot).
  /// x/y = VI TRI SUNG, force 1..30, angle SHORT (co the am, vd King Kong 30).
  Future<void> shoot({
    required int type, required int gunX, required int gunY,
    required int angle, required int force, int force2 = 0, int numShoot = 1,
    bool isDoubleBull = false,
  }) async {
    final m = Message(Commands.shoot);
    m.writer().writeByte(type);
    m.writer().writeShort(gunX);
    m.writer().writeShort(gunY);
    m.writer().writeShort(angle);
    m.writer().writeByte(force);
    if (isDoubleBull) m.writer().writeByte(force2);
    m.writer().writeByte(numShoot);
    await _session.sendMessage(m);
  }

  /// GameService.move(x, y) — cmd 21.
  Future<void> move(int x, int y) async {
    final m = Message(Commands.move);
    m.writer().writeShort(x);
    m.writer().writeShort(y);
    await _session.sendMessage(m);
  }

  /// GameService.useItem(item) — cmd 26.
  Future<void> useItem(int itemId) async {
    final m = Message(Commands.useItem);
    m.writer().writeByte(itemId);
    await _session.sendMessage(m);
  }

  /// GameService.skipTurn() — cmd 49.
  Future<void> skipTurn() => _session.sendMessage(Message(Commands.skipTurn));

  /// Chat cmd 9 — TODO verify: ban goc dung GameService.chat(String) viet UTF.
  Future<void> chat(String text) async {
    final m = Message(Commands.chat);
    m.writer().writeUTF(text);
    await _session.sendMessage(m);
  }

  /// GameService.getMaterialIcon — cmd 126: xin anh tile/material tu server.
  Future<void> requestMaterialIcon(int action, int id, [int index = 0]) async {
    final m = Message(126);
    m.writer().writeByte(action);
    m.writer().writeByte(id);
    if (action == 3 || action == 4) m.writer().writeByte(index);
    await _session.sendMessage(m);
  }
}
```

### `D:\personal\army/lib\features\gameplay\application\game_session_bootstrap.dart`
```dart
import 'package:mobiarmy_flutter/core/network/data_cache_parsers.dart';
import 'package:mobiarmy_flutter/features/gameplay/application/game_start_handler.dart';
import 'package:mobiarmy_flutter/features/gameplay/game/map/destructible_terrain.dart';
import 'package:mobiarmy_flutter/features/gameplay/game/map/game_map_definition.dart';
import 'package:mobiarmy_flutter/features/gameplay/game/map/map_binary_parser.dart';
import 'package:mobiarmy_flutter/features/gameplay/game/map/terrain_component.dart';

/// Noi GameSessionStart (cmd 20) -> GameMapDefinition + terrain thuc.
/// Map lay tu valuesdata2 da sync (DataCache.mapFiles), parse bang
/// MapBinaryParser — khong can JSON nua.
class OnlineGameSetup {
  OnlineGameSetup({
    required this.session, required this.map,
    required this.terrain, required this.spawnPoints,
  });
  final GameSessionStart session;
  final GameMapDefinition map;
  final DestructibleTerrain terrain;
  final List<SpawnPoint> spawnPoints;
}

abstract final class GameSessionBootstrap {
  static OnlineGameSetup? build(GameSessionStart session) {
    if (session.mapId < 0 || session.mapId >= DataCache.mapFiles.length) {
      return null;
    }
    final entry = DataCache.mapFiles[session.mapId];
    final bin = MapBinaryParser.parse(entry.data);

    // Brick rects tu nhi phan. tileSize approximation 20px —
    // nang cap: rasterize anh tile (pixel alpha) khi co tiledata2.
    final bricks = [
      for (final b in bin.bricks)
        MapBrickDefinition(
          tileId: b.tileId, x: b.x, y: b.y,
          destructible: true, // TODO: dung idNotCollision (cmd 92) de danh dau
        ),
    ];

    final spawnPoints = <SpawnPoint>[];
    for (var i = 0; i < session.playerX.length; i++) {
      if (session.playerX[i] != -1) {
        spawnPoints.add(SpawnPoint(x: session.playerX[i], y: session.playerY[i]));
      }
    }

    final map = GameMapDefinition(
      id: session.mapId,
      width: bin.width,
      height: bin.height,
      layers: [MapLayerDefinition(id: 'terrain', bricks: bricks)],
      spawnPoints: spawnPoints,
      environment: MapEnvironmentDefinition(
        backgroundId: entry.values[0],
        backgroundY: entry.values[1],
        cloudY: entry.values[2],
        waterY: bin.height,
        waterClass: -1,
      ),
    );

    final terrain = TerrainMaskBuilder.build(map, tileSize: 20);
    return OnlineGameSetup(
      session: session, map: map, terrain: terrain, spawnPoints: spawnPoints,
    );
  }
}
```

### `D:\personal\army/lib\features\gameplay\application\game_start_handler.dart`
```dart
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logging/logging.dart';
import 'package:mobiarmy_flutter/core/network/command/commands.dart';
import 'package:mobiarmy_flutter/core/network/network_provider.dart';
import 'package:mobiarmy_flutter/core/network/protocol/message.dart';

/// Port MessageHandler case 20 (startGame):
///   trainingMode=false: mapID(byte), time(byte), team(unsignedShort),
///   playerLent(=8, hoac byte neu currLevel==7),
///   lap: playerX[i](short) != -1 -> playerY[i](short), maxHP[i](short)
/// -> GameScr.initGame(mapID, time, playerX, playerY, maxHP, team)
class GameSessionStart {
  GameSessionStart({
    required this.mapId, required this.time, required this.team,
    required this.playerX, required this.playerY, required this.maxHp,
  });
  final int mapId, time, team;
  final List<int> playerX, playerY, maxHp;
}

class GameStartNotifier extends Notifier<GameSessionStart?> {
  final _logger = Logger('GameStart');

  @override
  GameSessionStart? build() {
    final d = ref.watch(messageDispatcherProvider);
    d.register(Commands.startGame, _onStart);
    d.register(Commands.setWind, _onWind);
    d.register(Commands.setTurn, _onTurn);
    return null;
  }

  void _onStart(Message msg) {
    final r = msg.reader();
    // trainingMode = false trong luong online thong thuong
    final mapId = r.readByte();
    final time = r.readByte();
    final team = r.readUnsignedShort();
    final playerLent = 8; // TODO: PrepareScr.currLevel == 7 thi doc byte
    final playerX = <int>[], playerY = <int>[], maxHp = <int>[];
    for (var i = 0; i < playerLent; i++) {
      final x = r.readShort();
      playerX.add(x);
      if (x != -1) {
        playerY.add(r.readShort());
        maxHp.add(r.readShort());
      } else {
        playerY.add(-1);
        maxHp.add(0);
      }
    }
    state = GameSessionStart(
      mapId: mapId, time: time, team: team,
      playerX: playerX, playerY: playerY, maxHp: maxHp,
    );
    // TODO: dieu huong sang GameplayPage + khoi tao ArmyGame tu GameSessionStart
    // (map tu DataCache.mapFiles[mapId], spawn theo playerX/playerY).
  }

  void _onWind(Message msg) {
    final r = msg.reader();
    final windX = r.readShort();
    final windY = r.readShort();
    _logger.info('Wind: ($windX, $windY)');
    // TODO: GameScr.windx = windX — cap nhat HUD gio + physics luc ban.
  }

  void _onTurn(Message msg) {
    final whoNext = msg.reader().readByte();
    _logger.info('Next turn: $whoNext');
    // TODO: cap nhat luot ban tren HUD.
  }
}

final gameStartProvider =
    NotifierProvider<GameStartNotifier, GameSessionStart?>(GameStartNotifier.new);
```

### `D:\personal\army/lib\features\gameplay\application\gameplay_handler.dart`
```dart
import 'package:logging/logging.dart';
import 'package:mobiarmy_flutter/core/network/command/commands.dart';
import 'package:mobiarmy_flutter/core/network/dispatcher/message_dispatcher.dart';
import 'package:mobiarmy_flutter/core/network/protocol/message.dart';

import '../game/army_game.dart';
import '../game/projectile/projectile_trajectory.dart';

class GameplayHandler {
  GameplayHandler(this._dispatcher);
  final MessageDispatcher _dispatcher;
  final _logger = Logger('GameplayHandler');

  ArmyGame? _game;

  void attachGame(ArmyGame game) {
    _game = game;
  }

  void detachGame() {
    _game = null;
  }

  void init() {
    _dispatcher.register(Commands.shoot, _handleShoot);
    _dispatcher.register(Commands.move, _handleMove);
    _dispatcher.register(Commands.setTurn, _handleSetTurn);
  }

  void _handleSetTurn(Message message) {
    final reader = message.reader();
    final nextPlayer = reader.readByte();
    _logger.info('Next turn: player $nextPlayer');
    // TODO: Update HUD and active player marker
  }

  void _handleShoot(Message message) {
    final reader = message.reader();
    final typeShoot = reader.readByte();
    reader.readByte();
    final playerIndex = reader.readByte();
    final bulletId = reader.readByte();
    reader.readShort();
    reader.readShort();
    reader.readShort();

    // ... handle special bullets ...

    reader.readByte();
    final numBullets = reader.readByte();

    final allTrajectories = <ProjectileTrajectory>[];

    for (int i = 0; i < numBullets; i++) {
      final numFrames = reader.readShort();
      final frames = <TrajectoryFrame>[];

      int lastX = 0;
      int lastY = 0;

      for (int j = 0; j < numFrames; j++) {
        if (j == 0 || typeShoot == 1) {
          lastX = reader.readShort();
          lastY = reader.readShort();
        } else {
          lastX += reader.readByte();
          lastY += reader.readByte();
        }
        frames.add(TrajectoryFrame(x: lastX, y: lastY));
      }
      allTrajectories.add(
        ProjectileTrajectory(bulletId: bulletId, frames: frames),
      );
    }

    _logger.info(
      'Received shoot message for player $playerIndex, $numBullets bullets',
    );

    for (final trajectory in allTrajectories) {
      _game?.spawnProjectile(trajectory);
    }
  }

  void _handleMove(Message message) {
    final reader = message.reader();
    final whoMove = reader.readByte();
    final x = reader.readShort();
    final y = reader.readShort();
    _logger.info('Player $whoMove moved to ($x, $y)');

    _game?.players[whoMove]?.moveTo(x.toDouble(), y.toDouble());
  }
}
```

### `D:\personal\army/lib\features\gameplay\application\gameplay_provider.dart`
```dart
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mobiarmy_flutter/core/network/network_provider.dart';
import 'gameplay_handler.dart';

final gameplayHandlerProvider = Provider<GameplayHandler>((ref) {
  final dispatcher = ref.watch(messageDispatcherProvider);
  final handler = GameplayHandler(dispatcher);
  handler.init();
  return handler;
});
```

### `D:\personal\army/lib\features\gameplay\application\lobby_service.dart`
```dart
import 'dart:async';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logging/logging.dart';
import 'package:mobiarmy_flutter/core/network/command/commands.dart';
import 'package:mobiarmy_flutter/core/network/network_provider.dart';
import 'package:mobiarmy_flutter/core/network/protocol/message.dart';
import 'package:mobiarmy_flutter/core/network/transport/tcp_session.dart';
import 'package:mobiarmy_flutter/features/gameplay/domain/room_list_models.dart';

/// Port RoomListScr flow:
///   gui cmd 7 (GameService.requestBoardList(byte id)) -> server tra cmd -28
///   parse RoomInfoEntry -> hien thi lobby.
class LobbyService extends Notifier<List<RoomInfoEntry>> {
  final _logger = Logger('LobbyService');
  late final TcpSession _session;

  @override
  List<RoomInfoEntry> build() {
    _session = ref.watch(tcpSessionProvider);
    ref.watch(messageDispatcherProvider).register(Commands.roomWaitList, _onRoomList);
    return const [];
  }

  /// GameService.requestBoardList(byte id) — cmd 7.
  Future<void> requestRoomList() {
    final m = Message(Commands.roomWaitList);
    m.writer().writeByte(0);
    return _session.sendMessage(m);
  }

  void _onRoomList(Message msg) {
    try {
      state = RoomListParser.parse(msg);
    } catch (e, st) {
      _logger.severe('Room list parse failed', e, st);
    }
  }

  /// GameService.joinBoard(roomID, boardID, pass) — cmd 8.
  Future<void> joinRoom(int roomId, int boardId, [String pass = '']) {
    final m = Message(Commands.joinRoomWait);
    m.writer().writeByte(roomId);
    m.writer().writeByte(boardId);
    m.writer().writeUTF(pass);
    return _session.sendMessage(m);
  }
}

final lobbyServiceProvider =
    NotifierProvider<LobbyService, List<RoomInfoEntry>>(LobbyService.new);
```

### `D:\personal\army/lib\features\gameplay\application\online_game_service.dart`
```dart
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logging/logging.dart';
import 'package:mobiarmy_flutter/core/network/command/commands.dart';
import 'package:mobiarmy_flutter/core/network/network_provider.dart';
import 'package:mobiarmy_flutter/core/network/protocol/message.dart';
import 'package:mobiarmy_flutter/core/network/transport/tcp_session.dart';
import 'package:mobiarmy_flutter/features/gameplay/application/game_controls.dart';

/// Trang thai HUD game online: gio (cmd 25), luot (cmd 24), vi tri
/// cap nhat (cmd 53 setXY).
class OnlineGameState {
  const OnlineGameState({
    this.windX = 0, this.windY = 0,
    this.currentPlayer = -1, this.myIndex = -1,
  });
  final int windX, windY, currentPlayer, myIndex;
  bool get isMyTurn => myIndex != -1 && currentPlayer == myIndex;

  OnlineGameState copyWith({
    int? windX, int? windY, int? currentPlayer, int? myIndex,
  }) => OnlineGameState(
    windX: windX ?? this.windX, windY: windY ?? this.windY,
    currentPlayer: currentPlayer ?? this.currentPlayer,
    myIndex: myIndex ?? this.myIndex,
  );
}

class OnlineGameService extends Notifier<OnlineGameState> {
  final _logger = Logger('OnlineGameService');
  late final TcpSession _session;
  late final GameControls _controls;

  @override
  OnlineGameState build() {
    _session = ref.watch(tcpSessionProvider);
    _controls = GameControls(_session);
    final d = ref.watch(messageDispatcherProvider);
    d.register(Commands.setWind, _onWind);
    d.register(Commands.setTurn, _onTurn);
    d.register(Commands.setXy, _onSetXy);
    return const OnlineGameState();
  }

  void _onWind(Message msg) {
    final r = msg.reader();
    state = state.copyWith(windX: r.readShort(), windY: r.readShort());
  }

  void _onTurn(Message msg) {
    state = state.copyWith(currentPlayer: msg.reader().readByte());
  }

  /// cmd 53 setXY: cap nhat vi tri nguoi choi (who, x, y).
  void _onSetXy(Message msg) {
    final r = msg.reader();
    final who = r.readByte();
    final x = r.readShort();
    final y = r.readShort();
    _logger.fine('setXY $who -> ($x,$y)');
    // TODO: game.players[who].moveTo(x, y)
  }

  // ------------------------------------------------- controls (GUI cmd)

  Future<void> shoot({
    required int type, required int gunX, required int gunY,
    required int angle, required int force,
  }) => _controls.shoot(
    type: type, gunX: gunX, gunY: gunY,
    angle: angle, force: force.clamp(1, 30),
  );

  Future<void> move(int x, int y) => _controls.move(x, y);
  Future<void> useItem(int itemId) => _controls.useItem(itemId);
  Future<void> skipTurn() => _controls.skipTurn();
}

final onlineGameServiceProvider =
    NotifierProvider<OnlineGameService, OnlineGameState>(OnlineGameService.new);
```

### `D:\personal\army/lib\features\gameplay\application\room_service.dart`
```dart
import 'dart:async';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logging/logging.dart';
import 'package:mobiarmy_flutter/core/network/command/commands.dart';
import 'package:mobiarmy_flutter/core/network/network_provider.dart';
import 'package:mobiarmy_flutter/core/network/protocol/message.dart';
import 'package:mobiarmy_flutter/core/network/transport/tcp_session.dart';

/// Port MessageHandler case 8 (joinBoard) + case 12 (nguoi choi moi vao):
///   cmd 8: ownerID(int), money(int), map(byte), gameMODE(byte),
///          lap den het: IDDB(int) != -1 -> clanID(short), name(UTF),
///          xu(int), level2(uByte), gun(byte), 5 x short equipID, isReady(bool)
class RoomPlayer {
  RoomPlayer({
    required this.idDb, required this.clanId, required this.name,
    required this.xu, required this.level2, required this.gun,
    required this.equipIds, required this.isReady,
  });
  int idDb, xu, gun;
  int clanId, level2;
  String name;
  List<int> equipIds;
  bool isReady;
}

class RoomWaitState {
  const RoomWaitState({
    this.ownerId = -1, this.money = 0, this.mapId = 0, this.gameMode = 0,
    this.players = const [], this.joined = false,
  });
  final int ownerId, money, mapId, gameMode;
  final List<RoomPlayer> players;
  final bool joined;

  RoomWaitState copyWith({
    int? ownerId, int? money, int? mapId, int? gameMode,
    List<RoomPlayer>? players, bool? joined,
  }) => RoomWaitState(
    ownerId: ownerId ?? this.ownerId, money: money ?? this.money,
    mapId: mapId ?? this.mapId, gameMode: gameMode ?? this.gameMode,
    players: players ?? this.players, joined: joined ?? this.joined,
  );
}

class RoomService extends Notifier<RoomWaitState> {
  final _logger = Logger('RoomService');
  late final TcpSession _session;

  @override
  RoomWaitState build() {
    _session = ref.watch(tcpSessionProvider);
    final d = ref.watch(messageDispatcherProvider);
    d.register(Commands.joinRoomWait, _onJoinBoard);
    d.register(12, _onPlayerJoin);        // nguoi choi moi vao phong cho
    d.register(Commands.changeTeam, _onChangeTeam);
    d.register(Commands.selectMap, _onMapChanged);
    return const RoomWaitState();
  }

  /// cmd 8 — joinBoard response (day du danh sach).
  void _onJoinBoard(Message msg) {
    final r = msg.reader();
    final ownerId = r.readInt();
    final money = r.readInt();
    final mapId = r.readByte();
    final gameMode = r.readByte();
    final players = <RoomPlayer>[];
    while (r.available > 0) {
      final idDb = r.readInt();
      if (idDb == -1) continue;
      players.add(RoomPlayer(
        idDb: idDb,
        clanId: r.readShort(),
        name: r.readUTF(),
        xu: r.readInt(),
        level2: r.readUnsignedByte(),
        gun: r.readByte(),
        equipIds: [for (var i = 0; i < 5; i++) r.readShort()],
        isReady: r.readBoolean(),
      ));
    }
    // Chu phong luon ready
    for (final p in players) {
      if (p.idDb == ownerId) p.isReady = true;
    }
    state = state.copyWith(
      ownerId: ownerId, money: money, mapId: mapId,
      gameMode: gameMode, players: players, joined: true,
    );
  }

  /// cmd 12 — nguoi choi moi join luc dang cho.
  void _onPlayerJoin(Message msg) {
    final r = msg.reader();
    r.readByte(); // seat
    final idDb = r.readInt();
    final clanId = r.readShort();
    final name = r.readUTF();
    final level2 = r.readUnsignedByte();
    r.readByte(); // gun (phần con lai cua PlayerInfo gui sau — bo qua phien ban toi thieu)
    final players = [...state.players];
    if (!players.any((p) => p.idDb == idDb)) {
      players.add(RoomPlayer(
        idDb: idDb, clanId: clanId, name: name, xu: 0,
        level2: level2, gun: 0, equipIds: const [0, 0, 0, 0, 0],
        isReady: false,
      ));
      state = state.copyWith(players: players);
    }
  }

  void _onChangeTeam(Message msg) {
    final r = msg.reader();
    final userId = r.readInt();
    r.readByte(); // position — cap nhat lai seat khi co model seat
    _logger.info('Change team: $userId');
  }

  void _onMapChanged(Message msg) {
    final mId = msg.reader().readByte();
    state = state.copyWith(mapId: mId);
  }

  // -------------------------------------------------------- outgoing (GameService)

  /// ready(boolean) — cmd 16.
  Future<void> setReady(bool isReady) {
    final m = Message(16);
    m.writer().writeBoolean(isReady);
    return _session.sendMessage(m);
  }

  /// selectMap(byte) — cmd 70 "ChangeMap" (yeu cau doi map).
  Future<void> requestChangeMap(int mapId) {
    final m = Message(70);
    m.writer().writeByte(mapId);
    return _session.sendMessage(m);
  }

  /// startGame() — cmd 20 (chi chu phong).
  Future<void> startGame() => _session.sendMessage(Message(20));

  /// leaveRoomWait() — cmd 15.
  Future<void> leaveRoom() => _session.sendMessage(Message(Commands.leaveRoomWait));
}

final roomServiceProvider =
    NotifierProvider<RoomService, RoomWaitState>(RoomService.new);
```

### `D:\personal\army/lib\features\gameplay\data\character\equipment_manifest_parser.dart`
```dart
import 'dart:convert';
import 'package:mobiarmy_flutter/features/gameplay/domain/character/equipment_definition.dart';

class EquipmentManifestParser {
  const EquipmentManifestParser();
  List<EquipmentDefinition> parse(String source) {
    final value = jsonDecode(source);
    if (value is! Map<String, dynamic> || value['schemaVersion'] != 1) {
      throw const FormatException('Unsupported equipment manifest schema');
    }
    final ids = <String>{};
    return (value['equipment'] as List<dynamic>)
        .map((raw) {
          final map = raw as Map<String, dynamic>;
          final id = map['id'] as int;
          final glassId = map['glassId'] as int;
          final key = '$glassId/${map['slot']}/$id';
          if (!ids.add(key)) throw FormatException('Duplicate equipment: $key');
          final frames = (map['frames'] as List<dynamic>)
              .map((frameRaw) {
                final frame = frameRaw as Map<String, dynamic>;
                final geometry = EquipmentFrameGeometry(
                  sourceX: frame['x'] as int,
                  sourceY: frame['y'] as int,
                  width: frame['w'] as int,
                  height: frame['h'] as int,
                  offsetX: frame['dx'] as int,
                  offsetY: frame['dy'] as int,
                );
                if (geometry.width <= 0 || geometry.height <= 0) {
                  throw FormatException('Invalid frame size: $key');
                }
                return geometry;
              })
              .toList(growable: false);
          return EquipmentDefinition(
            id: id,
            slot: EquipmentSlot.values.byName(map['slot'] as String),
            glassId: glassId,
            atlasId: map['atlasId'] as String,
            frames: frames,
            bulletId: map['bulletId'] as int? ?? -1,
          );
        })
        .toList(growable: false);
  }
}
```

### `D:\personal\army/lib\features\gameplay\domain\camera\camera_mode.dart`
```dart
enum CameraMode { playerFollow, bulletFollow, freePan, focusTarget }
```

### `D:\personal\army/lib\features\gameplay\domain\character\character_animation_state.dart`
```dart
import 'package:mobiarmy_flutter/features/gameplay/domain/character/character_definition.dart';

class CharacterAnimationState {
  const CharacterAnimationState({
    this.kind = CharacterAnimationKind.idle,
    this.frame = 0,
    this.elapsed = 0,
    this.facing = CharacterFacing.right,
  });
  final CharacterAnimationKind kind;
  final int frame;
  final double elapsed;
  final CharacterFacing facing;
  CharacterAnimationState copyWith({
    CharacterAnimationKind? kind,
    int? frame,
    double? elapsed,
    CharacterFacing? facing,
  }) => CharacterAnimationState(
    kind: kind ?? this.kind,
    frame: frame ?? this.frame,
    elapsed: elapsed ?? this.elapsed,
    facing: facing ?? this.facing,
  );
}
```

### `D:\personal\army/lib\features\gameplay\domain\character\character_appearance.dart`
```dart
import 'package:mobiarmy_flutter/features/gameplay/domain/character/equipment_definition.dart';

class CharacterAppearance {
  CharacterAppearance({
    required this.characterType,
    required Map<EquipmentSlot, int> equipmentIds,
  }) : equipmentIds = Map.unmodifiable(equipmentIds);
  final int characterType;
  final Map<EquipmentSlot, int> equipmentIds;
  int? operator [](EquipmentSlot slot) => equipmentIds[slot];
  CharacterAppearance equip(EquipmentSlot slot, int? id) {
    final next = Map<EquipmentSlot, int>.of(equipmentIds);
    id == null ? next.remove(slot) : next[slot] = id;
    return CharacterAppearance(
      characterType: characterType,
      equipmentIds: next,
    );
  }
}
```

### `D:\personal\army/lib\features\gameplay\domain\character\character_definition.dart`
```dart
enum CharacterFacing { right, left }

enum CharacterAnimationKind { idle, walk, aim, fire, hurt, death }

class CharacterDefinition {
  const CharacterDefinition({
    required this.characterType,
    required this.bodyAtlasId,
    required this.frameCount,
    required this.anchorX,
    required this.anchorY,
  });
  final int characterType;
  final String bodyAtlasId;
  final int frameCount;
  final double anchorX;
  final double anchorY;
}
```

### `D:\personal\army/lib\features\gameplay\domain\character\equipment_definition.dart`
```dart
enum EquipmentSlot { gun, hat, armor, glasses, wing }

class EquipmentFrameGeometry {
  const EquipmentFrameGeometry({
    required this.sourceX,
    required this.sourceY,
    required this.width,
    required this.height,
    required this.offsetX,
    required this.offsetY,
  });
  final int sourceX, sourceY, width, height, offsetX, offsetY;
}

class EquipmentDefinition {
  EquipmentDefinition({
    required this.id,
    required this.slot,
    required this.glassId,
    required this.atlasId,
    required List<EquipmentFrameGeometry> frames,
    this.bulletId = -1,
  }) : frames = List.unmodifiable(frames) {
    if (frames.isEmpty) {
      throw ArgumentError.value(frames, 'frames', 'must not be empty');
    }
  }
  final int id;
  final EquipmentSlot slot;
  final int glassId;
  final String atlasId;
  final List<EquipmentFrameGeometry> frames;
  final int bulletId;

  EquipmentFrameGeometry frame(int index) =>
      frames[index.clamp(0, frames.length - 1).toInt()];
}
```

### `D:\personal\army/lib\features\gameplay\domain\player\player_movement_state.dart`
```dart
import 'package:flame/extensions.dart';

enum PlayerMovementKind { idle, walking, falling, dead }

class PlayerMovementState {
  PlayerMovementState({
    this.kind = PlayerMovementKind.idle,
    Vector2? velocity,
    this.isOnGround = false,
    this.stamina = 100.0,
  }) : velocity = velocity ?? Vector2.zero();

  final PlayerMovementKind kind;
  final Vector2 velocity;
  final bool isOnGround;
  final double stamina;

  PlayerMovementState copyWith({
    PlayerMovementKind? kind,
    Vector2? velocity,
    bool? isOnGround,
    double? stamina,
  }) {
    return PlayerMovementState(
      kind: kind ?? this.kind,
      velocity: velocity ?? this.velocity,
      isOnGround: isOnGround ?? this.isOnGround,
      stamina: stamina ?? this.stamina,
    );
  }
}
```

### `D:\personal\army/lib\features\gameplay\domain\room_list_models.dart`
```dart
import 'package:mobiarmy_flutter/core/network/protocol/message.dart';
import 'package:mobiarmy_flutter/core/network/data_cache_parsers.dart';

/// Port MessageHandler case -28 (roomWaitList):
///   raction (byte), roi lap: id(byte) != -1 -> boardID, mapID, cur/max, money(int)
///   id == -1 -> name (UTF) = dong tieu de khu vuc (subLevel)
class RoomInfoEntry {
  RoomInfoEntry.room({
    required this.id, required this.boardId, required this.mapId,
    required this.playerMax, required this.money,
  }) : name = null;
  RoomInfoEntry.header(this.name) : id = -1, boardId = 0, mapId = 0, playerMax = '', money = 0;
  final int id, boardId, mapId, money;
  final String playerMax;
  final String? name;

  String get displayName {
    if (name != null) return name!;
    final mapName = mapId == 100 ? 'Ngau nhien' : (mapId < DataCache.mapNames.length ? DataCache.mapNames[mapId] : '');
    return 'P$id-$boardId ($mapName)';
  }
}

abstract final class RoomListParser {
  static List<RoomInfoEntry> parse(Message msg) {
    final r = msg.reader();
    r.readByte(); // raction
    final out = <RoomInfoEntry>[];
    while (r.available > 0) {
      final id = r.readByte();
      if (id != -1) {
        out.add(RoomInfoEntry.room(
          id: id,
          boardId: r.readByte(),
          mapId: r.readByte(),
          playerMax: '${r.readByte()}/${r.readByte()}',
          money: r.readInt(),
        ));
      } else {
        out.add(RoomInfoEntry.header(r.readUTF()));
      }
    }
    return out;
  }
}
```

### `D:\personal\army/lib\features\gameplay\game\army_game.dart`
```dart
import 'package:flame/components.dart';
import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:mobiarmy_flutter/features/gameplay/game/input/gameplay_input_controller.dart';
import 'package:mobiarmy_flutter/features/gameplay/game/map/background_component.dart';
import 'package:mobiarmy_flutter/features/gameplay/game/map/destructible_terrain.dart';
import 'package:mobiarmy_flutter/features/gameplay/game/map/game_map_definition.dart';
import 'package:mobiarmy_flutter/features/gameplay/game/map/terrain_component.dart';
import 'package:mobiarmy_flutter/features/gameplay/game/player/game_player.dart';
import 'package:mobiarmy_flutter/features/gameplay/game/projectile/projectile_component.dart';
import 'package:mobiarmy_flutter/features/gameplay/game/projectile/projectile_trajectory.dart';
import 'package:mobiarmy_flutter/features/gameplay/game/projectile/trajectory_simulator.dart';
import 'package:mobiarmy_flutter/features/gameplay/game/sandbox/sandbox_scenario.dart';
import 'package:mobiarmy_flutter/features/gameplay/game/systems/camera_system.dart';
import 'package:mobiarmy_flutter/features/gameplay/game/systems/player_collision_system.dart';
import 'package:mobiarmy_flutter/features/gameplay/game/systems/player_movement_system.dart';

class ArmyGame extends FlameGame {
  ArmyGame({this.scenario, this.onLoaded});

  final SandboxScenario? scenario;
  final VoidCallback? onLoaded;

  late final GameplayInputController inputController;
  late final World gameWorld;
  late final CameraSystem cameraSystem;

  DestructibleTerrain? terrain;
  GameMapDefinition? map;
  final Map<int, GamePlayer> players = {};
  TerrainComponent? _terrainComponent;

  @override
  Color backgroundColor() => const Color(0xFF0F172A);

  @override
  Future<void> onLoad() async {
    await super.onLoad();

    gameWorld = World();
    await add(gameWorld);

    inputController = GameplayInputController();
    await add(inputController);

    await add(PlayerMovementSystem());
    await add(PlayerCollisionSystem());
    cameraSystem = CameraSystem();
    await add(cameraSystem);

    camera.viewfinder.anchor = Anchor.center;

    final scenario = this.scenario;
    if (scenario != null) {
      map = scenario.map;
      terrain = scenario.terrain;
      await gameWorld.add(
        BackgroundComponent(
          environment: scenario.map.environment,
          mapSize: Vector2(
            scenario.map.width.toDouble(),
            scenario.map.height.toDouble(),
          ),
        ),
      );
      final terrainComponent = TerrainComponent(terrain: scenario.terrain);
      _terrainComponent = terrainComponent;
      await gameWorld.add(terrainComponent);
      for (var i = 0; i < scenario.characters.length; i++) {
        final character = scenario.characters[i];
        await gameWorld.add(character);
        players[i] = character;
      }
    }

    onLoaded?.call();
  }

  /// Entry point for network replay (command 22), reused by offline fire().
  void spawnProjectile(ProjectileTrajectory trajectory) {
    gameWorld.add(
      ProjectileComponent(trajectory: trajectory, onImpact: _onBulletImpact),
    );
  }

  /// Offline shot: legacy force range is 1..30 (charge bar), angle comes from
  /// the input controller, trajectory uses the Q10 legacy math from Phase 2.
  void fire(double rawForce) {
    final me = players[0];
    final terrain = this.terrain;
    final map = this.map;
    if (me == null || terrain == null || map == null) return;

    final force = rawForce.round().clamp(1, 30);
    final trajectories = TrajectorySimulator.simulate(
      bulletId: 0,
      gunX: me.x.round(),
      gunY: (me.y - 12).round(),
      width: 20,
      height: 20,
      ang: inputController.state.angle,
      force: force,
      windX: 0,
      windY: 0,
      mapWidth: map.width,
      mapHeight: map.height,
      isCollision: terrain.isSolid,
    );
    for (final trajectory in trajectories) {
      spawnProjectile(trajectory);
    }
  }

  void _onBulletImpact(int x, int y) {
    _terrainComponent?.makeHole(x, y, 18);
    cameraSystem.shake(intensity: 3, duration: 0.25);
  }

  void pauseSafely() {
    if (!paused) pauseEngine();
  }

  void resumeSafely() {
    if (paused) resumeEngine();
  }

  bool get isEnginePaused => paused;
}
```

### `D:\personal\army/lib\features\gameplay\game\effects\effects.dart`
```dart
import 'dart:ui' as ui;
import 'package:flame/components.dart';
import 'package:mobiarmy_flutter/core/assets/game_asset_loader.dart';

/// Port effect/Explosion.java + Smoke.java — frame size lay DUNG tu source:
///   explode ex3.png 59x64 x6f | teleport 32x32 x5f | waterBum 32x48 x5f
///   Eff.png 40x40 x5f | mua.png 13x7 x3f | bomnguyentu 48x62 x4f (delay 3)
///   electric(2) 59x64 x8f (delay 2) | freeze 40x40 x5f (delay 2)
///   khoidoc 32x32 x5f (delay 2) | smoke 14x15 x4f | khoi 27x27 x4f ...
class ExplosionEffect extends Component {
  ExplosionEffect(this.type, this.x, this.y, {this.onDone});
  final int type; // 0 = no, 1 teleport, 2 waterBum, 7 nuke, 8/9 electric, 14 freeze, 15 khoidoc
  final double x, y;
  final void Function()? onDone;

  int curFrame = 0, delay = 0, maxDelay = 1;
  late final int frameW, frameH, endFrame;
  ui.Image? img;
  bool _loaded = false;

  @override
  Future<void> onLoad() async {
    final pack = GameAssets.effect;
    if (pack == null) {
      img = null;
      frameW = 1;
      frameH = 1;
      endFrame = 1;
      _loaded = true;
      return;
    }
    switch (type) {
      case 0: img = await pack.loadImage('ex3.png'); frameW = 59; frameH = 64; endFrame = 5;
      case 1: img = await pack.loadImage('teleport_eff.png'); frameW = 32; frameH = 32; endFrame = 4;
      case 2: img = await pack.loadImage('waterBum.png'); frameW = 32; frameH = 48; endFrame = 4;
      case 3: img = await pack.loadImage('Eff.png'); frameW = 40; frameH = 40; endFrame = 4;
      case 6: img = await pack.loadImage('mua.png'); frameW = 13; frameH = 7; endFrame = 2;
      case 7: img = await pack.loadImage('bomnguyentu.png'); frameW = 48; frameH = 62; endFrame = 3; maxDelay = 3;
      case 8: img = await pack.loadImage('electric.png'); frameW = 59; frameH = 64; endFrame = 7; maxDelay = 2;
      case 9: img = await pack.loadImage('electric2.png'); frameW = 59; frameH = 64; endFrame = 7; maxDelay = 2;
      case 14: img = await pack.loadImage('freeze.png'); frameW = 40; frameH = 40; endFrame = 4; maxDelay = 2;
      case 15: img = await pack.loadImage('khoidoc.png'); frameW = 32; frameH = 32; endFrame = 4; maxDelay = 2;
      default: img = await pack.loadImage('ex3.png'); frameW = 59; frameH = 64; endFrame = 5;
    }
    _loaded = true;
  }

  @override
  void update(double dt) {
    if (!_loaded) return;
    if (++delay > maxDelay) {
      delay = 0;
      if (++curFrame >= endFrame) {
        onDone?.call();
        removeFromParent();
      }
    }
  }

  @override
  void render(ui.Canvas canvas) {
    if (!_loaded || img == null) return;
    final sx = (curFrame * frameW) % img!.width;
    final sy = (curFrame * frameW ~/ img!.width) * frameH;
    canvas.drawImageRect(
      img!,
      ui.Rect.fromLTWH(sx.toDouble(), sy.toDouble(), frameW.toDouble(), frameH.toDouble()),
      ui.Rect.fromLTWH(x - frameW / 2, y - frameH / 2 - 12, frameW.toDouble(), frameH.toDouble()),
      ui.Paint(),
    );
  }
}
```

### `D:\personal\army/lib\features\gameplay\game\input\gameplay_input_controller.dart`
```dart
import 'package:flame/components.dart';
import 'package:flutter/foundation.dart';

import 'gameplay_input_state.dart';

class GameplayInputController extends Component with ChangeNotifier {
  GameplayInputState _state = const GameplayInputState();
  GameplayInputState get state => _state;

  /// Speed of charging, 100 units in 2 seconds
  static const double chargeSpeed = 50.0;

  void updateAngle(int delta) {
    // Legacy MobiArmy2 angle often cycles or clamps.
    // Let's cycle it for a better feel.
    var newAngle = _state.angle + delta;
    if (newAngle < 0) newAngle += 360;
    if (newAngle >= 360) newAngle -= 360;

    _state = _state.copyWith(angle: newAngle);
    notifyListeners();
  }

  void startCharging() {
    _state = _state.copyWith(isCharging: true, force: 0);
    notifyListeners();
  }

  /// Returns the final force when charging stops.
  double stopCharging() {
    final finalForce = _state.force;
    _state = _state.copyWith(isCharging: false);
    notifyListeners();
    return finalForce;
  }

  void setMovingLeft(bool active) {
    _state = _state.copyWith(movingLeft: active);
    notifyListeners();
  }

  void setMovingRight(bool active) {
    _state = _state.copyWith(movingRight: active);
    notifyListeners();
  }

  @override
  void update(double dt) {
    if (_state.isCharging) {
      final newForce = (_state.force + dt * chargeSpeed).clamp(0.0, 100.0);
      _state = _state.copyWith(force: newForce);
      notifyListeners();
    }
  }
}
```

### `D:\personal\army/lib\features\gameplay\game\input\gameplay_input_state.dart`
```dart
class GameplayInputState {
  const GameplayInputState({
    this.angle = 0,
    this.force = 0,
    this.isCharging = false,
    this.movingLeft = false,
    this.movingRight = false,
  });

  final int angle;
  final double force;
  final bool isCharging;
  final bool movingLeft;
  final bool movingRight;

  GameplayInputState copyWith({
    int? angle,
    double? force,
    bool? isCharging,
    bool? movingLeft,
    bool? movingRight,
  }) {
    return GameplayInputState(
      angle: angle ?? this.angle,
      force: force ?? this.force,
      isCharging: isCharging ?? this.isCharging,
      movingLeft: movingLeft ?? this.movingLeft,
      movingRight: movingRight ?? this.movingRight,
    );
  }
}
```

### `D:\personal\army/lib\features\gameplay\game\map\background_component.dart`
```dart
import 'dart:ui';
import 'package:flame/components.dart';
import 'package:mobiarmy_flutter/features/gameplay/game/map/game_map_definition.dart';

class BackgroundComponent extends PositionComponent {
  BackgroundComponent({required this.environment, required Vector2 mapSize})
    : super(size: mapSize, priority: -100);
  final MapEnvironmentDefinition environment;
  @override
  void render(Canvas canvas) {
    canvas.drawRect(
      Rect.fromLTWH(0, 0, size.x, size.y),
      Paint()..color = const Color(0xff0f2742),
    );
    if (environment.hasWaterOrGlass) {
      canvas.drawRect(
        Rect.fromLTWH(
          0,
          environment.waterY.toDouble(),
          size.x,
          (size.y - environment.waterY).clamp(0.0, size.y).toDouble(),
        ),
        Paint()..color = const Color(0x6638bdf8),
      );
    }
  }
}
```

### `D:\personal\army/lib\features\gameplay\game\map\destructible_terrain.dart`
```dart
import 'dart:typed_data';

class DestructibleTerrain {
  DestructibleTerrain({
    required this.width,
    required this.height,
    required Uint8List initialMask,
  }) : _mask = initialMask;

  final int width;
  final int height;
  final Uint8List _mask; // 1 byte per pixel: 0 = air, 1 = solid

  bool isSolid(int x, int y) {
    if (x < 0 || x >= width || y < 0 || y >= height) return false;
    return _mask[y * width + x] != 0;
  }

  void makeHole(int centerX, int centerY, int radius) {
    final r2 = radius * radius;
    for (int y = centerY - radius; y <= centerY + radius; y++) {
      if (y < 0 || y >= height) continue;
      for (int x = centerX - radius; x <= centerX + radius; x++) {
        if (x < 0 || x >= width) continue;
        final dx = x - centerX;
        final dy = y - centerY;
        if (dx * dx + dy * dy <= r2) {
          _mask[y * width + x] = 0;
        }
      }
    }
  }

  Uint8List get mask => _mask;
}
```

### `D:\personal\army/lib\features\gameplay\game\map\game_map_definition.dart`
```dart
import 'dart:collection';

class MapFormatException implements FormatException {
  const MapFormatException(this.message, [this.source, this.offset]);
  @override
  final String message;
  @override
  final dynamic source;
  @override
  final int? offset;
}

class SpawnPoint {
  const SpawnPoint({required this.x, required this.y, this.team});
  final int x, y;
  final int? team;
}

class MapBrickDefinition {
  const MapBrickDefinition({
    required this.tileId,
    required this.x,
    required this.y,
    required this.destructible,
  });
  final int tileId, x, y;
  final bool destructible;
}

class MapLayerDefinition {
  const MapLayerDefinition({required this.id, required this.bricks});
  final String id;
  final List<MapBrickDefinition> bricks;
}

class TileSetDefinition {
  const TileSetDefinition({required this.id, required this.tileCount});
  final int id, tileCount;
}

class MapEnvironmentDefinition {
  const MapEnvironmentDefinition({
    required this.backgroundId,
    required this.backgroundY,
    required this.cloudY,
    required this.waterY,
    required this.waterClass,
  });
  final int backgroundId, backgroundY, cloudY, waterY, waterClass;
  bool get hasWaterOrGlass => waterClass != -1;
}

class GameMapDefinition {
  GameMapDefinition({
    required this.id,
    required this.width,
    required this.height,
    required List<MapLayerDefinition> layers,
    required List<SpawnPoint> spawnPoints,
    required this.environment,
  }) : layers = UnmodifiableListView(layers),
       spawnPoints = UnmodifiableListView(spawnPoints);
  final int id, width, height;
  final List<MapLayerDefinition> layers;
  final List<SpawnPoint> spawnPoints;
  final MapEnvironmentDefinition environment;
}
```

### `D:\personal\army/lib\features\gameplay\game\map\icon_preview.dart`
```dart
import 'dart:typed_data';
import 'dart:ui' as ui;
import 'package:mobiarmy_flutter/core/assets/file_pack_decoder.dart';

/// Port PrepareScr.init — icondata2 (sync cmd 90 type 1) LA FilePack chua:
///   "<mapFileName>.png" cho tung map (theo MM.mapFileName tu valuesdata2)
///   + "khungmap.png" (khung vien map trong UI chon map).
class MapIconPack {
  MapIconPack._(this.pack);
  final FilePack pack;
  static MapIconPack? instance;

  static Future<void> init(List<int> iconData2) async {
    instance = MapIconPack._(FilePackDecoder.decode(Uint8List.fromList(iconData2)));
  }

  Future<ui.Image?> mapPreview(String mapFileName) async {
    try {
      return await pack.loadImage('$mapFileName.png');
    } catch (_) {
      return null;
    }
  }

  Future<ui.Image?> khungMap() async {
    try {
      return await pack.loadImage('khungmap.png');
    } catch (_) {
      return null;
    }
  }
}
```

### `D:\personal\army/lib\features\gameplay\game\map\legacy_map_parser.dart`
```dart
import 'dart:typed_data';
import 'package:mobiarmy_flutter/features/gameplay/game/map/game_map_definition.dart';

class LegacyMapParser {
  const LegacyMapParser({this.isUndestroyableTile = neverUndestroyable});
  final bool Function(int tileId) isUndestroyableTile;
  static bool neverUndestroyable(int _) => false;

  GameMapDefinition parse({
    required int mapId,
    required Uint8List data,
    required List<int> environmentValues,
    List<SpawnPoint> spawnPoints = const [],
  }) {
    if (environmentValues.length < 5) {
      throw const MapFormatException('Map environment requires 5 values');
    }
    if (data.length < 5) {
      throw const MapFormatException('Map payload too short');
    }
    final reader = _Reader(data);
    final width = reader.u16();
    final height = reader.u16();
    final count = reader.u8();
    final requiredLength = 5 + count * 5;
    if (data.length < requiredLength) {
      throw MapFormatException('Truncated brick list', data, data.length);
    }
    final bricks = <MapBrickDefinition>[];
    for (var i = 0; i < count; i++) {
      final tileId = reader.u8();
      final x = reader.i16();
      final y = reader.i16();
      bricks.add(
        MapBrickDefinition(
          tileId: tileId,
          x: x,
          y: y,
          destructible: !isUndestroyableTile(tileId),
        ),
      );
    }
    if (reader.offset != data.length) {
      throw MapFormatException(
        'Unexpected trailing map bytes',
        data,
        reader.offset,
      );
    }
    return GameMapDefinition(
      id: mapId,
      width: width,
      height: height,
      layers: [
        MapLayerDefinition(id: 'terrain', bricks: List.unmodifiable(bricks)),
      ],
      spawnPoints: spawnPoints,
      environment: MapEnvironmentDefinition(
        backgroundId: environmentValues[0],
        backgroundY: environmentValues[1],
        cloudY: environmentValues[2],
        waterY: environmentValues[3],
        waterClass: environmentValues[4],
      ),
    );
  }
}

class _Reader {
  _Reader(this.data);
  final Uint8List data;
  int offset = 0;
  int u8() => data[offset++];
  int u16() {
    final v = (data[offset] << 8) | data[offset + 1];
    offset += 2;
    return v;
  }

  int i16() {
    final v = u16();
    return v >= 0x8000 ? v - 0x10000 : v;
  }
}
```

### `D:\personal\army/lib\features\gameplay\game\map\map_binary_parser.dart`
```dart
import 'dart:typed_data';

/// Port map/MM.loadMapFile — format nhi phan THAT cua fData (trong
/// valuesdata2, doc qua DataCache.mapFiles[i].data):
///   [2 bytes] mapWidth  (BE short)
///   [2 bytes] mapHeight (BE short)
///   [1 byte]  nLand
///   lap nLand:
///     [1 byte]  tileID
///     [2 bytes] x (BE short)
///     [2 bytes] y (BE short)
///
/// KHONG con can map JSON — day la du lieu map chuan tu server.
/// Luu y quan trong (khac voi sandbox hien tai):
///   - Va cham la PIXEL-ALPHA cua anh tile (MM.getImage(tileID) + hole mask),
///     KHONG phai hinh chu nhat brick. DestructibleTerrain dang dung mask
///     la approximation — can nang cap sau bang cach rasterize anh tile.
///   - Anh tile duoc nap rieng: tiledata2 (RMS) hoac getMaterialIcon cmd 126.
class MapBrickRaw {
  MapBrickRaw(this.tileId, this.x, this.y);
  final int tileId, x, y;
}

class BinaryMapData {
  BinaryMapData(this.width, this.height, this.bricks);
  final int width, height;
  final List<MapBrickRaw> bricks;
}

abstract final class MapBinaryParser {
  static BinaryMapData parse(Uint8List data) {
    var pos = 0;
    int u8() => data[pos++];
    int s16() {
      final v = (data[pos] << 8) | data[pos + 1];
      pos += 2;
      return v >= 0x8000 ? v - 0x10000 : v;
    }

    final w = s16();
    final h = s16();
    final n = u8();
    final bricks = <MapBrickRaw>[];
    for (var i = 0; i < n; i++) {
      bricks.add(MapBrickRaw(u8(), s16(), s16()));
    }
    return BinaryMapData(w, h, bricks);
  }
}
```

### `D:\personal\army/lib\features\gameplay\game\map\map_component.dart`
```dart
import 'dart:ui';
import 'package:flame/components.dart';
import 'package:mobiarmy_flutter/features/gameplay/game/map/game_map_definition.dart';

class MapComponent extends PositionComponent {
  MapComponent({
    required this.definition,
    required this.tileSize,
    this.debug = false,
  }) : super(
         size: Vector2(
           definition.width.toDouble(),
           definition.height.toDouble(),
         ),
       );
  final GameMapDefinition definition;
  final Vector2 tileSize;
  final bool debug;
  final Paint _fallback = Paint()..color = const Color(0xff64748b);
  @override
  void render(Canvas canvas) {
    super.render(canvas);
    for (final layer in definition.layers) {
      for (final brick in layer.bricks) {
        canvas.drawRect(
          Rect.fromLTWH(
            brick.x.toDouble(),
            brick.y.toDouble(),
            tileSize.x,
            tileSize.y,
          ),
          _fallback,
        );
      }
    }
    if (debug) {
      final p = Paint()
        ..color = const Color(0xffff00ff)
        ..style = PaintingStyle.stroke;
      canvas.drawRect(Rect.fromLTWH(0, 0, size.x, size.y), p);
    }
  }
}
```

### `D:\personal\army/lib\features\gameplay\game\map\map_debug_overlay.dart`
```dart
import 'dart:ui';
import 'package:flame/components.dart';
import 'package:mobiarmy_flutter/features/gameplay/game/map/game_map_definition.dart';

class MapDebugOverlay extends PositionComponent {
  MapDebugOverlay({required this.definition});
  final GameMapDefinition definition;
  @override
  void render(Canvas canvas) {
    final p = Paint()..color = const Color(0xff22c55e);
    for (final s in definition.spawnPoints) {
      canvas.drawCircle(Offset(s.x.toDouble(), s.y.toDouble()), 5, p);
    }
  }
}
```

### `D:\personal\army/lib\features\gameplay\game\map\map_json_loader.dart`
```dart
import 'dart:convert';

import 'package:mobiarmy_flutter/features/gameplay/game/map/game_map_definition.dart';

/// Parses MobiArmy2 server-style map JSON (as stored in the `map` table of
/// army.sql). This is the canonical FE map format going forward; the legacy
/// binary .map parser is only needed for asset parity checks.
class MapJsonLoader {
  const MapJsonLoader._();

  static GameMapDefinition parse(
    String source, {
    required int mapId,
    int backgroundId = 7,
    int backgroundY = 0,
    int cloudY = 0,
  }) {
    final value = jsonDecode(source);
    if (value is! Map<String, dynamic>) {
      throw const MapFormatException('Map JSON root must be an object');
    }

    final width = value['width'] as int?;
    final height = value['height'] as int?;
    if (width == null || height == null || width <= 0 || height <= 0) {
      throw const MapFormatException('Map JSON requires positive width/height');
    }

    final bricks = <MapBrickDefinition>[];
    final rawBricks = value['bricks'];
    if (rawBricks is List) {
      for (final raw in rawBricks) {
        final b = raw as Map<String, dynamic>;
        bricks.add(
          MapBrickDefinition(
            tileId: b['id'] as int,
            x: b['x'] as int,
            y: b['y'] as int,
            destructible: true,
          ),
        );
      }
    }

    final spawnPoints = <SpawnPoint>[];
    final rawPoints = value['points'];
    if (rawPoints is List) {
      var index = 0;
      for (final raw in rawPoints) {
        final p = raw as Map<String, dynamic>;
        spawnPoints.add(
          SpawnPoint(
            x: p['x'] as int,
            y: p['y'] as int,
            team: index.isEven ? 0 : 1,
          ),
        );
        index++;
      }
    }

    return GameMapDefinition(
      id: mapId,
      width: width,
      height: height,
      layers: [
        MapLayerDefinition(id: 'terrain', bricks: List.unmodifiable(bricks)),
      ],
      spawnPoints: List.unmodifiable(spawnPoints),
      environment: MapEnvironmentDefinition(
        backgroundId: backgroundId,
        backgroundY: backgroundY,
        cloudY: cloudY,
        waterY: height,
        waterClass: -1,
      ),
    );
  }
}
```

### `D:\personal\army/lib\features\gameplay\game\map\map_repository.dart`
```dart
import 'dart:typed_data';
import 'package:mobiarmy_flutter/features/gameplay/game/map/game_map_definition.dart';
import 'package:mobiarmy_flutter/features/gameplay/game/map/legacy_map_parser.dart';

abstract interface class MapDataSource {
  Future<Uint8List> loadMapBytes(int mapId);
  Future<List<int>> loadEnvironment(int mapId);
  Future<List<SpawnPoint>> loadSpawnPoints(int mapId);
}

class MapRepository {
  MapRepository({
    required this.source,
    LegacyMapParser parser = const LegacyMapParser(),
  }) : _parser = parser;
  final MapDataSource source;
  final LegacyMapParser _parser;
  Future<GameMapDefinition> load(int mapId) async => _parser.parse(
    mapId: mapId,
    data: await source.loadMapBytes(mapId),
    environmentValues: await source.loadEnvironment(mapId),
    spawnPoints: await source.loadSpawnPoints(mapId),
  );
}
```

### `D:\personal\army/lib\features\gameplay\game\map\map_world_controller.dart`
```dart
import 'package:flame/components.dart';
import 'package:mobiarmy_flutter/features/gameplay/game/map/background_component.dart';
import 'package:mobiarmy_flutter/features/gameplay/game/map/game_map_definition.dart';
import 'package:mobiarmy_flutter/features/gameplay/game/map/map_component.dart';
import 'package:mobiarmy_flutter/features/gameplay/game/map/map_debug_overlay.dart';

class MapWorldController {
  MapWorldController(this.world);
  final World world;
  Component? _current;
  Future<void> show(GameMapDefinition map, {bool debug = false}) async {
    if (_current != null) {
      _current!.removeFromParent();
      await _current!.removed;
    }
    final root = PositionComponent();
    await root.add(
      BackgroundComponent(
        environment: map.environment,
        mapSize: Vector2(map.width.toDouble(), map.height.toDouble()),
      ),
    );
    await root.add(
      MapComponent(definition: map, tileSize: Vector2.all(16), debug: debug),
    );
    if (debug) await root.add(MapDebugOverlay(definition: map));
    await world.add(root);
    _current = root;
  }

  Future<void> clear() async {
    final current = _current;
    if (current == null) return;
    current.removeFromParent();
    await current.removed;
    _current = null;
  }
}
```

### `D:\personal\army/lib\features\gameplay\game\map\terrain_component.dart`
```dart
import 'dart:typed_data';
import 'dart:ui' as ui;

import 'package:flame/components.dart';
import 'package:mobiarmy_flutter/features/gameplay/game/map/destructible_terrain.dart';
import 'package:mobiarmy_flutter/features/gameplay/game/map/game_map_definition.dart';

/// Builds a pixel collision mask from brick rectangles.
///
/// NOTE(phase-4): real tile widths vary per tile id (see ManagerTile in the
/// Java client); uniform [tileSize] is an approximation good enough for the
/// offline vertical slice.
abstract final class TerrainMaskBuilder {
  static DestructibleTerrain build(GameMapDefinition map, {int tileSize = 20}) {
    final mask = Uint8List(map.width * map.height);
    for (final layer in map.layers) {
      for (final brick in layer.bricks) {
        final x0 = brick.x.clamp(0, map.width);
        final x1 = (brick.x + tileSize).clamp(0, map.width);
        final y0 = brick.y.clamp(0, map.height);
        final y1 = (brick.y + tileSize).clamp(0, map.height);
        for (var y = y0; y < y1; y++) {
          final row = y * map.width;
          for (var x = x0; x < x1; x++) {
            mask[row + x] = 1;
          }
        }
      }
    }
    return DestructibleTerrain(
      width: map.width,
      height: map.height,
      initialMask: mask,
    );
  }
}

/// Renders the destructible terrain from the collision mask.
///
/// The rendered picture is cached and only rebuilt after a [makeHole] mutation,
/// so render() never iterates the full mask per frame.
class TerrainComponent extends PositionComponent {
  TerrainComponent({
    required DestructibleTerrain terrain,
    this.cellSize = 2,
    this.groundColor = const ui.Color(0xFF8B6F47),
  }) : _terrain = terrain,
       super(
         size: Vector2(terrain.width.toDouble(), terrain.height.toDouble()),
         priority: 0,
       );

  final DestructibleTerrain _terrain;
  final int cellSize;
  final ui.Color groundColor;

  ui.Picture? _cache;

  void makeHole(int centerX, int centerY, int radius) {
    _terrain.makeHole(centerX, centerY, radius);
    _cache = null; // lazy rebuild on next render
  }

  ui.Picture _buildCache() {
    final recorder = ui.PictureRecorder();
    final canvas = ui.Canvas(recorder);
    final paint = ui.Paint()..color = groundColor;
    final w = _terrain.width, h = _terrain.height;
    for (var cy = 0; cy < h; cy += cellSize) {
      for (var cx = 0; cx < w; cx += cellSize) {
        if (_terrain.isSolid(cx, cy)) {
          canvas.drawRect(
            ui.Rect.fromLTWH(
              cx.toDouble(),
              cy.toDouble(),
              cellSize.toDouble(),
              cellSize.toDouble(),
            ),
            paint,
          );
        }
      }
    }
    return recorder.endRecording();
  }

  @override
  void render(ui.Canvas canvas) {
    _cache ??= _buildCache();
    canvas.drawPicture(_cache!);
  }

  @override
  void onRemove() {
    _cache?.dispose();
    _cache = null;
    super.onRemove();
  }
}
```

### `D:\personal\army/lib\features\gameplay\game\player\character_animation_controller.dart`
```dart
import 'package:mobiarmy_flutter/features/gameplay/domain/character/character_animation_state.dart';
import 'package:mobiarmy_flutter/features/gameplay/domain/character/character_definition.dart';

class CharacterAnimationController {
  CharacterAnimationController({
    required this.framesPerKind,
    this.secondsPerFrame = 0.12,
  });
  final Map<CharacterAnimationKind, int> framesPerKind;
  final double secondsPerFrame;
  CharacterAnimationState update(CharacterAnimationState state, double dt) {
    final count = framesPerKind[state.kind] ?? 1;
    final elapsed = state.elapsed + dt;
    if (elapsed < secondsPerFrame) return state.copyWith(elapsed: elapsed);
    final advanced = (elapsed / secondsPerFrame).floor();
    return state.copyWith(
      frame: (state.frame + advanced) % count,
      elapsed: elapsed - advanced * secondsPerFrame,
    );
  }
}
```

### `D:\personal\army/lib\features\gameplay\game\player\character_component.dart`
```dart
import 'package:flame/components.dart';
import 'package:mobiarmy_flutter/features/gameplay/domain/character/character_animation_state.dart';
import 'package:mobiarmy_flutter/features/gameplay/domain/character/character_appearance.dart';
import 'package:mobiarmy_flutter/features/gameplay/domain/character/character_definition.dart';
import 'package:mobiarmy_flutter/features/gameplay/domain/character/equipment_definition.dart';
import 'package:mobiarmy_flutter/features/gameplay/domain/player/player_movement_state.dart';
import 'package:mobiarmy_flutter/features/gameplay/game/player/character_sprite_resolver.dart';
import 'package:mobiarmy_flutter/features/gameplay/game/player/equipment_layer_component.dart';

class CharacterComponent extends PositionComponent {
  CharacterComponent({
    required this.appearance,
    required this.glassId,
    required this.resolver,
    CharacterAnimationState animation = const CharacterAnimationState(),
    PlayerMovementState? movement,
  }) : _animation = animation,
       _movement = movement ?? PlayerMovementState();

  CharacterAppearance appearance;
  final int glassId;
  final CharacterSpriteResolver resolver;
  CharacterAnimationState _animation;
  PlayerMovementState _movement;
  final Map<EquipmentSlot, EquipmentLayerComponent> _layers = {};

  PlayerMovementState get movement => _movement;
  set movement(PlayerMovementState value) {
    _movement = value;
  }

  static const Map<EquipmentSlot, int> layerPriority = {
    EquipmentSlot.wing: 10,
    EquipmentSlot.gun: 20,
    EquipmentSlot.hat: 30,
    EquipmentSlot.armor: 40,
    EquipmentSlot.glasses: 50,
  };

  @override
  Future<void> onLoad() async {
    await super.onLoad();
    for (final slot in EquipmentSlot.values) {
      final layer = EquipmentLayerComponent(priority: layerPriority[slot]!);
      _layers[slot] = layer;
      await add(layer);
    }
    _synchronizeLayers();
  }

  void setAnimation(CharacterAnimationState value) {
    _animation = value;
    _synchronizeLayers();
  }

  void setAppearance(CharacterAppearance value) {
    appearance = value;
    _synchronizeLayers();
  }

  void moveTo(double x, double y) {
    // Simple teleport for now, can add lerp later
    position.setValues(x, y);
  }

  void _synchronizeLayers() {
    final left = _animation.facing == CharacterFacing.left;
    for (final slot in EquipmentSlot.values) {
      final id = appearance[slot];
      final resolved = id == null
          ? null
          : resolver.resolveEquipment(
              glassId: glassId,
              slot: slot,
              equipmentId: id,
              frame: _animation.frame,
            );
      _layers[slot]?.applyFrame(
        nextSprite: resolved?.sprite,
        offsetX: resolved?.offsetX ?? 0,
        offsetY: resolved?.offsetY ?? 0,
        facingLeft: left,
      );
    }
  }
}
```

### `D:\personal\army/lib\features\gameplay\game\player\character_sprite_resolver.dart`
```dart
import 'package:flame/sprite.dart';
import 'package:mobiarmy_flutter/core/assets/sprite_atlas_repository.dart';
import 'package:mobiarmy_flutter/features/gameplay/domain/character/character_definition.dart';
import 'package:mobiarmy_flutter/features/gameplay/domain/character/equipment_definition.dart';

class ResolvedCharacterFrame {
  const ResolvedCharacterFrame({
    required this.sprite,
    required this.offsetX,
    required this.offsetY,
  });
  final Sprite sprite;
  final double offsetX, offsetY;
}

class CharacterSpriteResolver {
  CharacterSpriteResolver({
    required this.atlases,
    required Map<int, CharacterDefinition> characters,
    required Iterable<EquipmentDefinition> equipment,
  }) : characters = Map.unmodifiable(characters),
       equipment = Map.unmodifiable({
         for (final item in equipment)
           _key(item.glassId, item.slot, item.id): item,
       });
  final SpriteAtlasRepository atlases;
  final Map<int, CharacterDefinition> characters;
  final Map<String, EquipmentDefinition> equipment;
  static String _key(int glassId, EquipmentSlot slot, int id) =>
      '$glassId/${slot.name}/$id';

  ResolvedCharacterFrame? resolveEquipment({
    required int glassId,
    required EquipmentSlot slot,
    required int equipmentId,
    required int frame,
  }) {
    final definition = equipment[_key(glassId, slot, equipmentId)];
    if (definition == null) return null;
    final geometry = definition.frame(frame);
    return ResolvedCharacterFrame(
      sprite: atlases.frame(definition.atlasId, '${definition.id}_$frame'),
      offsetX: geometry.offsetX.toDouble(),
      offsetY: geometry.offsetY.toDouble(),
    );
  }
}
```

### `D:\personal\army/lib\features\gameplay\game\player\equip_anchor.dart`
```dart
import 'dart:ui' as ui;

/// Port Equipment/Equip.drawImage + PlayerEquip.paint:
/// thu tu ve: SUNG(0) -> CANH(4) -> FACE(body) -> NON(1) -> GIAP(2) -> KINH(3).
///
/// Anchor dung (BAN BAT BUOC dung cong thuc nay, khong dung dx/dy tho):
///   W/H theo glass (bang cung trong Equip.java):
///     glass 0,1,2,4,5,8,9 -> 24 x 24
///     glass 3             -> 30 x 32
///     glass 6             -> 29 x 24
///     glass 7             -> 32 x 32
///   Look == 0 (quay phai):
///     dxDest = X - W/2 + dx[frame] + 18
///     dyDest = Y - H    + dy[frame] + 40
///   Look == 2 (quay trai, mirror):
///     dxDest = X + W/2 - (dx[frame] + 18)
///     dyDest = Y - H    + dy[frame] + 40   (anchor TOP|RIGHT)
abstract final class EquipAnchor {
  static const Map<int, List<int>> glassSize = {
    0: [24, 24], 1: [24, 24], 2: [24, 24], 4: [24, 24],
    5: [24, 24], 8: [24, 24], 9: [24, 24],
    3: [30, 32], 6: [29, 24], 7: [32, 32],
  };

  static int wOf(int glass) => glassSize[glass]?[0] ?? 24;
  static int hOf(int glass) => glassSize[glass]?[1] ?? 24;

  /// Tra ve Rect dich (top-left) de drawImageRect tu atlas imgData[glass].
  static ({double dx, double dy, bool mirror}) dest(
    int glass, int frame, int look, double charX, double charY,
    int srcX, int srcY, int srcW, int srcH, int offDx, int offDy,
  ) {
    final w = wOf(glass).toDouble();
    final h = hOf(glass).toDouble();
    if (look == 0) {
      return (
        dx: charX - w / 2 + offDx + 18,
        dy: charY - h + offDy + 40,
        mirror: false,
      );
    }
    // look == 2
    return (
      dx: charX + w / 2 - (offDx + 18),
      dy: charY - h + offDy + 40,
      mirror: true,
    );
  }
}

/// FACE (PlayerEquip.paintFace): body strip tu CPlayer.pImg[glass],
/// H = imgHeight / 10, lay region (0, frame*H, W, H), anchor BOTTOM|HCENTER.
abstract final class BodyStrip {
  static ui.Rect srcRegion(ui.Image bodyAtlas, int frame) {
    final h = bodyAtlas.height / 10.0;
    return ui.Rect.fromLTWH(0, frame * h, bodyAtlas.width.toDouble(), h);
  }
}
```

### `D:\personal\army/lib\features\gameplay\game\player\equipment_layer_component.dart`
```dart
import 'package:flame/components.dart';

class EquipmentLayerComponent extends SpriteComponent {
  EquipmentLayerComponent({required super.priority});
  void applyFrame({
    required Sprite? nextSprite,
    required double offsetX,
    required double offsetY,
    required bool facingLeft,
  }) {
    sprite = nextSprite;
    position.setValues(facingLeft ? -offsetX : offsetX, offsetY);
    scale.x = facingLeft ? -1 : 1;
  }
}
```

### `D:\personal\army/lib\features\gameplay\game\player\game_player.dart`
```dart
import 'package:flame/components.dart';
import 'package:mobiarmy_flutter/features/gameplay/domain/player/player_movement_state.dart';

/// Common contract for anything controllable in the sandbox, so that both the
/// placeholder sandbox character and the real [CharacterComponent] can be
/// driven by PlayerMovementSystem / PlayerCollisionSystem.
abstract base class GamePlayer extends PositionComponent {
  PlayerMovementState get movement;
  set movement(PlayerMovementState value);
  void moveTo(double x, double y);
}
```

### `D:\personal\army/lib\features\gameplay\game\player\online_character.dart`
```dart
import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:mobiarmy_flutter/core/network/data_cache_parsers.dart';
import 'package:mobiarmy_flutter/features/gameplay/domain/player/player_movement_state.dart';
import 'package:mobiarmy_flutter/features/gameplay/game/player/equip_anchor.dart';
import 'package:mobiarmy_flutter/features/gameplay/game/player/game_player.dart';
import 'package:mobiarmy_flutter/features/gameplay/game/player/player_sprites.dart';

/// Nhan vat online THAT: body strip tu PlayerSprites (playerdata2 FilePack)
/// + trang bi ve dung cong thuc EquipAnchor (+18/+40, W/H theo glass,
/// mirror khi quay trai, thu tu: SUNG->CANH->FACE->NON->GIAP->KINH).
///
/// Atlas trang bi (PlayerEquip.imgData[glass]) nap qua getMaterialIcon
/// cmd 126 — truyen vao [equipAtlas] neu da co; chua co thi ve placeholder
/// rect dung anchor that de kiem chung vi tri.
final class OnlineCharacter extends GamePlayer {
  OnlineCharacter({
    required this.glassId,
    required this.equipIds,       // 5 slot: gun, hat, armor, glasses, wing
    required this.name,
    this.maxHp = 1000,
    this.equipAtlas,
  });

  final int glassId;
  final List<int> equipIds;
  final String name;
  final int maxHp;
  ui.Image? equipAtlas;           // imgData[glass] — TODO nap tu cmd 126
  ui.Image? _body;

  int hp = 1000;
  int look = 0;                   // 0 = phai, 2 = trai
  int frame = 0;                  // 0..5 animation frame
  bool isReady = false;

  @override
  PlayerMovementState movement = PlayerMovementState(isOnGround: true);

  @override
  void moveTo(double x, double y) => position.setValues(x, y);

  Future<void> load() async {
    _body = await PlayerSprites.instance.body(glassId);
  }

  List<EquipEntry?> get _slots => [
    _find(0), // gun
    _find(1), // hat
    _find(2), // armor
    _find(3), // glasses
    _find(4), // wing
  ];

  EquipEntry? _find(int slotType) {
    final id = slotType < equipIds.length ? equipIds[slotType] : 0;
    for (final e in DataCache.equips) {
      if (e.glass == glassId && e.type == slotType && e.id == id) return e;
    }
    return null;
  }

  @override
  void render(Canvas canvas) {
    final f = frame.clamp(0, 5);

    // 1. SUNG (slot 0) — ve TRUOC body
    _drawSlot(canvas, _slots[0], f);
    // 2. CANH (slot 4)
    _drawSlot(canvas, _slots[4], f);
    // 3. FACE — body strip, anchor BOTTOM|HCENTER, H = height/10
    if (_body != null) {
      final src = BodyStrip.srcRegion(_body!, f);
      final dst = Rect.fromLTWH(-_body!.width / 2, -_body!.height / 10,
          _body!.width.toDouble(), _body!.height / 10);
      _drawMirrored(canvas, _body!, src, dst);
    } else {
      canvas.drawRect(const Rect.fromLTWH(-8, -26, 16, 26),
          Paint()..color = const Color(0xFF94A3B8));
    }
    // 4. NON (1) -> 5. GIAP (2) -> 6. KINH (3)
    _drawSlot(canvas, _slots[1], f);
    _drawSlot(canvas, _slots[2], f);
    _drawSlot(canvas, _slots[3], f);

    // Thanh HP + ten
    _drawHpBar(canvas);
  }

  void _drawSlot(Canvas canvas, EquipEntry? e, int f) {
    if (e == null) return;
    final g = e.frames[f.clamp(0, e.frames.length - 1)];
    final d = EquipAnchor.dest(
      glassId, f, look, 0, 0, g.x, g.y, g.w, g.h, g.dx, g.dy,
    );
    if (equipAtlas != null) {
      final src = Rect.fromLTWH(
          g.x.toDouble(), g.y.toDouble(), g.w.toDouble(), g.h.toDouble());
      final dst = Rect.fromLTWH(
          d.dx - (look == 2 ? g.w.toDouble() : 0), d.dy,
          g.w.toDouble(), g.h.toDouble());
      _drawMirrored(canvas, equipAtlas!, src, dst);
    } else {
      // Placeholder dung anchor that (kiem chung vi tri truoc khi co atlas)
      canvas.drawRect(
        Rect.fromLTWH(d.dx, d.dy, g.w.toDouble(), g.h.toDouble()),
        Paint()..color = const Color(0x66F59E0B),
      );
    }
  }

  void _drawMirrored(Canvas canvas, ui.Image img, Rect src, Rect dst) {
    if (look == 2) {
      canvas.save();
      canvas.translate(dst.left + dst.width, 0);
      canvas.scale(-1, 1);
      canvas.drawImageRect(img, src,
          Rect.fromLTWH(0, dst.top, dst.width, dst.height), Paint());
      canvas.restore();
    } else {
      canvas.drawImageRect(img, src, dst, Paint());
    }
  }

  void _drawHpBar(Canvas canvas) {
    final pct = (hp / maxHp).clamp(0.0, 1.0);
    canvas.drawRect(Rect.fromLTWH(-20, -38, 40, 5),
        Paint()..color = Colors.black54);
    canvas.drawRect(Rect.fromLTWH(-20, -38, 40 * pct, 5),
        Paint()..color = pct > 0.3 ? Colors.green : Colors.red);
  }
}
```

### `D:\personal\army/lib\features\gameplay\game\player\player_sprites.dart`
```dart
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
```

### `D:\personal\army/lib\features\gameplay\game\player\sandbox_character_component.dart`
```dart
import 'dart:math' as math;
import 'dart:ui';

import 'package:mobiarmy_flutter/features/gameplay/domain/character/equipment_definition.dart';
import 'package:mobiarmy_flutter/features/gameplay/domain/player/player_movement_state.dart';
import 'package:mobiarmy_flutter/features/gameplay/game/player/game_player.dart';

/// Placeholder character for the offline vertical slice.
///
/// Renders a body box plus one rect per equipment slot using the REAL frame
/// geometry (dx/dy/w/h) from the server `equip` table, so layer offsets and
/// anchor conventions are exercised before real sprites land (Phase 3/5).
final class SandboxCharacterComponent extends GamePlayer {
  SandboxCharacterComponent({
    required this.slotEquipment,
    required this.bodyColor,
    this.aimAngle = 45,
  });

  final Map<EquipmentSlot, EquipmentDefinition> slotEquipment;
  final Color bodyColor;
  int aimAngle;

  PlayerMovementState _movement = PlayerMovementState(isOnGround: true);

  @override
  PlayerMovementState get movement => _movement;

  @override
  set movement(PlayerMovementState value) => _movement = value;

  @override
  void moveTo(double x, double y) => position.setValues(x, y);

  static const Map<EquipmentSlot, Color> _slotColors = {
    EquipmentSlot.gun: Color(0xFF475569),
    EquipmentSlot.hat: Color(0xFFDC2626),
    EquipmentSlot.armor: Color(0xFF2563EB),
    EquipmentSlot.glasses: Color(0xFFF59E0B),
    EquipmentSlot.wing: Color(0xFF10B981),
  };

  @override
  void render(Canvas canvas) {
    // Body: feet at (0,0), head up.
    canvas.drawRect(
      const Rect.fromLTWH(-8, -26, 16, 26),
      Paint()..color = bodyColor,
    );

    // Aim indicator using the legacy angle convention (0 = right, 90 = up).
    final radians = aimAngle * math.pi / 180.0;
    final aimPaint = Paint()
      ..color = const Color(0xFFFFEB3B)
      ..strokeWidth = 2;
    canvas.drawLine(
      const Offset(0, -12),
      Offset(math.cos(radians) * 36, -12 - math.sin(radians) * 36),
      aimPaint,
    );

    // Equipment placeholders with real dx/dy/w/h offsets.
    for (final slot in EquipmentSlot.values) {
      final definition = slotEquipment[slot];
      if (definition == null) continue;
      final g = definition.frame(0);
      canvas.drawRect(
        Rect.fromLTWH(
          g.offsetX.toDouble(),
          g.offsetY.toDouble(),
          g.width.toDouble(),
          g.height.toDouble(),
        ),
        Paint()..color = _slotColors[slot] ?? const Color(0xFF9CA3AF),
      );
    }
  }
}
```

### `D:\personal\army/lib\features\gameplay\game\projectile\bullet_simulator.dart`
```dart
import 'projectile_trajectory.dart';

class BulletSimulator {
  BulletSimulator({
    required this.bulletId,
    required this.x,
    required this.y,
    required this.vx,
    required this.vy,
    required this.ax100,
    required this.ay100,
    required this.g100,
  }) : bX = x,
       bY = y,
       xOld = x,
       yOld = y,
       lastX = x,
       lastY = y;

  final int bulletId;
  int x, y;
  int bX, bY;
  int vx, vy;
  int ax100, ay100, g100;

  int vxTemp = 0;
  int vyTemp = 0;
  int vyTemp2 = 0;
  int xOld, yOld;
  int lastX, lastY;
  bool collect = false;
  int frame = 0;

  final List<TrajectoryFrame> frames = [];

  void nextXY(
    int mapWidth,
    int mapHeight,
    bool Function(int x, int y) isCollision,
  ) {
    frame++;
    frames.add(TrajectoryFrame(x: bX, y: bY));

    if (bX < -100 ||
        bX > mapWidth + 100 ||
        bY > mapHeight + 100 ||
        bY < -999999) {
      collect = true;
      return;
    }

    xOld = bX;
    yOld = bY;
    bX = lastX = bX + vx;
    bY = lastY = bY + vy;

    final collision = _getCollision(xOld, yOld, bX, bY, isCollision);
    if (collision != null) {
      bX = collision[0];
      bY = collision[1];
      frames.add(TrajectoryFrame(x: bX, y: bY));
      collect = true;
    } else {
      vxTemp += ax100.abs();
      vyTemp += ay100.abs();
      vyTemp2 += g100;

      if (vxTemp.abs() >= 100) {
        if (ax100 > 0) {
          vx += vxTemp ~/ 100;
        } else {
          vx -= vxTemp ~/ 100;
        }
        vxTemp %= 100;
      }

      if (vyTemp.abs() >= 100) {
        if (ay100 > 0) {
          vy += vyTemp ~/ 100;
        } else {
          vy -= vyTemp ~/ 100;
        }
        vyTemp %= 100;
      }

      if (vyTemp2.abs() >= 100) {
        vy += vyTemp2 ~/ 100;
        vyTemp2 %= 100;
      }
    }
  }

  List<int>? _getCollision(
    int x1,
    int y1,
    int x2,
    int y2,
    bool Function(int x, int y) isCollision,
  ) {
    int dx = x2 - x1;
    int dy = y2 - y1;
    int xUnit = dx < 0 ? -1 : (dx > 0 ? 1 : 0);
    int yUnit = dy < 0 ? -1 : (dy > 0 ? 1 : 0);
    int xUnit2 = xUnit;
    int yUnit2 = yUnit;

    int k1 = dx.abs();
    int k2 = dy.abs();

    if (k1 > k2) {
      yUnit2 = 0;
    } else {
      k1 = dy.abs();
      k2 = dx.abs();
      xUnit2 = 0;
    }

    int k = k1 >> 1;
    int currX = x1;
    int currY = y1;

    for (int i = 0; i <= k1; i++) {
      if (isCollision(currX, currY)) {
        return [currX, currY];
      }
      k += k2;
      if (k >= k1) {
        k -= k1;
        currX += xUnit;
        currY += yUnit;
      } else {
        currX += xUnit2;
        currY += yUnit2;
      }
    }
    return null;
  }
}
```

### `D:\personal\army/lib\features\gameplay\game\projectile\projectile_component.dart`
```dart
import 'dart:ui';

import 'package:flame/components.dart';
import 'package:mobiarmy_flutter/features/gameplay/game/projectile/projectile_trajectory.dart';

/// Plays back a server-computed (or offline-simulated) trajectory frame list.
class ProjectileComponent extends PositionComponent {
  ProjectileComponent({
    required this.trajectory,
    this.onImpact,
    this.stepsPerSecond = 60,
  }) : super(anchor: Anchor.center, priority: 20);

  final ProjectileTrajectory trajectory;
  final void Function(int x, int y)? onImpact;
  final double stepsPerSecond;

  int _frame = 0;
  double _accumulator = 0;

  @override
  Future<void> onLoad() async {
    await super.onLoad();
    if (trajectory.frames.isNotEmpty) {
      final first = trajectory.frames.first;
      position.setValues(first.x.toDouble(), first.y.toDouble());
    }
  }

  @override
  void update(double dt) {
    super.update(dt);
    _accumulator += dt * stepsPerSecond;
    while (_accumulator >= 1) {
      _accumulator -= 1;
      _frame++;
      if (_frame >= trajectory.frames.length) {
        final frames = trajectory.frames;
        if (frames.isNotEmpty) {
          onImpact?.call(frames.last.x, frames.last.y);
        }
        removeFromParent();
        return;
      }
      final frame = trajectory.frames[_frame];
      position.setValues(frame.x.toDouble(), frame.y.toDouble());
    }
  }

  @override
  void render(Canvas canvas) {
    // TODO(phase-3): replace with the real bullet sprite from assets.
    canvas.drawCircle(Offset.zero, 3, Paint()..color = const Color(0xFFFFEB3B));
  }
}
```

### `D:\personal\army/lib\features\gameplay\game\projectile\projectile_trajectory.dart`
```dart
class TrajectoryFrame {
  const TrajectoryFrame({required this.x, required this.y});

  final int x;
  final int y;
}

class ProjectileTrajectory {
  const ProjectileTrajectory({required this.bulletId, required this.frames});

  final int bulletId;
  final List<TrajectoryFrame> frames;
}
```

### `D:\personal\army/lib\features\gameplay\game\projectile\trajectory_simulator.dart`
```dart
import 'package:mobiarmy_flutter/core/legacy_math/legacy_trigonometry.dart';
import 'bullet_simulator.dart';
import 'projectile_trajectory.dart';

class TrajectorySimulator {
  static List<ProjectileTrajectory> simulate({
    required int bulletId,
    required int gunX,
    required int gunY,
    required int width,
    required int height,
    required int ang,
    required int force,
    required int windX,
    required int windY,
    required int mapWidth,
    required int mapHeight,
    required bool Function(int x, int y) isCollision,
    bool isPow = false,
  }) {
    final trajectories = <ProjectileTrajectory>[];

    // Initial position and velocity
    int bx = gunX + ((width - 4) * LegacyTrigonometry.cos(ang) >> 10);
    int by =
        gunY -
        (height ~/ 2) -
        ((height - 4) * LegacyTrigonometry.sin(ang) >> 10);
    int vx = force * LegacyTrigonometry.cos(ang) >> 10;
    int vy = -(force * LegacyTrigonometry.sin(ang) >> 10);

    // Simplified simulation based on Gun.java for Gunner (bulletId 0)
    // In a full implementation, this switch would cover all bullet types
    final ax100 = (windX * 80) ~/ 100;
    final ay100 = (windY * 80) ~/ 100;
    const g100 = 100;

    final bullet = BulletSimulator(
      bulletId: bulletId,
      x: bx,
      y: by,
      vx: vx,
      vy: vy,
      ax100: ax100,
      ay100: ay100,
      g100: g100,
    );

    while (!bullet.collect && bullet.frame < 1000) {
      bullet.nextXY(mapWidth, mapHeight, isCollision);
    }

    trajectories.add(
      ProjectileTrajectory(bulletId: bulletId, frames: bullet.frames),
    );

    return trajectories;
  }
}
```

### `D:\personal\army/lib\features\gameplay\game\sandbox\sandbox_equipment_data.dart`
```dart
import 'package:mobiarmy_flutter/features/gameplay/domain/character/equipment_definition.dart';

/// Embedded subset of the server `equip` table (army.sql) for the offline
/// vertical slice. Each equip row carries 6 frame entries, matching the
/// client's 6 animation frames per equipment.
class SandboxEquipmentData {
  const SandboxEquipmentData._();

  static EquipmentDefinition _row({
    required int id,
    required EquipmentSlot slot,
    required int glassId,
    int bulletId = -1,
    required List<int> x,
    required List<int> y,
    required List<int> w,
    required List<int> h,
    required List<int> dx,
    required List<int> dy,
  }) {
    assert(
      x.length == y.length && y.length == w.length && w.length == h.length,
    );
    final frames = <EquipmentFrameGeometry>[
      for (var i = 0; i < x.length; i++)
        EquipmentFrameGeometry(
          sourceX: x[i],
          sourceY: y[i],
          width: w[i],
          height: h[i],
          offsetX: dx[i],
          offsetY: dy[i],
        ),
    ];
    return EquipmentDefinition(
      id: id,
      slot: slot,
      glassId: glassId,
      atlasId: 'placeholder',
      frames: frames,
      bulletId: bulletId,
    );
  }

  /// glassId 0 (Gunner) starter set: nón/áo/súng/kính cannon 1.
  static List<EquipmentDefinition> gunnerSet() => [
    _row(
      id: 3,
      slot: EquipmentSlot.hat,
      glassId: 0,
      x: [53, 53, 68, 55, 53, 53],
      y: [40, 40, 0, 0, 40, 40],
      w: [14, 14, 13, 13, 14, 14],
      h: [11, 11, 13, 14, 11, 11],
      dx: [-14, -13, -7, -7, -13, -13],
      dy: [-38, -38, -36, -36, -39, -38],
    ),
    _row(
      id: 4,
      slot: EquipmentSlot.armor,
      glassId: 0,
      x: [75, 80, 42, 81, 91, 29],
      y: [57, 28, 39, 13, 41, 14],
      w: [11, 11, 11, 13, 11, 11],
      h: [8, 10, 12, 15, 10, 9],
      dx: [-13, -12, -12, -12, -12, -12],
      dy: [-24, -26, -28, -31, -26, -25],
    ),
    _row(
      id: 5,
      slot: EquipmentSlot.gun,
      glassId: 0,
      bulletId: 1,
      x: [19, 18, 0, 40, 19, 19],
      y: [23, 63, 61, 14, 23, 23],
      w: [20, 25, 19, 13, 20, 20],
      h: [19, 13, 20, 25, 19, 19],
      dx: [-18, -20, -16, -18, -17, -17],
      dy: [-35, -31, -36, -42, -36, -35],
    ),
    _row(
      id: 11,
      slot: EquipmentSlot.glasses,
      glassId: 0,
      x: [0, 0, 13, 13, 0, 0],
      y: [81, 81, 81, 81, 81, 81],
      w: [7, 7, 6, 6, 7, 7],
      h: [5, 5, 6, 6, 5, 5],
      dx: [-14, -13, -7, -8, -13, -13],
      dy: [-30, -30, -33, -34, -31, -30],
    ),
  ];

  /// glassId 1 (Miss 6) starter set: ak series.
  static List<EquipmentDefinition> miss6Set() => [
    _row(
      id: 20,
      slot: EquipmentSlot.hat,
      glassId: 1,
      x: [14, 14, 34, 34, 14, 14],
      y: [23, 23, 43, 43, 23, 23],
      w: [19, 19, 17, 17, 19, 19],
      h: [18, 18, 20, 20, 18, 18],
      dx: [-15, -15, -12, -12, -15, -15],
      dy: [-38, -39, -40, -41, -40, -39],
    ),
    _row(
      id: 21,
      slot: EquipmentSlot.armor,
      glassId: 1,
      x: [120, 81, 81, 22, 81, 109],
      y: [57, 41, 41, 43, 32, 57],
      w: [11, 10, 10, 12, 10, 11],
      h: [9, 10, 10, 11, 9, 9],
      dx: [-13, -12, -11, -12, -12, -13],
      dy: [-25, -25, -25, -27, -25, -25],
    ),
    _row(
      id: 24,
      slot: EquipmentSlot.gun,
      glassId: 1,
      bulletId: 2,
      x: [0, 92, 114, 101, 0, 0],
      y: [62, 23, 0, 0, 62, 62],
      w: [22, 23, 18, 13, 22, 22],
      h: [18, 13, 22, 23, 18, 18],
      dx: [-22, -22, -17, -15, -21, -21],
      dy: [-34, -32, -43, -48, -35, -34],
    ),
  ];
}
```

### `D:\personal\army/lib\features\gameplay\game\sandbox\sandbox_scenario.dart`
```dart
import 'dart:ui';

import 'package:mobiarmy_flutter/features/gameplay/game/map/destructible_terrain.dart';
import 'package:mobiarmy_flutter/features/gameplay/game/map/game_map_definition.dart';
import 'package:mobiarmy_flutter/features/gameplay/game/map/map_json_loader.dart';
import 'package:mobiarmy_flutter/features/gameplay/game/map/terrain_component.dart';
import 'package:mobiarmy_flutter/features/gameplay/game/player/sandbox_character_component.dart';
import 'package:mobiarmy_flutter/features/gameplay/game/sandbox/sandbox_equipment_data.dart';
import 'package:mobiarmy_flutter/features/gameplay/game/systems/ground_probe.dart';

/// Self-contained offline scenario: real map data + real equipment geometry,
/// no server, no assets required. This is Mốc A from the migration plan.
class SandboxScenario {
  SandboxScenario._({
    required this.map,
    required this.terrain,
    required this.characters,
  });

  final GameMapDefinition map;
  final DestructibleTerrain terrain;
  final List<SandboxCharacterComponent> characters;

  static SandboxScenario buildDefault() {
    final map = MapJsonLoader.parse(
      SandboxMaps.cayCauBang,
      mapId: 0,
      backgroundId: 7,
    );
    final terrain = TerrainMaskBuilder.build(
      map,
      tileSize: SandboxMaps.tileSize,
    );
    final probe = GroundProbe(terrain);

    SandboxCharacterComponent spawn(
      int spawnIndex,
      List<dynamic> equipment,
      Color bodyColor,
    ) {
      final point = map.spawnPoints[spawnIndex % map.spawnPoints.length];
      final groundY =
          probe.findGroundBelow(point.x.toDouble(), point.y.toDouble()) ??
          point.y.toDouble();
      final character = SandboxCharacterComponent(
        slotEquipment: {for (final e in equipment) e.slot as dynamic: e},
        bodyColor: bodyColor,
      );
      character.moveTo(point.x.toDouble(), groundY);
      return character;
    }

    final characters = [
      // Spawn points 4/5 land on the two side platforms (y=404 row).
      spawn(4, SandboxEquipmentData.gunnerSet(), const Color(0xFFF97316)),
      spawn(5, SandboxEquipmentData.miss6Set(), const Color(0xFF22D3EE)),
    ];

    return SandboxScenario._(
      map: map,
      terrain: terrain,
      characters: characters,
    );
  }
}

abstract final class SandboxMaps {
  /// Approximate brick size; real per-tile widths vary (ManagerTile parity
  /// is a Phase-4 item).
  static const int tileSize = 20;

  /// Server map id 0 — "Cây cầu băng" (`map` table, army.sql).
  /// TODO(phase-3): move to assets/maps/map_0.json once the asset pipeline
  /// exists; embedded here so the slice runs with zero asset setup.
  static const String cayCauBang =
      r'''{"width":480,"height":320,"bricks":[{"id":1,"x":0,"y":300},{"id":1,"x":20,"y":300},{"id":1,"x":40,"y":300},{"id":1,"x":60,"y":300},{"id":1,"x":80,"y":300},{"id":1,"x":100,"y":300},{"id":1,"x":120,"y":300},{"id":1,"x":140,"y":300},{"id":1,"x":160,"y":300},{"id":1,"x":180,"y":300},{"id":1,"x":200,"y":300},{"id":1,"x":220,"y":300},{"id":1,"x":240,"y":300},{"id":1,"x":260,"y":300},{"id":1,"x":280,"y":300},{"id":1,"x":300,"y":300},{"id":1,"x":320,"y":300},{"id":1,"x":340,"y":300},{"id":1,"x":360,"y":300},{"id":1,"x":380,"y":300},{"id":1,"x":400,"y":300},{"id":1,"x":420,"y":300},{"id":1,"x":440,"y":300},{"id":1,"x":460,"y":300}],"points":[{"x":120,"y":280},{"x":360,"y":280},{"x":80,"y":280},{"x":400,"y":280},{"x":160,"y":280},{"x":320,"y":280}]}''';
}
```

### `D:\personal\army/lib\features\gameplay\game\systems\camera_system.dart`
```dart
import 'package:flame/components.dart';
import 'package:mobiarmy_flutter/features/gameplay/domain/camera/camera_mode.dart';
import 'package:mobiarmy_flutter/features/gameplay/game/army_game.dart';
import 'package:mobiarmy_flutter/features/gameplay/game/projectile/projectile_component.dart';
import 'package:mobiarmy_flutter/features/gameplay/game/systems/screen_shake_effect.dart';

class CameraSystem extends Component with HasGameReference<ArmyGame> {
  CameraMode mode = CameraMode.playerFollow;
  Component? _followApplied;

  void shake({double intensity = 5.0, double duration = 0.5}) {
    add(ScreenShakeEffect(intensity: intensity, duration: duration));
  }

  @override
  void update(double dt) {
    super.update(dt);
    _updateTarget();
    _applyClamping();
  }

  void _applyFollow(PositionComponent target, double maxSpeed) {
    if (_followApplied == target) return;
    _followApplied = target;
    game.camera.follow(target, maxSpeed: maxSpeed);
  }

  void _updateTarget() {
    final projectiles = game.gameWorld.children.query<ProjectileComponent>();
    final PositionComponent? target;
    final double maxSpeed;
    if (projectiles.isNotEmpty) {
      mode = CameraMode.bulletFollow;
      target = projectiles.first;
      maxSpeed = 1000;
    } else {
      mode = CameraMode.playerFollow;
      target = game.players[0];
      maxSpeed = 400;
    }
    if (target != null) _applyFollow(target, maxSpeed);
  }

  void _applyClamping() {
    final terrain = game.terrain;
    if (terrain == null) return;

    final viewportSize = game.camera.viewport.size;
    final halfWidth = viewportSize.x / 2;
    final halfHeight = viewportSize.y / 2;

    final minX = halfWidth;
    final maxX = terrain.width - halfWidth;
    final minY = halfHeight;
    final maxY = terrain.height - halfHeight;

    var pos = game.camera.viewfinder.position;

    if (maxX > minX) {
      pos.x = pos.x.clamp(minX, maxX);
    } else {
      pos.x = terrain.width / 2;
    }

    if (maxY > minY) {
      pos.y = pos.y.clamp(minY, maxY);
    } else {
      pos.y = terrain.height / 2;
    }

    game.camera.viewfinder.position = pos;
  }
}
```

### `D:\personal\army/lib\features\gameplay\game\systems\combat_system.dart`
```dart
import 'package:flame/components.dart';

import '../projectile/projectile_component.dart';

class CombatSystem extends Component with HasGameReference {
  // Logic for managing turns, shooting, and damage

  void onShoot(ProjectileComponent projectile) {
    game.add(projectile);
  }
}
```

### `D:\personal\army/lib\features\gameplay\game\systems\ground_probe.dart`
```dart
import '../map/destructible_terrain.dart';

class GroundProbe {
  const GroundProbe(this.terrain);

  final DestructibleTerrain terrain;

  /// Returns true if the point [x, y] is on or inside solid terrain.
  bool isSolid(double x, double y) {
    return terrain.isSolid(x.toInt(), y.toInt());
  }

  /// Finds the y-coordinate of the ground directly below [x, startY].
  /// Returns null if no ground is found within [maxDistance].
  double? findGroundBelow(double x, double startY, {double maxDistance = 500}) {
    for (int dy = 0; dy < maxDistance; dy++) {
      final y = startY + dy;
      if (terrain.isSolid(x.toInt(), y.toInt())) {
        return y;
      }
    }
    return null;
  }

  /// Checks if a player of [width] at [x, y] is colliding with terrain.
  bool isColliding(double x, double y, double width, double height) {
    // Basic implementation: check bottom corners and middle
    final left = x - width / 2;
    final right = x + width / 2;
    final bottom = y;

    return isSolid(left, bottom) ||
        isSolid(right, bottom) ||
        isSolid(x, bottom);
  }
}
```

### `D:\personal\army/lib\features\gameplay\game\systems\legacy_camera.dart`
```dart
import 'dart:math' as math;

/// Port effect/Camera.java — camera cua GameScr.
/// Di chuyen bang exponential ease: x -= (x - target) >> rangeBit.
/// Gioi han: restrict(0, mapWidth, -1000, mapHeight - screenH).
/// Shake: type 1 = ±5 x 10 frame; type 2 = ±20 x 10 frame;
///        type 3 = rung doc deltaY giam dan (20 -> 0) x 30 frame.
class LegacyCamera {
  static const int free = 0;
  static const int player = 1;
  static const int bullet = 2;
  static const int airPlane = 3;
  static const int targetPoint = 4;
  static const int targetPointNoRestrict = 5;
  static const int lazer = 6;
  static const int meteor = 7;
  static const int missileRain = 8;

  int mode = free;
  int x = 0, y = 0;
  int startx = 0, starty = 0;
  int mapWidth = 800, mapHeight = 600;
  int screenW = 400, screenH = 240;

  // shake state
  int shaking = 0; // 0 = off, 1/2/3 = type
  int _shakeCount = 0;
  int _deltaY = 20;

  // bullet target
  int bulletX = 0, bulletY = 0;
  int bulletType = 0, bulletAngle = 0;

  // player target
  int playerX = 0, playerY = 0, playerLook = 0;
  bool yourTurn = false;
  int playerState = 0;

  // target point
  int _setIndexX = 0, _setIndexY = 0;
  bool isTrackingBullet = false;

  void setFreeMode() {
    mode = free;
  }

  void setPlayerMode(int px, int py, int look, bool isYourTurn, int state) {
    mode = player;
    playerX = px; playerY = py; playerLook = look;
    yourTurn = isYourTurn; playerState = state;
  }

  void setBulletMode(int bx, int by, int type, int angle, int paintCount) {
    mode = bullet;
    bulletX = bx; bulletY = by; bulletType = type; bulletAngle = angle;
    isTrackingBullet = true;
  }

  void setTargetPointMode(int ix, int iy) {
    mode = targetPoint;
    _setIndexX = ix - screenW ~/ 2;
    _setIndexY = iy - screenH ~/ 2;
  }

  void update() {
    startx = x;
    starty = y;
    var indexX = 0, indexY = 0;
    switch (mode) {
      case player:
        if (playerLook == 0) {
          indexX = playerX - 40 - screenW ~/ 2;
        } else if (playerLook == 2) {
          indexX = playerX + 40 - screenW ~/ 2;
        }
        indexY = playerY - screenH ~/ 2 - 12;
        _checkIndex(indexX, indexY, (yourTurn && playerState != 1) ? 0 : 4);
        break;
      case bullet:
        if (isTrackingBullet &&
            !(bulletType == 37 && (bulletAngle == -90 || bulletAngle == 270) && bulletY > -300)) {
          indexX = bulletX - screenW ~/ 2;
          indexY = bulletY - screenH ~/ 2;
          _checkIndex(indexX, indexY, bulletType == 37 ? 1 : 2);
        }
        break;
      case targetPoint:
        _checkIndex(_setIndexX, _setIndexY, 2);
        break;
      case lazer:
      case meteor:
        _checkIndex(bulletX - screenW ~/ 2, bulletY - screenH ~/ 3, 1);
        break;
      case missileRain:
        _checkIndex(playerX - screenW ~/ 2, bulletY - screenH ~/ 2, 2);
        break;
    }
    _updateShake();
    if (mode != targetPointNoRestrict) {
      restrict();
    }
  }

  void _checkIndex(int indexX, int indexY, int rangeBit) {
    if (x != indexX) x -= (x - indexX) >> rangeBit;
    if (y != indexY) y -= (y - indexY) >> rangeBit;
  }

  void _updateShake() {
    if (shaking == 0) return;
    if (shaking == 1) {
      x += _rnd(-5, 5);
      y += _rnd(-5, 5);
    } else if (shaking == 2) {
      x += _rnd(-20, 20);
      y += _rnd(-20, 20);
    } else if (shaking == 3) {
      y += (_shakeCount % 3 == 0) ? _deltaY : -_deltaY;
      if (_shakeCount % 2 == 0) _deltaY--;
      if (_deltaY < 0) _deltaY = 0;
    }
    _shakeCount++;
    final limit = shaking != 3 ? 10 : 30;
    if (_shakeCount > limit) {
      _deltaY = 20;
      shaking = 0;
      _shakeCount = 0;
    }
  }

  void restrict() {
    if (y < -1000) y = -1000;
    if (y > mapHeight - screenH) y = mapHeight - screenH;
    if (x < 0) x = 0;
    if (x > mapWidth - screenW) x = mapWidth - screenW;
  }

  static int _rnd(int a, int b) => a + math.Random().nextInt(b - a);
}
```

### `D:\personal\army/lib\features\gameplay\game\systems\player_collision_system.dart`
```dart
import 'package:flame/components.dart';
import 'package:mobiarmy_flutter/features/gameplay/domain/player/player_movement_state.dart';
import 'package:mobiarmy_flutter/features/gameplay/game/army_game.dart';
import 'package:mobiarmy_flutter/features/gameplay/game/systems/ground_probe.dart';

class PlayerCollisionSystem extends Component with HasGameReference<ArmyGame> {
  static const double gravity = 400.0;
  static const double terminalVelocity = 600.0;

  @override
  void update(double dt) {
    super.update(dt);
    final terrain = game.terrain;
    if (terrain == null) return;

    final probe = GroundProbe(terrain);

    for (final player in game.players.values) {
      var movement = player.movement;
      if (movement.kind == PlayerMovementKind.dead) continue;

      if (!movement.isOnGround) {
        final velocity = movement.velocity;
        velocity.y += gravity * dt;
        if (velocity.y > terminalVelocity) {
          velocity.y = terminalVelocity;
        }
        player.movement = movement.copyWith(velocity: velocity);
        movement = player.movement;
      }

      final nextY = player.y + movement.velocity.y * dt;

      if (probe.isSolid(player.x, nextY)) {
        final groundY = probe.findGroundBelow(player.x, player.y);
        if (groundY != null) {
          player.y = groundY;
          player.movement = movement.copyWith(
            velocity: Vector2(movement.velocity.x, 0),
            isOnGround: true,
            kind: movement.velocity.x != 0
                ? PlayerMovementKind.walking
                : PlayerMovementKind.idle,
          );
        }
      } else {
        player.y = nextY;
        if (movement.isOnGround || movement.velocity.y > 0) {
          player.movement = movement.copyWith(
            isOnGround: false,
            kind: PlayerMovementKind.falling,
          );
        }
      }

      if (player.x < 0) player.x = 0;
      if (player.x > terrain.width) player.x = terrain.width.toDouble();
      if (player.y > terrain.height + 100) {
        player.movement = movement.copyWith(kind: PlayerMovementKind.dead);
      }
    }
  }
}
```

### `D:\personal\army/lib\features\gameplay\game\systems\player_movement_system.dart`
```dart
import 'package:flame/components.dart';
import 'package:mobiarmy_flutter/features/gameplay/domain/player/player_movement_state.dart';
import 'package:mobiarmy_flutter/features/gameplay/game/army_game.dart';

class PlayerMovementSystem extends Component with HasGameReference<ArmyGame> {
  static const double walkSpeed = 60.0;
  static const double staminaConsumption = 20.0; // per second

  @override
  void update(double dt) {
    super.update(dt);
    final input = game.inputController.state;

    // Sandbox: local player controls player 0. Online mode replaces this
    // with MovementIntent driven by command 21 packets.
    final myPlayer = game.players[0];
    if (myPlayer == null) return;

    var movement = myPlayer.movement;
    if (movement.kind == PlayerMovementKind.dead) return;

    double dx = 0;
    if (input.movingLeft) dx -= 1;
    if (input.movingRight) dx += 1;

    if (dx != 0 && movement.isOnGround && movement.stamina > 0) {
      final velocity = movement.velocity;
      velocity.x = dx * walkSpeed;

      final newStamina = (movement.stamina - staminaConsumption * dt).clamp(
        0.0,
        100.0,
      );

      myPlayer.x += velocity.x * dt;
      myPlayer.movement = movement.copyWith(
        velocity: velocity,
        stamina: newStamina,
        kind: PlayerMovementKind.walking,
      );
    } else {
      final velocity = movement.velocity;
      velocity.x = 0;
      myPlayer.movement = movement.copyWith(
        velocity: velocity,
        kind: movement.isOnGround
            ? PlayerMovementKind.idle
            : PlayerMovementKind.falling,
      );
    }
  }
}
```

### `D:\personal\army/lib\features\gameplay\game\systems\screen_shake_effect.dart`
```dart
import 'dart:math';
import 'package:flame/components.dart';
import '../army_game.dart';

class ScreenShakeEffect extends Component with HasGameReference<ArmyGame> {
  ScreenShakeEffect({this.intensity = 5.0, this.duration = 0.5});

  final double intensity;
  final double duration;
  double _elapsed = 0.0;
  final Random _random = Random();

  @override
  void update(double dt) {
    super.update(dt);
    _elapsed += dt;

    if (_elapsed < duration) {
      final double currentIntensity = intensity * (1.0 - (_elapsed / duration));
      final double shakeX = (_random.nextDouble() * 2 - 1) * currentIntensity;
      final double shakeY = (_random.nextDouble() * 2 - 1) * currentIntensity;

      // Apply shake to viewfinder offset
      game.camera.viewfinder.position += Vector2(shakeX, shakeY);
    } else {
      removeFromParent();
    }
  }
}
```

### `D:\personal\army/lib\features\gameplay\presentation\gameplay_page.dart`
```dart
import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../game/army_game.dart';

class GameplayPage extends ConsumerStatefulWidget {
  const GameplayPage({super.key});

  @override
  ConsumerState<GameplayPage> createState() => _GameplayPageState();
}

class _GameplayPageState extends ConsumerState<GameplayPage> {
  late final ArmyGame _game;

  @override
  void initState() {
    super.initState();
    _game = ArmyGame();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          GameWidget(game: _game),
          // HUD Overlay
          Positioned(bottom: 20, left: 20, child: _buildControls()),
        ],
      ),
    );
  }

  Widget _buildControls() {
    return Row(
      children: [
        IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {},
        ),
        IconButton(
          icon: const Icon(Icons.arrow_forward, color: Colors.white),
          onPressed: () {},
        ),
        const SizedBox(width: 20),
        ElevatedButton(
          onPressed: () {
            // Test shooting
          },
          child: const Text('SHOOT'),
        ),
      ],
    );
  }
}
```

### `D:\personal\army/lib\features\gameplay\presentation\gameplay_sandbox_screen.dart`
```dart
import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mobiarmy_flutter/app/lifecycle/app_lifecycle_coordinator.dart';
import 'package:mobiarmy_flutter/core/network/connection_lifecycle.dart';
import 'package:mobiarmy_flutter/features/gameplay/application/gameplay_provider.dart';
import 'package:mobiarmy_flutter/features/gameplay/game/army_game.dart';
import 'package:mobiarmy_flutter/features/gameplay/game/sandbox/sandbox_scenario.dart';
import 'package:mobiarmy_flutter/shared/overlays/gameplay_hud.dart';

class GameplaySandboxScreen extends ConsumerStatefulWidget {
  const GameplaySandboxScreen({super.key});

  @override
  ConsumerState<GameplaySandboxScreen> createState() =>
      _GameplaySandboxScreenState();
}

class _GameplaySandboxScreenState extends ConsumerState<GameplaySandboxScreen> {
  late final ArmyGame _game;
  late final AppLifecycleCoordinator _lifecycle;

  @override
  void initState() {
    super.initState();
    final scenario = SandboxScenario.buildDefault();
    _game = ArmyGame(scenario: scenario);
    _lifecycle = AppLifecycleCoordinator(
      game: _game,
      connection: NoopConnectionLifecycle(),
    )..start();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(gameplayHandlerProvider).attachGame(_game);
    });
  }

  @override
  void dispose() {
    ref.read(gameplayHandlerProvider).detachGame();
    _lifecycle.dispose();
    _game.pauseSafely();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
    body: SafeArea(
      child: Stack(
        children: [
          Positioned.fill(
            child: GameWidget<ArmyGame>(
              game: _game,
              overlayBuilderMap: {
                'HUD': (context, game) => GameplayHud(game: game),
              },
              initialActiveOverlays: const ['HUD'],
            ),
          ),
          const Positioned(
            top: 12,
            left: 12,
            child: DecoratedBox(
              decoration: BoxDecoration(
                color: Color(0xAA000000),
                borderRadius: BorderRadius.all(Radius.circular(12)),
              ),
              child: Padding(
                padding: EdgeInsets.all(10),
                child: Text('Gameplay sandbox — offline vertical slice'),
              ),
            ),
          ),
        ],
      ),
    ),
  );
}
```

### `D:\personal\army/lib\features\gameplay\presentation\lobby_screen.dart`
```dart
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mobiarmy_flutter/features/authentication/application/auth_controller.dart';
import 'package:mobiarmy_flutter/features/gameplay/application/lobby_service.dart';

/// Lobby: danh sach phong tu cmd -28. Thay PlaceholderScreen o route /lobby.
class LobbyScreen extends ConsumerStatefulWidget {
  const LobbyScreen({super.key});

  @override
  ConsumerState<LobbyScreen> createState() => _LobbyScreenState();
}

class _LobbyScreenState extends ConsumerState<LobbyScreen> {
  @override
  void initState() {
    super.initState();
    Future.microtask(
      () => ref.read(lobbyServiceProvider.notifier).requestRoomList(),
    );
  }

  @override
  Widget build(BuildContext context) {
    final rooms = ref.watch(lobbyServiceProvider);
    final auth = ref.watch(authControllerProvider);
    final session = auth.session;

    return Scaffold(
      appBar: AppBar(
        title: Text('MobiArmy — ${auth.server?.name ?? ''}'),
        actions: [
          if (session != null)
            Center(
              child: Padding(
                padding: const EdgeInsets.only(right: 12),
                child: Text('xu ${session.xu} · luong ${session.luong}'),
              ),
            ),
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () => ref.read(authControllerProvider.notifier).disconnect(),
          ),
        ],
      ),
      body: RefreshIndicator(
        onRefresh: () => ref.read(lobbyServiceProvider.notifier).requestRoomList(),
        child: rooms.isEmpty
            ? const Center(child: Text('Khong co phong nao — keo de tai lai'))
            : ListView.builder(
                itemCount: rooms.length,
                itemBuilder: (context, i) {
                  final r = rooms[i];
                  if (r.name != null) {
                    return Padding(
                      padding: const EdgeInsets.fromLTRB(16, 12, 16, 4),
                      child: Text(r.name!,
                          style: const TextStyle(fontWeight: FontWeight.bold)),
                    );
                  }
                  return Card(
                    margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 3),
                    child: ListTile(
                      dense: true,
                      title: Text(r.displayName),
                      subtitle: Text('Nguoi choi: ${r.playerMax}'),
                      trailing: const Icon(Icons.chevron_right),
                      onTap: () => ref
                          .read(lobbyServiceProvider.notifier)
                          .joinRoom(r.id, r.boardId),
                    ),
                  );
                },
              ),
      ),
    );
  }
}
```

### `D:\personal\army/lib\features\gameplay\presentation\offline_demo_screen.dart`
```dart
import 'dart:typed_data';

import 'package:flame/components.dart';
import 'package:mobiarmy_flutter/features/gameplay/game/army_game.dart';
import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:mobiarmy_flutter/core/network/data_cache_parsers.dart';
import 'package:mobiarmy_flutter/features/gameplay/game/map/game_map_definition.dart';
import 'package:mobiarmy_flutter/features/gameplay/game/map/map_binary_parser.dart';
import 'package:mobiarmy_flutter/features/gameplay/game/map/terrain_component.dart';
import 'package:mobiarmy_flutter/features/gameplay/game/player/online_character.dart';
import 'package:mobiarmy_flutter/features/gameplay/game/player/player_sprites.dart';
import 'package:mobiarmy_flutter/features/gameplay/game/systems/ground_probe.dart';

/// MAN DEMO OFFLINE = dung asset THAT, khong can server, chay duoc tren web.
///
/// Can: copy cac file seed tu repo goc desktop/assets/rms/ vao assets/rms/:
///   valuesdata2, equipdata2, playerdata2, levelCData2
/// (cac file nay la cache tu server — du de render map nhi phan + nhan vat
/// that voi body + trang bi).
class OfflineDemoScreen extends StatefulWidget {
  const OfflineDemoScreen({super.key});
  @override
  State<OfflineDemoScreen> createState() => _OfflineDemoScreenState();
}

class _OfflineDemoScreenState extends State<OfflineDemoScreen> {
  ArmyGame? _game;
  String _status = 'Dang nap du lieu seed...';

  @override
  void initState() {
    super.initState();
    _start();
  }

  Future<Uint8List?> _seed(String name) async {
    try {
      final bd = await rootBundle.load('assets/rms/' + name);
      return bd.buffer.asUint8List();
    } catch (_) {
      return null;
    }
  }

  Future<void> _start() async {
    // 1. Parse du lieu seed (giong sendMapData doc RMS local)
    final values = await _seed('valuesdata2');
    final equips = await _seed('equipdata2');
    final players = await _seed('playerdata2');
    if (values == null || equips == null || players == null) {
      setState(() => _status =
          'Thieu seed! Copy desktop/assets/rms/{valuesdata2,equipdata2,playerdata2,levelCData2} vao assets/rms/');
      return;
    }
    DataCacheParsers.parseMapList(values);
    DataCacheParsers.parseEquipTree(equips);
    await PlayerSprites.init(players);

    // 2. Map 0 nhi phan THAT
    final entry = DataCache.mapFiles[0];
    final bin = MapBinaryParser.parse(entry.data);
    final bricks = [
      for (final b in bin.bricks)
        MapBrickDefinition(tileId: b.tileId, x: b.x, y: b.y, destructible: true),
    ];
    final map = GameMapDefinition(
      id: 0, width: bin.width, height: bin.height,
      layers: [MapLayerDefinition(id: 'terrain', bricks: bricks)],
      spawnPoints: const [],
      environment: MapEnvironmentDefinition(
        backgroundId: entry.values[0], backgroundY: entry.values[1],
        cloudY: entry.values[2], waterY: bin.height, waterClass: -1,
      ),
    );
    final terrain = TerrainMaskBuilder.build(map, tileSize: 20);
    final probe = GroundProbe(terrain);

    // 3. Game + camera
    final game = ArmyGame();
    await game.onLoad();
    game.map = map;
    game.terrain = terrain;
    game.camera.viewfinder.position = Vector2(bin.width / 2, bin.height / 2);
    await game.gameWorld.add(TerrainComponent(terrain: terrain));

    // 4. Hai nhan vat THAT: glass 0 (Gunner) + glass 1 (Miss 6),
    //    trang bi mac dinh id 3,4,5,11 va 20,21,24 (khop SandboxEquipmentData).
    Future<OnlineCharacter> spawn(
      int glass, List<int> equipIds, double x, Color c,
    ) async {
      final ch = OnlineCharacter(
        glassId: glass, equipIds: equipIds, name: 'Demo', maxHp: 1000,
      );
      await ch.load();
      final gy = probe.findGroundBelow(x, 0) ?? 400;
      ch.moveTo(x, gy);
      return ch;
    }

    final a = await spawn(0, const [5, 3, 4, 11, 0], 150, Colors.orange);
    final b = await spawn(1, const [24, 20, 21, 0, 0], 620, Colors.cyan);
    await game.gameWorld.add(a);
    await game.gameWorld.add(b);
    game.players[0] = a;
    game.players[1] = b;

    setState(() {
      _game = game;
      _status = 'OK — map ' +
          bin.width.toString() + 'x' + bin.height.toString() +
          ', ' + bricks.length.toString() + ' bricks, ' +
          DataCache.equips.length.toString() + ' equips';
    });
  }

  @override
  Widget build(BuildContext context) {
    final game = _game;
    return Scaffold(
      body: Stack(children: [
        if (game != null)
          Positioned.fill(child: GameWidget(game: game))
        else
          Center(child: Text(_status)),
        Positioned(
          top: 12, left: 12,
          child: Container(
            color: Colors.black54,
            padding: const EdgeInsets.all(8),
            child: Text(_status, style: const TextStyle(color: Colors.white)),
          ),
        ),
      ]),
    );
  }
}
```

### `D:\personal\army/lib\features\gameplay\presentation\online_game_screen.dart`
```dart
import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mobiarmy_flutter/features/gameplay/application/game_start_handler.dart';
import 'package:mobiarmy_flutter/features/gameplay/application/game_session_bootstrap.dart';
import 'package:mobiarmy_flutter/features/gameplay/application/online_game_service.dart';
import 'package:mobiarmy_flutter/features/gameplay/game/army_game.dart';
import 'package:mobiarmy_flutter/features/gameplay/game/map/background_component.dart';
import 'package:mobiarmy_flutter/features/gameplay/game/map/terrain_component.dart';
import 'package:mobiarmy_flutter/features/gameplay/game/systems/ground_probe.dart';
import 'package:mobiarmy_flutter/features/gameplay/game/player/sandbox_character_component.dart';

/// Man choi online: khoi tao ArmyGame tu GameSessionStart (cmd 20).
/// Sprite nhan vat that se thay SandboxCharacterComponent o pack sau —
/// hien tai dung placeholder + map/terrain THAT.
class OnlineGameScreen extends ConsumerStatefulWidget {
  const OnlineGameScreen({super.key});
  @override
  ConsumerState<OnlineGameScreen> createState() => _OnlineGameScreenState();
}

class _OnlineGameScreenState extends ConsumerState<OnlineGameScreen> {
  ArmyGame? _game;
  String? _error;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) => _start());
  }

  Future<void> _start() async {
    final session = ref.read(gameStartProvider);
    final setup = session == null ? null : GameSessionBootstrap.build(session);
    if (setup == null) {
      setState(() => _error = 'Khong khoi tao duoc map (chua sync valuesdata2?)');
      return;
    }
    final game = ArmyGame();
    await game.onLoad();
    game.map = setup.map;
    game.terrain = setup.terrain;
    await game.gameWorld.add(BackgroundComponent(
      environment: setup.map.environment,
      mapSize: Vector2(setup.map.width.toDouble(), setup.map.height.toDouble()),
    ));
    final terrainComponent = TerrainComponent(terrain: setup.terrain);
    await game.gameWorld.add(terrainComponent);
    game.players.clear();
    final probe = GroundProbe(setup.terrain);
    for (var i = 0; i < setup.spawnPoints.length; i++) {
      final sp = setup.spawnPoints[i];
      final gy = probe.findGroundBelow(sp.x.toDouble(), sp.y.toDouble()) ?? sp.y.toDouble();
      // TODO(pack sau): CharacterComponent that voi PlayerSprites + EquipAnchor
      final c = SandboxCharacterComponent(
        slotEquipment: const {},
        bodyColor: Colors.primaries[i % Colors.primaries.length],
      );
      c.moveTo(sp.x.toDouble(), gy);
      await game.gameWorld.add(c);
      game.players[i] = c;
    }
    // myIndex = vi tri cua minh trong playerX khac -1
    final myIdx = session?.playerX != null ? session!.playerX.indexWhere((x) => x != -1) : -1;
    await ref
      .read(onlineGameServiceProvider.notifier)
      .move(setup.spawnPoints[myIdx].x, setup.spawnPoints[myIdx].y);
    setState(() => _game = game);
  }

  @override
  Widget build(BuildContext context) {
    final hud = ref.watch(onlineGameServiceProvider);
    final game = _game;
    if (_error != null) {
      return Scaffold(body: Center(child: Text(_error!)));
    }
    if (game == null) {
      return const Scaffold(body: Center(child: CircularProgressIndicator()));
    }
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(child: GameWidget(game: game)),
          _buildHud(hud),
        ],
      ),
    );
  }

  Widget _buildHud(OnlineGameState hud) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Gio: ${hud.windX}',
                    style: const TextStyle(color: Colors.white, fontSize: 18)),
                const SizedBox(width: 16),
                Text(
                  hud.isMyTurn ? 'LUOT CUA BAN' : 'Doi thu...',
                  style: TextStyle(
                    color: hud.isMyTurn ? Colors.greenAccent : Colors.white70,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            const Spacer(),
            if (hud.isMyTurn && _game != null)
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  // TODO(pack sau): MovementControls + FireButton noi
                  // GameControls.shoot(type, gunX, gunY, angle, force 1..30)
                  FilledButton(
                    onPressed: () {
                      final me = _game!.players[0];
                      if (me != null) {
                        ref.read(onlineGameServiceProvider.notifier).shoot(
                          type: 0, gunX: me.x.round(), gunY: (me.y - 20).round(),
                          angle: 45, force: 15,
                        );
                      }
                    },
                    child: const Text('FIRE (test)'),
                  ),
                ],
              ),
          ],
        ),
      ),
    );
  }
}
```

### `D:\personal\army/lib\features\gameplay\presentation\room_screen.dart`
```dart
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:mobiarmy_flutter/core/network/data_cache_parsers.dart';
import 'package:mobiarmy_flutter/features/authentication/application/auth_controller.dart';
import 'package:mobiarmy_flutter/features/gameplay/application/room_service.dart';

/// Port PrepareScr (phase to thieu): danh sach nguoi choi, ready, doi map,
/// nut Start (chu phong). Thay PlaceholderScreen o route /room.
class RoomScreen extends ConsumerWidget {
  const RoomScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final room = ref.watch(roomServiceProvider);
    final auth = ref.watch(authControllerProvider);
    final myId = auth.session?.id ?? -1;
    final isOwner = room.ownerId == myId && myId != -1;
    final mapName = room.mapId == 100
        ? 'Ngau nhien'
        : (room.mapId < DataCache.mapNames.length
            ? DataCache.mapNames[room.mapId]
            : 'Map ${room.mapId}');

    return Scaffold(
      appBar: AppBar(
        title: Text('Phong cho — $mapName'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () async {
            await ref.read(roomServiceProvider.notifier).leaveRoom();
            if (context.mounted) context.go('/lobby');
          },
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text('Tien cuoc: ${room.money}'),
                if (isOwner)
                  OutlinedButton.icon(
                    icon: const Icon(Icons.map),
                    label: const Text('Doi map'),
                    onPressed: () => _pickMap(context, ref),
                  ),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: room.players.length,
              itemBuilder: (context, i) {
                final p = room.players[i];
                final owner = p.idDb == room.ownerId;
                return ListTile(
                  leading: Icon(
                    p.isReady ? Icons.check_circle : Icons.radio_button_unchecked,
                    color: p.isReady ? Colors.green : Colors.grey,
                  ),
                  title: Text(p.name + (owner ? '  (Chu phong)' : '')),
                  subtitle: Text('Level ${p.level2}'),
                );
              },
            ),
          ),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Row(
                children: [
                  Expanded(
                    child: FilledButton.tonal(
                      onPressed: () {
                        final me = room.players.where((p) => p.idDb == myId);
                        final ready = me.isEmpty ? true : !me.first.isReady;
                        ref.read(roomServiceProvider.notifier).setReady(ready);
                      },
                      child: Text(
                        (room.players.any((p) => p.idDb == myId && p.isReady))
                            ? 'Huy ready'
                            : 'Ready',
                      ),
                    ),
                  ),
                  if (isOwner) ...[
                    const SizedBox(width: 12),
                    Expanded(
                      child: FilledButton(
                        onPressed: () =>
                            ref.read(roomServiceProvider.notifier).startGame(),
                        child: const Text('BAT DAU'),
                      ),
                    ),
                  ],
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _pickMap(BuildContext context, WidgetRef ref) {
    showModalBottomSheet(
      context: context,
      builder: (ctx) => ListView(
        children: [
          for (var i = 0; i < DataCache.mapNames.length; i++)
            ListTile(
              title: Text(DataCache.mapNames[i]),
              onTap: () {
                ref.read(roomServiceProvider.notifier).requestChangeMap(i);
                Navigator.pop(ctx);
              },
            ),
        ],
      ),
    );
  }
}
```

### `D:\personal\army/lib\features\gameplay\presentation\widgets\aim_controls.dart`
```dart
import 'package:flutter/material.dart';
import '../../game/army_game.dart';

class AimControls extends StatelessWidget {
  const AimControls({super.key, required this.game});

  final ArmyGame game;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _AimButton(
          icon: Icons.keyboard_arrow_up,
          onPressed: () => game.inputController.updateAngle(1),
        ),
        const SizedBox(height: 8),
        _AimButton(
          icon: Icons.keyboard_arrow_down,
          onPressed: () => game.inputController.updateAngle(-1),
        ),
      ],
    );
  }
}

class _AimButton extends StatelessWidget {
  const _AimButton({required this.icon, required this.onPressed});

  final IconData icon;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      // For continuous update, we might want GestureDetector longPress or a custom timer,
      // but let's keep it simple for skeleton.
      child: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: Colors.black45,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: Colors.white24),
        ),
        child: Icon(icon, color: Colors.white, size: 24),
      ),
    );
  }
}
```

### `D:\personal\army/lib\features\gameplay\presentation\widgets\movement_controls.dart`
```dart
import 'package:flutter/material.dart';
import '../../game/army_game.dart';

class MovementControls extends StatelessWidget {
  const MovementControls({super.key, required this.game});

  final ArmyGame game;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        _MoveButton(
          icon: Icons.arrow_back,
          onPressedStart: () => game.inputController.setMovingLeft(true),
          onPressedEnd: () => game.inputController.setMovingLeft(false),
        ),
        const SizedBox(width: 8),
        _MoveButton(
          icon: Icons.arrow_forward,
          onPressedStart: () => game.inputController.setMovingRight(true),
          onPressedEnd: () => game.inputController.setMovingRight(false),
        ),
      ],
    );
  }
}

class _MoveButton extends StatelessWidget {
  const _MoveButton({
    required this.icon,
    required this.onPressedStart,
    required this.onPressedEnd,
  });

  final IconData icon;
  final VoidCallback onPressedStart;
  final VoidCallback onPressedEnd;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (_) => onPressedStart(),
      onTapUp: (_) => onPressedEnd(),
      onTapCancel: () => onPressedEnd(),
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: Colors.black45,
          shape: BoxShape.circle,
          border: Border.all(color: Colors.white24),
        ),
        child: Icon(icon, color: Colors.white, size: 32),
      ),
    );
  }
}
```

### `D:\personal\army/lib\features\gameplay\presentation\widgets\power_bar.dart`
```dart
import 'package:flutter/material.dart';

class PowerBar extends StatelessWidget {
  const PowerBar({super.key, required this.power});

  final double power; // 0.0 to 100.0

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      height: 20,
      decoration: BoxDecoration(
        color: Colors.black54,
        border: Border.all(color: Colors.white, width: 2),
      ),
      child: FractionallySizedBox(
        alignment: Alignment.centerLeft,
        widthFactor: power / 100.0,
        child: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.green, Colors.yellow, Colors.red],
            ),
          ),
        ),
      ),
    );
  }
}
```

### `D:\personal\army/lib\main.dart`
```dart
import 'package:mobiarmy_flutter/app/bootstrap.dart';

Future<void> main() async => bootstrap();
```

### `D:\personal\army/lib\shared\overlays\gameplay_hud.dart`
```dart
import 'package:flutter/material.dart';
import 'package:mobiarmy_flutter/features/gameplay/game/army_game.dart';
import 'package:mobiarmy_flutter/features/gameplay/presentation/widgets/aim_controls.dart';
import 'package:mobiarmy_flutter/features/gameplay/presentation/widgets/movement_controls.dart';
import 'package:mobiarmy_flutter/features/gameplay/presentation/widgets/power_bar.dart';

class GameplayHud extends StatelessWidget {
  const GameplayHud({super.key, required this.game});

  final ArmyGame game;

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: game.inputController,
      builder: (context, _) {
        return Stack(
          children: [
            Positioned(
              left: 20,
              bottom: 20,
              child: MovementControls(game: game),
            ),
            Positioned(
              right: 20,
              bottom: 20,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  AimControls(game: game),
                  const SizedBox(width: 20),
                  _FireButton(game: game),
                ],
              ),
            ),
            Positioned(
              left: 0,
              right: 0,
              bottom: 40,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  _AngleDisplay(game: game),
                  const SizedBox(height: 8),
                  SizedBox(
                    width: 300,
                    // Legacy force range is 1..30; PowerBar expects 0..100.
                    child: PowerBar(
                      power: game.inputController.state.force * (100 / 30),
                    ),
                  ),
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}

class _FireButton extends StatelessWidget {
  const _FireButton({required this.game});
  final ArmyGame game;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (_) => game.inputController.startCharging(),
      onTapUp: (_) {
        final force = game.inputController.stopCharging();
        game.fire(force);
      },
      onTapCancel: () => game.inputController.stopCharging(),
      child: Container(
        width: 80,
        height: 80,
        decoration: BoxDecoration(
          color: Colors.red.withOpacity(0.7),
          shape: BoxShape.circle,
          border: Border.all(color: Colors.white, width: 3),
          boxShadow: const [
            BoxShadow(color: Colors.black26, blurRadius: 10, spreadRadius: 2),
          ],
        ),
        child: const Center(
          child: Text(
            'FIRE',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
        ),
      ),
    );
  }
}

class _AngleDisplay extends StatelessWidget {
  const _AngleDisplay({required this.game});
  final ArmyGame game;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
      decoration: BoxDecoration(
        color: Colors.black54,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Text(
        'Angle: ${game.inputController.state.angle}°',
        style: const TextStyle(
          color: Colors.white,
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
```

### `D:\personal\army/lib\shared\theme\army_theme.dart`
```dart
import 'package:flutter/material.dart';

abstract final class ArmyTheme {
  static ThemeData get dark => ThemeData(
    brightness: Brightness.dark,
    colorScheme: ColorScheme.fromSeed(
      seedColor: const Color(0xFF38BDF8),
      brightness: Brightness.dark,
    ),
    scaffoldBackgroundColor: const Color(0xFF0F172A),
    useMaterial3: true,
  );
}
```

### `D:\personal\army/lib\shared\widgets\placeholder_screen.dart`
```dart
import 'package:flutter/material.dart';

class PlaceholderScreen extends StatelessWidget {
  const PlaceholderScreen({
    required this.title,
    this.message = 'Foundation placeholder',
    super.key,
  });
  final String title;
  final String message;
  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(title: Text(title)),
    body: Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(title, style: Theme.of(context).textTheme.headlineMedium),
          const SizedBox(height: 8),
          Text(message),
        ],
      ),
    ),
  );
}
```

