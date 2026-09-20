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
│   ├── audio
│   │   ├── audio_provider.dart
│   │   └── audio_service.dart
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
│   ├── gameplay
│   │   ├── application
│   │   │   ├── chat_controller.dart
│   │   │   ├── chat_service.dart
│   │   │   ├── game_session_bootstrap.dart
│   │   │   ├── gameplay_controller.dart
│   │   │   └── gameplay_provider.dart
│   │   ├── data
│   │   │   ├── character
│   │   │   │   └── equipment_manifest_parser.dart
│   │   │   ├── gameplay_packet_mapper.dart
│   │   │   └── gameplay_repository.dart
│   │   ├── domain
│   │   │   ├── camera
│   │   │   │   └── camera_mode.dart
│   │   │   ├── character
│   │   │   │   ├── character_animation_state.dart
│   │   │   │   ├── character_appearance.dart
│   │   │   │   ├── character_definition.dart
│   │   │   │   └── equipment_definition.dart
│   │   │   ├── player
│   │   │   │   ├── movement_intent.dart
│   │   │   │   └── player_movement_state.dart
│   │   │   ├── match_state.dart
│   │   │   └── room_list_models.dart
│   │   ├── game
│   │   │   ├── effects
│   │   │   │   ├── damage_text_component.dart
│   │   │   │   ├── effects.dart
│   │   │   │   ├── explosion_component.dart
│   │   │   │   └── smoke_particle.dart
│   │   │   ├── input
│   │   │   │   ├── gameplay_input_controller.dart
│   │   │   │   └── gameplay_input_state.dart
│   │   │   ├── map
│   │   │   │   ├── background_component.dart
│   │   │   │   ├── destructible_terrain.dart
│   │   │   │   ├── game_map_definition.dart
│   │   │   │   ├── icon_preview.dart
│   │   │   │   ├── legacy_map_parser.dart
│   │   │   │   ├── map_binary_parser.dart
│   │   │   │   ├── map_component.dart
│   │   │   │   ├── map_debug_overlay.dart
│   │   │   │   ├── map_json_loader.dart
│   │   │   │   ├── map_repository.dart
│   │   │   │   ├── map_world_controller.dart
│   │   │   │   └── terrain_component.dart
│   │   │   ├── player
│   │   │   │   ├── character_animation_controller.dart
│   │   │   │   ├── character_component.dart
│   │   │   │   ├── character_sprite_resolver.dart
│   │   │   │   ├── equip_anchor.dart
│   │   │   │   ├── equipment_layer_component.dart
│   │   │   │   ├── game_player.dart
│   │   │   │   ├── online_character.dart
│   │   │   │   ├── player_sprites.dart
│   │   │   │   └── sandbox_character_component.dart
│   │   │   ├── projectile
│   │   │   │   ├── bullet_simulator.dart
│   │   │   │   ├── projectile_component.dart
│   │   │   │   ├── projectile_trajectory.dart
│   │   │   │   └── trajectory_simulator.dart
│   │   │   ├── sandbox
│   │   │   │   ├── sandbox_equipment_data.dart
│   │   │   │   └── sandbox_scenario.dart
│   │   │   ├── systems
│   │   │   │   ├── camera_system.dart
│   │   │   │   ├── combat_system.dart
│   │   │   │   ├── ground_probe.dart
│   │   │   │   ├── legacy_camera.dart
│   │   │   │   ├── player_collision_system.dart
│   │   │   │   ├── player_movement_system.dart
│   │   │   │   └── screen_shake_effect.dart
│   │   │   └── army_game.dart
│   │   └── presentation
│   │       ├── widgets
│   │       │   ├── aim_controls.dart
│   │       │   ├── movement_controls.dart
│   │       │   ├── power_bar.dart
│   │       │   └── wind_indicator.dart
│   │       ├── gameplay_page.dart
│   │       ├── gameplay_sandbox_screen.dart
│   │       ├── offline_demo_screen.dart
│   │       └── online_game_screen.dart
│   ├── inventory
│   │   ├── application
│   │   │   └── inventory_controller.dart
│   │   ├── domain
│   │   │   └── inventory_item.dart
│   │   └── presentation
│   │       └── inventory_screen.dart
│   ├── lobby
│   │   ├── application
│   │   │   ├── lobby_controller.dart
│   │   │   └── lobby_state_machine.dart
│   │   ├── data
│   │   │   ├── lobby_packet_mapper.dart
│   │   │   └── lobby_repository.dart
│   │   ├── domain
│   │   │   ├── area_summary.dart
│   │   │   ├── board_summary.dart
│   │   │   └── lobby_state.dart
│   │   └── presentation
│   │       └── lobby_screen.dart
│   ├── room
│   │   ├── application
│   │   │   ├── room_controller.dart
│   │   │   └── room_state_machine.dart
│   │   ├── data
│   │   │   ├── room_packet_mapper.dart
│   │   │   └── room_repository.dart
│   │   ├── domain
│   │   │   ├── room_player.dart
│   │   │   └── room_session_state.dart
│   │   └── presentation
│   │       └── room_screen.dart
│   └── shop
│       ├── application
│       │   └── shop_controller.dart
│       └── domain
│           └── shop_item.dart
├── shared
│   ├── overlays
│   │   ├── gameplay_hud.dart
│   │   └── match_result_overlay.dart
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
    - assets/gui/
    - assets/map/
    - assets/map/bgItem/
    - assets/item/
    - assets/equip/
    - assets/music/
    - assets/sound/
    - assets/effect/
    - assets/BigImage/
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
import 'dart:io';

import 'package:flutter/foundation.dart';
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

    // Platform-specific initialization
    if (!kIsWeb && (Platform.isAndroid || Platform.isIOS)) {
      await SystemChrome.setPreferredOrientations(const [
        DeviceOrientation.landscapeLeft,
        DeviceOrientation.landscapeRight,
      ]);
      await SystemChrome.setEnabledSystemUIMode(
        SystemUiMode.immersiveSticky,
        overlays: [],
      );
      // Ensure system bars are hidden even after keyboard interaction
      unawaited(SystemChrome.setSystemUIChangeCallback((systemOverlaysVisible) async {
        if (systemOverlaysVisible) {
          await Future<void>.delayed(const Duration(seconds: 2));
          await SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
        }
      }));
    } else if (!kIsWeb && (Platform.isWindows || Platform.isMacOS || Platform.isLinux)) {
      // Desktop specific setup: ensure reasonable minimum size if possible
      // (Requires window_manager for full control, but we stick to standard here)
    }

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
import 'package:mobiarmy_flutter/core/audio/audio_service.dart';
import 'package:mobiarmy_flutter/core/network/connection_lifecycle.dart';
import 'package:mobiarmy_flutter/features/gameplay/game/army_game.dart';

class AppLifecycleCoordinator with WidgetsBindingObserver {
  AppLifecycleCoordinator({
    required this.game,
    required this.connection,
    required this.audio,
  });
  final ArmyGame game;
  final ConnectionLifecycle connection;
  final AudioService audio;
  bool _disposed = false;

  void start() => WidgetsBinding.instance.addObserver(this);

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (_disposed) return;
    switch (state) {
      case AppLifecycleState.resumed:
        connection.onForeground();
        game.resumeSafely();
        audio.resumeAll();
      case AppLifecycleState.inactive:
      case AppLifecycleState.hidden:
      case AppLifecycleState.paused:
      case AppLifecycleState.detached:
        game.pauseSafely();
        connection.onBackground();
        audio.pauseAll();
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
  game('/game'),
  demo('/demo'),
  inventory('/inventory'),
  shop('/shop'),
  friends('/friends'),
  clan('/clan'),
  missions('/missions'),
  luckyGame('/lucky-game'),
  ranking('/ranking'),
  formulas('/formulas'),
  profile('/profile'),
  offlineSetup('/offline-setup'),
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
import 'package:mobiarmy_flutter/core/assets/game_asset_loader.dart';
import 'package:mobiarmy_flutter/features/authentication/application/auth_controller.dart';
import 'package:mobiarmy_flutter/features/authentication/domain/authentication_state.dart';
import 'package:mobiarmy_flutter/features/authentication/presentation/login_screen.dart';
import 'package:mobiarmy_flutter/features/authentication/presentation/server_selection_screen.dart';
import 'package:mobiarmy_flutter/features/authentication/presentation/splash_screen.dart';
import 'package:mobiarmy_flutter/features/gameplay/application/gameplay_controller.dart';
import 'package:mobiarmy_flutter/features/gameplay/presentation/gameplay_sandbox_screen.dart';
import 'package:mobiarmy_flutter/features/gameplay/presentation/offline_demo_screen.dart';
import 'package:mobiarmy_flutter/features/gameplay/presentation/offline_setup_screen.dart';
import 'package:mobiarmy_flutter/features/gameplay/presentation/online_game_screen.dart';
import 'package:mobiarmy_flutter/features/inventory/presentation/inventory_screen.dart';
import 'package:mobiarmy_flutter/features/lobby/application/lobby_controller.dart';
import 'package:mobiarmy_flutter/features/lobby/domain/lobby_state.dart';
import 'package:mobiarmy_flutter/features/lobby/presentation/lobby_screen.dart';
import 'package:mobiarmy_flutter/features/room/application/room_controller.dart';
import 'package:mobiarmy_flutter/features/room/presentation/room_screen.dart';
import 'package:mobiarmy_flutter/shared/widgets/placeholder_screen.dart';

final appRouterProvider = Provider<GoRouter>((ref) {
  final router = GoRouter(
    initialLocation: AppRoute.bootstrap.path,
    refreshListenable: _RouterRefresh(ref),
    redirect: (context, state) {
      final nav = ref.read(navigationControllerProvider);
      final auth = ref.read(authControllerProvider);
      final lobby = ref.read(lobbyControllerProvider);
      final gameplay = ref.read(gameplayControllerProvider);
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
        if (inAuthFlow) return AppRoute.lobby.path;

        // Gameplay transition: Authoritative Online Match route
        if (gameplay != null && location != AppRoute.game.path) {
          return AppRoute.game.path;
        }

        // Lobby -> Room transition
        if (lobby.status == LobbyStatus.joined && location != AppRoute.room.path) {
          if (gameplay == null) return AppRoute.room.path;
        }
        // Room -> Lobby transition (if we left the room)
        if (lobby.status != LobbyStatus.joined && location == AppRoute.room.path) {
          return AppRoute.lobby.path;
        }

        return null;
      }

      if ({AppRoute.lobby.path, AppRoute.room.path}.contains(location)) {
        return AppRoute.serverSelection.path;
      }

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
        builder: (_, _) => const SplashScreen(),
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
        builder: (_, _) => const LobbyScreen(),
      ),
      GoRoute(
        path: AppRoute.room.path,
        builder: (_, _) => const RoomScreen(),
      ),
      GoRoute(
        path: AppRoute.game.path,
        builder: (_, _) => const OnlineGameScreen(),
      ),
      GoRoute(
        path: AppRoute.demo.path,
        builder: (_, _) => const OfflineDemoScreen(),
      ),
      GoRoute(
        path: AppRoute.inventory.path,
        builder: (_, _) => const InventoryScreen(),
      ),
      GoRoute(
        path: AppRoute.shop.path,
        builder: (_, _) => const PlaceholderScreen(title: 'Shop'),
      ),
      GoRoute(
        path: AppRoute.friends.path,
        builder: (_, _) => const PlaceholderScreen(title: 'Friend List'),
      ),
      GoRoute(
        path: AppRoute.clan.path,
        builder: (_, _) => const PlaceholderScreen(title: 'Clan Hub'),
      ),
      GoRoute(
        path: AppRoute.missions.path,
        builder: (_, _) => const PlaceholderScreen(title: 'Missions'),
      ),
      GoRoute(
        path: AppRoute.luckyGame.path,
        builder: (_, _) => const PlaceholderScreen(title: 'Lucky Game'),
      ),
      GoRoute(
        path: AppRoute.ranking.path,
        builder: (_, _) => const PlaceholderScreen(title: 'Ranking'),
      ),
      GoRoute(
        path: AppRoute.formulas.path,
        builder: (_, _) => const PlaceholderScreen(title: 'Formulas'),
      ),
      GoRoute(
        path: AppRoute.profile.path,
        builder: (_, _) => const PlaceholderScreen(title: 'Profile'),
      ),
      GoRoute(
        path: AppRoute.gameplaySandbox.path,
        builder: (context, state) {
          final extra = state.extra as Map<String, dynamic>?;
          return GameplaySandboxScreen(
            heroIndex: extra?['heroIndex'] ?? 0,
          );
        },
      ),
      GoRoute(
        path: AppRoute.offlineSetup.path,
        builder: (_, _) => const OfflineSetupScreen(),
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
    ref.listen(lobbyControllerProvider, (_, _) => notifyListeners());
    ref.listen(roomControllerProvider, (_, _) => notifyListeners());
    ref.listen(gameplayControllerProvider, (_, _) => notifyListeners());
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
    Future<void>.microtask(() async {
      // Load asset THAT 1 lan duy nhat truoc khi vao app
      await GameAssets.load();
      if (mounted) {
        ref.read(navigationControllerProvider.notifier).completeBootstrap();
      }
    });
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
import 'package:flutter/material.dart';

/// Anchor flags matching J2ME/LibGDX mGraphics.
abstract final class GraphicsAnchor {
  static const int hCenter = 1;
  static const int vCenter = 2;
  static const int left = 4;
  static const int right = 8;
  static const int top = 16;
  static const int bottom = 32;
}

class BmChar {
  BmChar(this.id, this.x, this.y, this.w, this.h, this.xOff, this.yOff, this.xAdv);
  final int id, x, y, w, h, xOff, yOff, xAdv;
}

/// Port of CLib/SysTemFont and mFont.
/// Supports AngelCode BMFont (.fnt text) and Java color palettes.
class BmFont {
  BmFont._(this.atlas, this.chars, this.lineHeight, this.charSpace);

  final ui.Image atlas;
  final Map<int, BmChar> chars;
  final int lineHeight;
  final double charSpace;

  /// Palette from mFont.java: colorJava[id + 1].
  /// Converted from 32-bit signed integers to Flutter Colors.
  static const List<Color> palette = [
    Color(0xFFFE9D1A), // -90838
    Color(0xFF72993F), // -9265665
    Color(0xFF131113), // -15527149
    Color(0xFFFDFF9B), // -197061
    Color(0xFFB472FF), // -4947201
    Color(0xFFFFFFFF), // -1
    Color(0xFF66E291), // -10035407
    Color(0xFF481230), // -12052464
    Color(0xFFFF0000), // -65536
    Color(0xFF131113), // -15527149
    Color(0xFFFFFFFF), // -1
    Color(0xFFFDFF9B), // -197061
    Color(0xFFFE9D1A), // -90838
    Color(0xFFFF0000), // -65536
    Color(0xFF72993F), // -9265665
    Color(0xFF66E291), // -10035407
    Color(0xFFB472FF), // -4947201
    Color(0xFFFDFF9B), // -197061
    Color(0xFFFF0000), // -65536
    Color(0xFF66E291), // -10035407
    Color(0xFFFFFFFF), // -1
    Color(0xFFFE9D1A), // -90838
    Color(0xFFFDFF9B), // -197061
    Color(0xFFB676B1), // -4819663
    Color(0xFF131113), // -15527149
    Color(0xFF676B67), // -10000537
  ];

  static Future<BmFont> load(
    String fntPath,
    Future<ui.Image> Function(String imagePath) loadAtlas,
    Future<String> Function(String path) loadString,
  ) async {
    final fntSource = await loadString(fntPath);
    return parse(fntSource, await loadAtlas(_imagePathOf(fntPath, fntSource)));
  }

  static String _imagePathOf(String fntPath, String source) {
    final m = RegExp(r'page id=\d+ file="([^"]+)"').firstMatch(source);
    final file = m?.group(1) ?? 'big.png';
    final lastSlash = fntPath.lastIndexOf('/');
    if (lastSlash == -1) return file;
    return '${fntPath.substring(0, lastSlash)}/$file';
  }

  static BmFont parse(String source, ui.Image atlas) {
    var lineHeight = 12;
    var charSpace = 1.0;
    final chars = <int, BmChar>{};
    for (final line in source.split('\n')) {
      final trimmed = line.trim();
      if (trimmed.startsWith('common ')) {
        final h = RegExp(r'lineHeight=(\d+)').firstMatch(trimmed);
        if (h != null) lineHeight = int.parse(h.group(1)!);
      } else if (trimmed.startsWith('char ')) {
        int? v(String k) {
          final m = RegExp('$k=(-?\\d+)').firstMatch(trimmed);
          return m != null ? int.parse(m.group(1)!) : null;
        }
        final id = v('id');
        if (id != null) {
          chars[id] = BmChar(
            id, v('x') ?? 0, v('y') ?? 0, v('width') ?? 0, v('height') ?? 0,
            v('xoffset') ?? 0, v('yoffset') ?? 0, v('xadvance') ?? 0,
          );
        }
      }
    }
    return BmFont._(atlas, chars, lineHeight, charSpace);
  }

  int getWidth(String s) {
    var w = 0.0;
    for (var i = 0; i < s.length; i++) {
      final code = s.codeUnitAt(i);
      final c = chars[code] ?? chars[32];
      if (c != null) w += c.xAdv + charSpace;
    }
    return w.round();
  }

  /// SysTemFont.drawString with bitwise anchors and optional tint index.
  void drawString(
    ui.Canvas canvas,
    String s,
    double x,
    double y,
    int anchor, {
    int colorIndex = -1,
  }) {
    var cx = x;
    var cy = y;
    final totalW = getWidth(s).toDouble();

    // Horizontal alignment
    if ((anchor & GraphicsAnchor.hCenter) != 0) {
      cx -= totalW / 2;
    } else if ((anchor & GraphicsAnchor.right) != 0) {
      cx -= totalW;
    }

    // Vertical alignment
    if ((anchor & GraphicsAnchor.vCenter) != 0) {
      cy -= lineHeight / 2;
    } else if ((anchor & GraphicsAnchor.bottom) != 0) {
      cy -= lineHeight;
    }

    final paint = ui.Paint()..filterQuality = ui.FilterQuality.none;
    if (colorIndex >= 0 && colorIndex < palette.length) {
      paint.colorFilter = ui.ColorFilter.mode(palette[colorIndex], ui.BlendMode.modulate);
    }

    for (var i = 0; i < s.length; i++) {
      final code = s.codeUnitAt(i);
      final c = chars[code] ?? chars[32];
      if (c != null && c.w > 0 && c.h > 0) {
        canvas.drawImageRect(
          atlas,
          ui.Rect.fromLTWH(c.x.toDouble(), c.y.toDouble(), c.w.toDouble(), c.h.toDouble()),
          ui.Rect.fromLTWH(cx + c.xOff, cy + c.yOff, c.w.toDouble(), c.h.toDouble()),
          paint,
        );
        cx += c.xAdv + charSpace;
      } else if (c != null) {
        cx += c.xAdv + charSpace;
      }
    }
  }

  /// Port of mFont.splitFontVector / SysTemFont.splitFontVector.
  /// Splits text into multiple lines based on maximum width.
  List<String> splitFontVector(String src, int lineWidth) {
    final lines = <String>[];
    final words = src.split(' ');
    var currentLine = '';

    for (final word in words) {
      final testLine = currentLine.isEmpty ? word : '$currentLine $word';
      if (getWidth(testLine) <= lineWidth) {
        currentLine = testLine;
      } else {
        if (currentLine.isNotEmpty) lines.add(currentLine);
        currentLine = word;
      }
    }
    if (currentLine.isNotEmpty) lines.add(currentLine);
    return lines;
  }
}
```

### `D:\personal\army/lib\core\assets\file_pack_decoder.dart`
```dart
import 'dart:typed_data';
import 'dart:ui' as ui;
import 'package:logging/logging.dart';

/// Port chính xác `model/FilePack.java` của bản gốc LibGDX.
///
/// Các file res/gui/gui, res/item/item, res/effect/effect, res/map/bg
/// (và res/item/delete) đều là FilePack: archive gồm nhiều PNG nhỏ đặt cạnh
/// nhau, header lưu tên file, mọi thứ XOR với key chuỗi "NguyenVanMinh".
abstract final class FilePackDecoder {
  static final _logger = Logger('FilePackDecoder');

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
    if (data.isEmpty) {
      _logger.warning('Attempted to decode empty FilePack data');
      throw ArgumentError('FilePack: data is empty');
    }

    var pos = 0;
    int u8() {
      if (pos >= data.length) throw RangeError('FilePack: unexpected EOF reading U8 at $pos');
      return data[pos++];
    }
    int u16() {
      if (pos + 1 >= data.length) throw RangeError('FilePack: unexpected EOF reading U16 at $pos');
      final v = (data[pos] << 8) | data[pos + 1];
      pos += 2;
      return v;
    }

    try {
      final nFile = u8();
      final names = <String>[];
      final lens = <int>[];

      for (var i = 0; i < nFile; i++) {
        final lname = u8();
        if (pos + lname > data.length) {
          throw RangeError('FilePack: unexpected EOF reading filename of length $lname at $pos');
        }

        final nameBytes = _unxor(data.sublist(pos, pos + lname));
        pos += lname;
        names.add(String.fromCharCodes(nameBytes));

        lens.add(u16());
      }

      final fullData = _unxor(data.sublist(pos));
      final files = <String, Uint8List>{};
      var off = 0;

      for (var i = 0; i < nFile; i++) {
        if (off + lens[i] > fullData.length) {
          _logger.severe('FilePack data truncated for file "${names[i]}"');
          throw StateError('FilePack: truncated data for "${names[i]}"');
        }

        // Java's Hashtable.put policy: if duplicate key exists, it overwrites.
        // This is implicit in Dart Map's operator [].
        files[names[i]] = Uint8List.fromList(fullData.sublist(off, off + lens[i]));
        off += lens[i];
      }

      _logger.fine('Decoded FilePack with $nFile files');
      return FilePack(files);
    } catch (e, stack) {
      _logger.severe('Failed to decode FilePack', e, stack);
      rethrow;
    }
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
      'map/tab_1', 'map/tab_2', 'map/tab_3', 'map/tab_4', 'map/tab_5',
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
        '$kPrefix$base.fnt',
        (path) async {
          final bd = await rootBundle.load(path);
          final codec = await ui.instantiateImageCodec(bd.buffer.asUint8List());
          return (await codec.getNextFrame()).image;
        },
        (path) => rootBundle.loadString(path),
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

import 'package:flutter/foundation.dart';
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

  static Future<Directory?> _dir() async {
    if (kIsWeb) return null;
    if (_root != null) return _root!;
    final docs = await getApplicationDocumentsDirectory();
    final d = Directory('${docs.path}/rms');
    if (!d.existsSync()) d.createSync(recursive: true);
    return _root = d;
  }

  static Future<void> seedFromBundle(List<String> files) async {
    if (kIsWeb) return;
    final root = await _dir();
    if (root == null) return;
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
    if (kIsWeb) return null;
    final root = await _dir();
    if (root == null) return null;
    final f = File('${root.path}/$filename');
    return f.existsSync() ? f.readAsBytesSync() : null;
  }

  static Future<int> loadInt(String filename) async {
    final b = await load(filename);
    if (b == null || b.isEmpty) return -1;
    return b[0] > 127 ? b[0] - 256 : b[0];
  }

  static Future<void> save(String filename, List<int> data) async {
    if (kIsWeb) return;
    final root = await _dir();
    if (root == null) return;
    final tempFile = File('${root.path}/$filename.tmp');
    final targetFile = File('${root.path}/$filename');
    tempFile.writeAsBytesSync(data);
    if (targetFile.existsSync()) targetFile.deleteSync();
    tempFile.renameSync(targetFile.path);
  }

  static Future<void> saveRmsInt(String filename, int x) =>
      save(filename, <int>[x & 0xFF]);

  static Future<String?> loadString(String filename) async {
    final b = await load(filename);
    return b == null ? null : utf8.decode(b);
  }

  static Future<void> saveString(String filename, String s) =>
      save(filename, utf8.encode(s));

  static Future<void> clear(String filename) async {
    if (kIsWeb) return;
    final root = await _dir();
    if (root == null) return;
    final f = File('${root.path}/$filename');
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

### `D:\personal\army/lib\core\audio\audio_provider.dart`
```dart
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'audio_service.dart';

final audioServiceProvider = Provider<AudioService>((ref) {
  final service = AudioService();
  service.init();
  return service;
});
```

### `D:\personal\army/lib\core\audio\audio_service.dart`
```dart
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

    await player.setVolume(_volume);
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

  void pauseAll() {
    _bgmPlayer.pause();
    for (final p in _sfxPlayers) {
      p.pause();
    }
  }

  void resumeAll() {
    if (!_muted && _volume > 0) {
      _bgmPlayer.resume();
    }
  }

  void dispose() {
    _bgmPlayer.dispose();
    for (final p in _sfxPlayers) {
      p.dispose();
    }
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

  /// Java-style absolute value.
  /// NOTE: Math.abs(Integer.MIN_VALUE) returns Integer.MIN_VALUE (-2147483648)
  /// in Java. Dart's standard abs() on 64-bit int would return 2147483648.
  static int abs(int value) {
    if (value == minValue) return minValue;
    return value < 0 ? -value : value;
  }

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
      final tangent = JavaInt32.abs(JavaInt32.divide(shifted, dx));
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
  static const int shootResult = 23;
  static const int setTurn = 24;
  static const int setWind = 25;
  static const int useItem = 26;
  static const int quickPlay = 28;
  static const int friendList = 29;
  static const int addFriend = 32;
  static const int deleteFriend = 33;
  static const int userInfo = 34;
  static const int findUser = 36;
  static const int bonusMoney = 52;
  static const int finishMatch = 100;
  static const int ping = 42;
  static const int log =
      45; // SessionHandler.log — server notice / auth failure
  static const int skipTurn = 49;
  static const int setXy = 53;
  static const int dynamicSync = 90;
  static const int idNotCollision = 92;
  static const int platformRequest = 114;
  static const int getClanIcon = 115;
  static const int getString = 127;
  static const int getBoss = 89;
  static const int changeTeam = 71;
  static const int buyItem = 72;
  static const int buyGlass = 74;
  static const int selectMap = 75;
  static const int inventory = 101;
  static const int changeEquip = 102;
  static const int getShopEquip = 103;
  static const int buySellEquip = 104;
  static const int inventoryUpdate = 27;
  static const int materialUpdate = 125;
  static const int materialIcon = 126;
  static const int expUpdate = 97;
  static const int charInfo = 99;
  static const int topClan = 116;
  static const int clanInfo = 117;
  static const int clanMember = 118;
  static const int luckyGame = 110;
  static const int chatTeam = 123;
  static const int getKey = -27;
  static const int requestRenewal = -25;
  static const int cupUpdate = -24;
  static const int missions = -23;
  static const int clanMoneyUpdate = -22;
  static const int roomInfoNames = -19;
  static const int formula = -18;
  static const int luckyGift = -17;
  static const int topInfo = -14;
  static const int shopBietDoi = -12;
  static const int quit = -4;
  static const int shopSpecial = -3;
  static const int setEquipVip = -2;
  static const int ad = -100;
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
  const NoopConnectionLifecycle();
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
  static Map<int, int> glassMaxDamage = {};
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
    DataCache.glassMaxDamage = {};
    final nGlass = r.readByte();
    for (var g = 0; g < nGlass; g++) {
      final glassId = r.readByte();
      final maxDamage = r.readShort();
      DataCache.glassMaxDamage[glassId] = maxDamage;
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
import 'dart:typed_data';
import 'package:logging/logging.dart';
import 'package:mobiarmy_flutter/core/assets/legacy_rms.dart';
import 'package:mobiarmy_flutter/core/network/command/commands.dart';
import 'package:mobiarmy_flutter/core/network/dispatcher/message_dispatcher.dart';
import 'package:mobiarmy_flutter/core/network/protocol/message.dart';
import 'package:mobiarmy_flutter/core/network/transport/tcp_session.dart';
import 'package:mobiarmy_flutter/features/gameplay/game/map/icon_preview.dart';
import 'package:mobiarmy_flutter/features/gameplay/game/player/player_sprites.dart';
import 'data_cache_parsers.dart';

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

  void dispose() {
    _dispatcher.unregister(Commands.dynamicSync, _onDynamicSync);
  }

  Future<void> start() async {
    _iconVersion = await _safeInt('iconversion2');
    _valuesVersion = await _safeInt('valuesversion2');
    _playerVersion = await _safeInt('playerVersion2');
    _equipVersion = await _safeInt('equipVersion2');
    _levelCVersion = await _safeInt('levelCVersion2');

    try {
      final valuesCached = await _safeLoad('valuesdata2');
      if (valuesCached != null) DataCacheParsers.parseMapList(valuesCached);
    } catch (e) {
      _logger.warning('Corrupted values cache. Wiping file.');
      await LegacyRms.clear('valuesdata2');
      await LegacyRms.clear('valuesversion2');
      _valuesVersion = 0;
    }

    try {
      final equipCached = await _safeLoad('equipdata2');
      if (equipCached != null) DataCacheParsers.parseEquipTree(equipCached);
    } catch (e) {
      _logger.warning('Corrupted equip cache. Wiping file.');
      await LegacyRms.clear('equipdata2');
      await LegacyRms.clear('equipversion2');
      _equipVersion = 0;
    }

    try {
      final levelCached = await _safeLoad('levelCData2');
      if (levelCached != null) DataCacheParsers.parseLevelCaptions(levelCached);
    } catch (e) {
      _logger.warning('Corrupted level cache. Wiping file.');
      await LegacyRms.clear('levelCData2');
      await LegacyRms.clear('levelCVersion2');
      _levelCVersion = 0;
    }

    try {
      final playerCached = await _safeLoad('playerdata2');
      if (playerCached != null) await PlayerSprites.init(playerCached);
    } catch (e) {
      _logger.warning('Corrupted player sprites cache. Wiping file.');
      await LegacyRms.clear('playerdata2');
      await LegacyRms.clear('playerVersion2');
      _playerVersion = 0;
    }

    try {
      final iconCached = await _safeLoad('icondata2');
      if (iconCached != null) {
        _logger.fine('Loading icons from cache');
        await MapIconPack.init(iconCached);
      }
    } catch (e) {
      _logger.warning('Corrupted icons cache: $e. Wiping file.');
      await LegacyRms.clear('icondata2');
      await LegacyRms.clear('iconversion2');
      _iconVersion = 0;
    }

    _logger.info('Starting sync chain with values version: $_valuesVersion');
    await _sendVersion(2, _valuesVersion);
  }

  static Future<int> _safeInt(String f) async {
    try {
      final v = await LegacyRms.loadInt(f);
      return v < 0 ? 0 : v;
    } catch (_) {
      return 0;
    }
  }

  static Future<Uint8List?> _safeLoad(String f) async {
    try {
      return await LegacyRms.load(f);
    } catch (_) {
      return null;
    }
  }

  static Future<void> _safeSave(String f, List<int> d) async {
    try {
      await LegacyRms.save(f, d);
    } catch (_) {}
  }

  static Future<void> _safeSaveInt(String f, int v) async {
    try {
      await LegacyRms.saveRmsInt(f, v);
    } catch (_) {}
  }

  void _onDynamicSync(Message msg) {
    final r = msg.reader();
    final type = r.readByte();
    _logger.fine('Received dynamic sync type: $type');
    try {
      switch (type) {
        case 2:
          final v = r.readByte();
          _logger.info('Sync values version: $v (current: $_valuesVersion)');
          if (v != _valuesVersion) {
            final len = r.readUnsignedShort();
            _logger.fine('Downloading new valuesdata2, length: $len');
            final data = r.readBytes(len);
            DataCacheParsers.parseMapList(data);
            _safeSave('valuesdata2', data);
            _safeSaveInt('valuesversion2', v);
            _valuesVersion = v;
          }
          _sendVersion(1, _tileMapVersion);
          break;
        case 1:
          final v = r.readByte();
          _logger.info('Sync icons version: $v (current: $_iconVersion)');
          if (v != _iconVersion) {
            final len = r.readUnsignedShort();
            _logger.fine('Downloading new icondata2, length: $len');
            final data = r.readBytes(len);
            MapIconPack.init(data);
            _safeSave('icondata2', data);
            _safeSaveInt('iconversion2', v);
            _iconVersion = v;
          }
          _sendVersion(3, _iconVersion);
          break;
        case 3:
          final v = r.readByte();
          _logger.info('Sync player version: $v (current: $_playerVersion)');
          if (v != _playerVersion) {
            final len = r.readUnsignedShort();
            _logger.fine('Downloading new playerdata2, length: $len');
            final data = r.readBytes(len);
            PlayerSprites.init(data);
            _safeSave('playerdata2', data);
            _safeSaveInt('playerVersion2', v);
            _playerVersion = v;
          }
          _sendVersion(4, _equipVersion);
          break;
        case 4:
          final v = r.readByte();
          _logger.info('Sync equip version: $v (current: $_equipVersion)');
          if (v != _equipVersion) {
            final len = r.readInt();
            _logger.fine('Downloading new equipdata2, length: $len');
            final data = r.readBytes(len);
            DataCacheParsers.parseEquipTree(data);
            _safeSave('equipdata2', data);
            _safeSaveInt('equipVersion2', v);
            _equipVersion = v;
          }
          _sendVersion(5, _levelCVersion);
          break;
        case 5:
          final v = r.readByte();
          _logger.info('Sync level captions version: $v (current: $_levelCVersion)');
          if (v != _levelCVersion) {
            final len = r.readUnsignedShort();
            _logger.fine('Downloading new levelCData2, length: $len');
            final data = r.readBytes(len);
            DataCacheParsers.parseLevelCaptions(data);
            _safeSave('levelCData2', data);
            _safeSaveInt('levelCVersion2', v);
            _levelCVersion = v;
          }
          _logger.info('All data sync chains completed');
          if (!_completer.isCompleted) {
            _completer.complete();
            dispose();
          }
          break;
      }
    } catch (e, stack) {
      _logger.severe('Exception during sync chain: $e', e, stack);
      if (!_completer.isCompleted) _completer.completeError(e);
      dispose();
    }
  }

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
  late final ByteWriter _writer;
  final Uint8List? _data;

  Message(this.command) : _data = null {
    _writer = ByteWriter();
  }

  Message.fromBytes(this.command, Uint8List data) : _data = data;

  ByteReader reader() {
    if (_data == null) {
      throw StateError('Message was created for writing');
    }
    return ByteReader(_data);
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

  /// Lookahead decryption without advancing the internal cursor state.
  int lookaheadDecryptByte(int b, int offset) {
    final pos = (_readPos + offset) % _key.length;
    return (b ^ _key[pos]) & 0xFF;
  }

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

import 'package:flutter/foundation.dart';
import 'package:logging/logging.dart';

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
  StreamSubscription<Uint8List>? _socketSubscription;
  XorCodec? _codec;
  bool _getKeyComplete = false;
  bool _intentionallyClosed = false;

  final List<int> _rawBuffer = [];

  bool get isConnected => _socket != null;

  Future<void> connect(String host, int port) async {
    if (kIsWeb) {
      throw UnsupportedError('TCP Sockets are not supported on Web. Use a WebSocket proxy.');
    }
    _logger.info('Connecting to $host:$port');
    _intentionallyClosed = false;

    // Cleanup any existing connection completely first
    await _cleanupSocket();

    try {
      _socket = await Socket.connect(
        host,
        port,
        timeout: const Duration(seconds: 20),
      );
      _getKeyComplete = false;
      _codec = null;
      _rawBuffer.clear();

      _socketSubscription = _socket!.listen(
        _onData,
        onError: (Object e) {
          _logger.severe('Socket error: $e');
          listener?.onSocketError(e);
        },
        onDone: () {
          _logger.info('Socket closed');
          final reason = _intentionallyClosed ? null : 'Server đóng kết nối';
          _cleanupSocketSync();
          listener?.onDisconnected(reason);
        },
        cancelOnError: true,
      );

      await sendMessage(Message(Commands.getKey));
    } catch (e) {
      _logger.severe('Failed to connect: $e');
      _cleanupSocketSync();
      rethrow;
    }
  }

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

    if (cmd != 42) {
      _logger.fine('Sending packet command ID: $cmd, length: $size');
    }

    socket.add(writer.toBytes());
    await socket.flush();
  }

  void handleDataForTesting(Uint8List data) {
    _onData(data);
  }

  void _onData(Uint8List data) {
    _rawBuffer.addAll(data);
    _processBufferIncremental();
  }

  void _processBufferIncremental() {
    while (_rawBuffer.isNotEmpty) {
      // Wait, we need an exact checkpointing mechanism. Let's make a mini cursor decoder loop.

      int bufferIndex = 0;
      if (_rawBuffer.isEmpty) return;

      int rawCmd = _rawBuffer[bufferIndex++];
      if (_getKeyComplete && _codec != null) {
        // Look up decrypted byte hypothetically using a clean custom lookahead offset
        rawCmd = (_rawCmdLookahead(rawCmd, 0)) > 127 ? (_rawCmdLookahead(rawCmd, 0)) - 256 : (_rawCmdLookahead(rawCmd, 0));
      } else {
        rawCmd = rawCmd > 127 ? rawCmd - 256 : rawCmd;
      }

      int headerSize = 1;
      int size = 0;

      if (rawCmd == -120 || rawCmd == Commands.dynamicSync) {
        headerSize += 4;
        if (_rawBuffer.length < headerSize) return; // Wait for full header bytes

        if (_getKeyComplete && _codec != null) {
          final b1 = _rawCmdLookahead(_rawBuffer[1], 1);
          final b2 = _rawCmdLookahead(_rawBuffer[2], 2);
          final b3 = _rawCmdLookahead(_rawBuffer[3], 3);
          final b4 = _rawCmdLookahead(_rawBuffer[4], 4);
          size = (b1 << 24) | (b2 << 16) | (b3 << 8) | b4;
        } else {
          size = (_rawBuffer[1] << 24) | (_rawBuffer[2] << 16) | (_rawBuffer[3] << 8) | _rawBuffer[4];
        }
      } else {
        headerSize += 2;
        if (_rawBuffer.length < headerSize) return; // Wait for full header bytes

        if (_getKeyComplete && _codec != null) {
          final b1 = _rawCmdLookahead(_rawBuffer[1], 1);
          final b2 = _rawCmdLookahead(_rawBuffer[2], 2);
          size = (b1 << 8) | b2;
        } else {
          size = (_rawBuffer[1] << 8) | _rawBuffer[2];
        }
      }

      // Safeguard against corrupted huge frame sizes
      if (size < 0 || size > 1024 * 1024 * 5) {
        _logger.severe('Corrupted frame size detected: $size. Aborting streaming loop.');
        _rawBuffer.clear();
        _cleanupSocketSync();
        listener?.onDisconnected('Dữ liệu luồng mạng lỗi cấu trúc');
        return;
      }

      if (_rawBuffer.length < headerSize + size) {
        // Incomplete packet body segment. Return safely and wait for more data.
        // Notice we DID NOT consume or commit any cursor drift.
        return;
      }

      // Full frame present! Consume header + body payload bytes from raw buffer list
      final frameBytes = Uint8List.fromList(_rawBuffer.sublist(0, headerSize + size));
      _rawBuffer.removeRange(0, headerSize + size);

      // Now advance the REAL cursor sequentially because we are executing the packet consumption
      int finalCmd = frameBytes[0];
      if (_getKeyComplete && _codec != null) {
        finalCmd = _codec!.decryptByte(finalCmd);
      }
      finalCmd = finalCmd > 127 ? finalCmd - 256 : finalCmd;

      if (finalCmd == -120 || finalCmd == Commands.dynamicSync) {
        if (_getKeyComplete && _codec != null) {
          _codec!.decryptByte(frameBytes[1]);
          _codec!.decryptByte(frameBytes[2]);
          _codec!.decryptByte(frameBytes[3]);
          _codec!.decryptByte(frameBytes[4]);
        }
      } else {
        if (_getKeyComplete && _codec != null) {
          _codec!.decryptByte(frameBytes[1]);
          _codec!.decryptByte(frameBytes[2]);
        }
      }

      var payload = Uint8List.fromList(frameBytes.sublist(headerSize));
      if (_getKeyComplete && _codec != null) {
        payload = _codec!.decrypt(payload);
      }

      if (finalCmd != 42) {
        _logger.fine('Received message opcode command ID: $finalCmd, size: $size');
      }

      final message = Message.fromBytes(finalCmd, payload);
      _handleInternal(message);
    }
  }

  int _rawCmdLookahead(int rawByte, int offset) {
    if (_codec == null) return rawByte;
    return _codec!.lookaheadDecryptByte(rawByte, offset);
  }

  void _handleInternal(Message message) {
    if (_intentionallyClosed) return; // Do not dispatch packets after close/dispose
    if (message.command == Commands.getKey) {
      _codec = XorCodec.fromSessionMessage(message.getData());
      _getKeyComplete = true;
      _logger.info('Key initialized successfully matching Java contract');
      listener?.onHandshakeComplete();
    } else {
      dispatcher.dispatch(message);
    }
  }

  Future<void> _cleanupSocket() async {
    _cleanupSocketSync();
  }

  void _cleanupSocketSync() {
    try {
      _socketSubscription?.cancel();
    } catch (_) {}
    _socketSubscription = null;

    try {
      _socket?.destroy();
    } catch (_) {}
    _socket = null;

    _codec = null;
    _getKeyComplete = false;
    _rawBuffer.clear();
  }

  Future<void> dispose() async {
    _intentionallyClosed = true;
    _cleanupSocketSync();
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

      _logger.info('Login successful, starting data sync chain...');

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
        _logger.info('Data sync chain completed, transitioning to authenticated state');
        state = _machine.loginSucceeded(session);
        _ping = PingHeartbeat(_session)..start();
      }).catchError((Object e) {
        _logger.severe('Data sync failed: $e');
        state = _machine.connectionLost('Đồng bộ dữ liệu thất bại: $e');
      });
    } catch (e, stack) {
      _logger.severe('loadInfoAll parse failed', e, stack);
      state = _machine.connectionLost('Phản hồi đăng nhập không hợp lệ');
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
  static const kLegacyServerName = 'Mặt Trời';
  static const kLegacyServerIp = '27.0.12.164';
  static const kLegacyServerPort = 19149;

  static Future<List<GameServerEntry>> load() async {
    final cached = await LegacyRms.load('ipArmy2');
    if (cached != null && cached.isNotEmpty) {
      try {
        final list = _decode(cached);
        if (list.isNotEmpty) return list;
      } catch (e) {
        // Silently fail and fallback to network
      }
    }
    return updateFromNetwork();
  }

  static Future<List<GameServerEntry>> updateFromNetwork() async {
    try {
      final res = await http.get(Uri.parse(linkGetHost)).timeout(const Duration(seconds: 10));
      final text = utf8.decode(res.bodyBytes);
      final list = <GameServerEntry>[];
      for (final raw in text.split(',')) {
        final parts = raw.trim().split(':');
        if (parts.length >= 3) {
          list.add(GameServerEntry(parts[0], parts[1], int.parse(parts[2].trim())));
        }
      }

      // Port parity: add legacy server if list is short or based on version
      if (!list.any((s) => s.ip == kLegacyServerIp)) {
        list.add(GameServerEntry(kLegacyServerName, kLegacyServerIp, kLegacyServerPort));
      }

      await save(list);
      return list;
    } catch (e) {
      // Return hardcoded localhost if network fails and no cache
      return [GameServerEntry('Localhost', '127.0.0.1', 1919)];
    }
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
    int u8() {
      if (pos >= data.length) throw RangeError('LOBBY_RMS_EOF');
      return data[pos++];
    }
    int u16() {
      if (pos + 1 >= data.length) throw RangeError('LOBBY_RMS_EOF');
      final v = (data[pos] << 8) | data[pos + 1];
      pos += 2;
      return v;
    }
    String utf() {
      final len = u16();
      if (pos + len > data.length) throw RangeError('LOBBY_RMS_EOF');
      final s = utf8.decode(data.sublist(pos, pos + len));
      pos += len;
      return s;
    }
    final n = u8();
    final list = <GameServerEntry>[];
    for (var i = 0; i < n; i++) {
      final name = utf();
      final ip = utf();
      final port = u16();
      list.add(GameServerEntry(name, ip, port));
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
import 'package:logging/logging.dart';
import 'package:mobiarmy_flutter/core/network/protocol/message.dart';
import 'package:mobiarmy_flutter/features/authentication/domain/user_session.dart';

/// Decoders for the auth-phase server packets.
///
/// Field order is byte-for-byte the inverse of `SessionHandler.java`:
/// loadInfoAll (cmd 3), log (cmd 45), idNotColision (cmd 92).
class SessionPacketMapper {
  const SessionPacketMapper();

  static final _logger = Logger('SessionPacketMapper');

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

    // Trailing UTFs "a", "b", "c"
    if (r.available > 0) r.readUTF();
    if (r.available > 0) r.readUTF();
    if (r.available > 0) r.readUTF();

    // STRICT PROTOCOL PARITY: ensure all bytes consumed.
    if (r.available > 0) {
      _logger.warning('loadInfoAll: ${r.available} bytes remaining unread. Possible protocol extension.');
      // Consume remaining bytes to prevent dispatcher corruption.
      r.readBytes(r.available);
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
import 'package:mobiarmy_flutter/shared/widgets/bitmap_text.dart';
import 'package:mobiarmy_flutter/shared/widgets/game_viewport.dart';
import 'package:mobiarmy_flutter/shared/widgets/legacy_button.dart';
import 'package:mobiarmy_flutter/shared/widgets/legacy_panel.dart';
import 'package:mobiarmy_flutter/shared/widgets/menu_background.dart';

class LoginScreen extends ConsumerStatefulWidget {
  const LoginScreen({super.key});

  @override
  ConsumerState<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends ConsumerState<LoginScreen> with SingleTickerProviderStateMixin {
  final _username = TextEditingController();
  final _password = TextEditingController();
  bool _remember = true;
  bool _showIntro = true;
  late final AnimationController _introController;

  @override
  void initState() {
    super.initState();
    _introController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    )..forward().then((_) => setState(() => _showIntro = false));

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
    _introController.dispose();
    super.dispose();
  }

  Future<void> _login() async {
    FocusScope.of(context).unfocus();
    await ref.read(authControllerProvider.notifier).login(
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
    final isBusy = auth.status == AuthStatus.authenticating;

    return Scaffold(
      body: GameViewport(
        child: Stack(
          children: [
            const MenuBackground(),

            if (_showIntro)
              _buildIntro()
            else
              _buildLoginForm(auth, isBusy),

            // Soft Keys (Bottom Bar)
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                height: 40,
                color: const Color(0xFFC5D6EE),
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    LegacyButton(
                      label: 'Menu',
                      onPressed: () => ref.read(authControllerProvider.notifier).disconnect(),
                    ),
                    if (isBusy)
                      const SizedBox(
                        width: 15,
                        height: 15,
                        child: CircularProgressIndicator(strokeWidth: 2),
                      )
                    else
                      LegacyButton(
                        label: 'Đăng nhập',
                        onPressed: _login,
                      ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildIntro() {
    return AnimatedBuilder(
      animation: _introController,
      builder: (context, child) {
        return Center(
          child: Opacity(
            opacity: 1.0 - _introController.value,
            child: const BitmapText('Mobi Army 2', scale: 2.0),
          ),
        );
      },
    );
  }

  Widget _buildLoginForm(AuthenticationState auth, bool isBusy) {
    return Center(
      child: SingleChildScrollView(
        child: LegacyPanel(
          width: 250,
          height: 180,
          title: 'Đăng nhập',
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              _LegacyTextField(
                controller: _username,
                label: 'Tài khoản:',
                enabled: !isBusy,
              ),
              const SizedBox(height: 10),
              _LegacyTextField(
                controller: _password,
                label: 'Mật khẩu:',
                obscureText: true,
                enabled: !isBusy,
              ),
              const SizedBox(height: 10),
              GestureDetector(
                onTap: () => setState(() => _remember = !_remember),
                child: Row(
                  children: [
                    Icon(
                      _remember ? Icons.check_box : Icons.check_box_outline_blank,
                      size: 16,
                      color: Colors.black,
                    ),
                    const SizedBox(width: 4),
                    const BitmapText('Nhớ tài khoản', scale: 0.8, colorIndex: 2),
                  ],
                ),
              ),
              if (auth.status == AuthStatus.failed)
                Padding(
                  padding: const EdgeInsets.only(top: 8),
                  child: BitmapText(
                    auth.message ?? 'Lỗi đăng nhập',
                    colorIndex: 8, // RED
                    scale: 0.7,
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}

class _LegacyTextField extends StatelessWidget {
  const _LegacyTextField({
    required this.controller,
    required this.label,
    this.obscureText = false,
    this.enabled = true,
  });

  final TextEditingController controller;
  final String label;
  final bool obscureText;
  final bool enabled;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: 80,
          child: BitmapText(label, scale: 0.8, colorIndex: 2),
        ),
        Expanded(
          child: Container(
            height: 25,
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(color: const Color(0xFF303030)),
            ),
            child: TextField(
              controller: controller,
              obscureText: obscureText,
              enabled: enabled,
              style: const TextStyle(
                color: Colors.black,
                fontSize: 12,
                fontFamily: 'monospace',
              ),
              decoration: const InputDecoration(
                border: InputBorder.none,
                contentPadding: EdgeInsets.symmetric(horizontal: 5, vertical: 12),
              ),
            ),
          ),
        ),
      ],
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
import 'package:mobiarmy_flutter/core/assets/bmfont.dart';
import 'package:mobiarmy_flutter/features/authentication/application/auth_controller.dart';
import 'package:mobiarmy_flutter/features/authentication/data/server_catalog.dart';
import 'package:mobiarmy_flutter/shared/widgets/bitmap_text.dart';
import 'package:mobiarmy_flutter/shared/widgets/game_viewport.dart';
import 'package:mobiarmy_flutter/shared/widgets/legacy_button.dart';
import 'package:mobiarmy_flutter/shared/widgets/legacy_panel.dart';

class ServerSelectionScreen extends ConsumerStatefulWidget {
  const ServerSelectionScreen({super.key});

  @override
  ConsumerState<ServerSelectionScreen> createState() => _ServerSelectionScreenState();
}

class _ServerSelectionScreenState extends ConsumerState<ServerSelectionScreen> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    final auth = ref.watch(authControllerProvider);

    return Scaffold(
      backgroundColor: const Color(0xFF77D3FF),
      body: GameViewport(
        child: Stack(
          children: [
            Center(
              child: LegacyPanel(
                width: 300,
                height: 200,
                title: 'Chọn máy chủ',
                child: ListView.builder(
                  padding: EdgeInsets.zero,
                  itemCount: ServerCatalog.servers.length,
                  itemBuilder: (context, index) {
                    final server = ServerCatalog.servers[index];
                    final isSelected = _selectedIndex == index;

                    return GestureDetector(
                      behavior: HitTestBehavior.opaque,
                      onTap: () => setState(() => _selectedIndex = index),
                      child: Container(
                        height: 25,
                        margin: const EdgeInsets.symmetric(vertical: 2),
                        color: isSelected ? const Color(0xFFFFA509) : Colors.transparent,
                        alignment: Alignment.center,
                        child: BitmapText(
                          server.name,
                          colorIndex: isSelected ? 2 : -1, // Black if selected
                          anchor: GraphicsAnchor.hCenter | GraphicsAnchor.top,
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),

            // Bottom Bar
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                height: 40,
                color: const Color(0xFFC5D6EE),
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    LegacyButton(
                      label: 'Cập nhật',
                      onPressed: () {},
                    ),
                    LegacyButton(
                      label: 'Offline',
                      onPressed: () => context.push(AppRoute.offlineSetup.path),
                    ),
                    LegacyButton(
                      label: 'Chọn',
                      onPressed: () {
                        final server = ServerCatalog.servers[_selectedIndex];
                        ref.read(authControllerProvider.notifier).connect(server);
                      },
                    ),
                    LegacyButton(
                      label: 'Thoát',
                      onPressed: () {},
                    ),
                  ],
                ),
              ),
            ),

            if (auth.isBusy)
              const Center(
                child: CircularProgressIndicator(color: Colors.white),
              ),
          ],
        ),
      ),
    );
  }
}
```

### `D:\personal\army/lib\features\gameplay\application\chat_controller.dart`
```dart
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ChatMessage {
  ChatMessage({required this.sender, required this.text});
  final String sender;
  final String text;
  final DateTime timestamp = DateTime.now();
}

class ChatController extends Notifier<List<ChatMessage>> {
  @override
  List<ChatMessage> build() => [];

  void addMessage(String sender, String text) {
    state = [...state, ChatMessage(sender: sender, text: text)];
    if (state.length > 50) {
      state = state.sublist(state.length - 50);
    }
  }

  void clear() => state = [];
}

final chatControllerProvider = NotifierProvider<ChatController, List<ChatMessage>>(ChatController.new);
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

### `D:\personal\army/lib\features\gameplay\application\game_session_bootstrap.dart`
```dart
import 'package:mobiarmy_flutter/core/network/data_cache_parsers.dart';
import 'package:mobiarmy_flutter/features/gameplay/domain/match_state.dart';
import 'package:mobiarmy_flutter/features/gameplay/game/map/destructible_terrain.dart';
import 'package:mobiarmy_flutter/features/gameplay/game/map/game_map_definition.dart';
import 'package:mobiarmy_flutter/features/gameplay/game/map/map_binary_parser.dart';
import 'package:mobiarmy_flutter/features/gameplay/game/map/terrain_component.dart';

/// Noi MatchState (from startGame cmd 20) -> GameMapDefinition + terrain thuc.
/// Map lay tu valuesdata2 da sync (DataCache.mapFiles), parse bang
/// MapBinaryParser — khong can JSON nua.
class OnlineGameSetup {
  OnlineGameSetup({
    required this.match, required this.map,
    required this.terrain,
  });
  final MatchState match;
  final GameMapDefinition map;
  final DestructibleTerrain terrain;
}

abstract final class GameSessionBootstrap {
  static OnlineGameSetup? build(MatchState match) {
    if (match.mapId < 0 || match.mapId >= DataCache.mapFiles.length) {
      return null;
    }
    final entry = DataCache.mapFiles[match.mapId];
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
    for (final p in match.players.values) {
      spawnPoints.add(SpawnPoint(x: p.x, y: p.y));
    }

    final map = GameMapDefinition(
      id: match.mapId,
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
      match: match, map: map, terrain: terrain,
    );
  }
}
```

### `D:\personal\army/lib\features\gameplay\application\gameplay_controller.dart`
```dart
import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logging/logging.dart';
import 'package:mobiarmy_flutter/core/network/command/commands.dart';
import 'package:mobiarmy_flutter/core/network/dispatcher/message_dispatcher.dart';
import 'package:mobiarmy_flutter/core/network/network_provider.dart';
import 'package:mobiarmy_flutter/core/network/protocol/message.dart';
import 'package:mobiarmy_flutter/features/authentication/application/auth_controller.dart';
import 'package:mobiarmy_flutter/features/gameplay/application/chat_controller.dart';
import 'package:mobiarmy_flutter/features/gameplay/data/gameplay_packet_mapper.dart';
import 'package:mobiarmy_flutter/features/gameplay/data/gameplay_repository.dart';
import 'package:mobiarmy_flutter/features/gameplay/domain/match_state.dart';
import 'package:mobiarmy_flutter/features/room/application/room_controller.dart';

class GameplayController extends Notifier<MatchState?> {
  final _logger = Logger('GameplayController');

  late GameplayRepository _repository;
  late GameplayPacketMapper _mapper;
  Timer? _turnTimer;

  @override
  MatchState? build() {
    _mapper = const GameplayPacketMapper();
    _repository = GameplayRepository(ref.watch(tcpSessionProvider));

    final dispatcher = ref.watch(messageDispatcherProvider);
    _registerHandlers(dispatcher);

    ref.onDispose(() {
      _unregisterHandlers(dispatcher);
      _turnTimer?.cancel();
    });

    return null;
  }

  void _registerHandlers(MessageDispatcher dispatcher) {
    dispatcher
      ..register(Commands.startGame, _onStartGame)
      ..register(Commands.setTurn, _onNextTurn)
      ..register(Commands.setWind, _onWind)
      ..register(Commands.move, _onMoveSync)
      ..register(Commands.setXy, _onUpdateXy)
      ..register(Commands.shoot, _onShootSync)
      ..register(Commands.shootResult, _onShootResult)
      ..register(Commands.chat, _onChat)
      ..register(Commands.skipTurn, _onSkipTurn)
      ..register(Commands.useItem, _onUseItem)
      ..register(Commands.getBoss, _onBossSpawn)
      ..register(Commands.bonusMoney, _onBonusMoney)
      ..register(Commands.leaveRoomWait, _onPlayerLeave)
      ..register(Commands.finishMatch, _onFinishMatch);
  }

  void _unregisterHandlers(MessageDispatcher dispatcher) {
    dispatcher
      ..unregister(Commands.startGame, _onStartGame)
      ..unregister(Commands.setTurn, _onNextTurn)
      ..unregister(Commands.setWind, _onWind)
      ..unregister(Commands.move, _onMoveSync)
      ..unregister(Commands.setXy, _onUpdateXy)
      ..unregister(Commands.shoot, _onShootSync)
      ..unregister(Commands.shootResult, _onShootResult)
      ..unregister(Commands.chat, _onChat)
      ..unregister(Commands.skipTurn, _onSkipTurn)
      ..unregister(Commands.useItem, _onUseItem)
      ..unregister(Commands.leaveRoomWait, _onPlayerLeave)
      ..unregister(Commands.finishMatch, _onFinishMatch);
  }

  // ---------------------------------------------------------------- commands

  Future<void> move(int type, int x, int y) async {
    // Local update first? No, server authoritative.
    await _repository.sendMove(type, x, y);
  }

  Future<void> shoot(int angle, int force, int force2, int nShot) async {
    await _repository.sendShoot(angle, force, force2, nShot);
  }

  Future<void> useItem(int itemId) async {
    await _repository.sendUseItem(itemId);
  }

  Future<void> leaveMatch() async {
    await _repository.sendLeave();
    _turnTimer?.cancel();
    state = null;
  }

  // --------------------------------------------------------------- packets

  void _onStartGame(Message message) {
    final roomState = ref.read(roomControllerProvider);
    if (roomState == null) return;

    try {
      state = _mapper.decodeStartGame(message, roomState.players);
      _logger.info('Match started on map ${state?.mapId}');
    } catch (e, stack) {
      _logger.severe('startGame parse failed', e, stack);
    }
  }

  void _onNextTurn(Message message) {
    if (state == null) return;
    try {
      final (playerId, time) = _mapper.decodeNextTurn(message);
      state = state!.copyWith(
        currentTurnPlayerId: playerId,
        turnTimeSeconds: time,
      );

      _turnTimer?.cancel();
      _turnTimer = Timer.periodic(const Duration(seconds: 1), (timer) {
        if (state == null || state!.turnTimeSeconds <= 0) {
          timer.cancel();
          return;
        }
        state = state!.copyWith(turnTimeSeconds: state!.turnTimeSeconds - 1);
      });
    } catch (e) {
      _logger.warning('nextTurn parse failed: $e');
    }
  }

  void _onWind(Message message) {
    if (state == null) return;
    try {
      final (wx, wy) = _mapper.decodeWind(message);
      state = state!.copyWith(windX: wx, windY: wy);
      ref.read(chatControllerProvider.notifier).addMessage(
            'System',
            'Wind changed to $wx',
          );
    } catch (e) {
      _logger.warning('setWind parse failed: $e');
    }
  }

  void _onMoveSync(Message message) {
    if (state == null) return;
    try {
      final (playerId, type, x, y) = _mapper.decodeMove(message);
      final player = state!.players[playerId];
      if (player == null) return;

      final players = Map<int, MatchPlayer>.from(state!.players);
      players[playerId] = player.copyWith(x: x, y: y);
      state = state!.copyWith(players: players);

      // Notify Flame Engine via side effect or stream if needed
      _logger.fine('Player $playerId moved to $x, $y');
    } catch (e) {
      _logger.warning('moveSync parse failed: $e');
    }
  }

  void _onUpdateXy(Message message) {
    if (state == null) return;
    try {
      final (playerId, x, y) = _mapper.decodeUpdateXy(message);
      final player = state!.players[playerId];
      if (player == null) return;

      final players = Map<int, MatchPlayer>.from(state!.players);
      players[playerId] = player.copyWith(x: x, y: y);
      state = state!.copyWith(players: players);
    } catch (e) {
      _logger.warning('updateXy parse failed: $e');
    }
  }

  void _onShootSync(Message message) {
    if (state == null) return;
    try {
      final shootData = _mapper.decodeShoot(message);
      state = state!.copyWith(lastShoot: shootData);
    } catch (e, stack) {
      _logger.severe('shootSync parse failed', e, stack);
    }
  }

  void _onShootResult(Message message) {
    if (state == null) return;
    try {
      final hits = _mapper.decodeShootResult(message);
      final players = Map<int, MatchPlayer>.from(state!.players);
      for (final hit in hits) {
        final p = players[hit.playerId];
        if (p != null) {
          players[hit.playerId] = p.copyWith(
            hp: hit.newHp,
            isDead: hit.isDead,
          );
        }
      }
      state = state!.copyWith(players: players);
    } catch (e) {
      _logger.warning('shootResult parse failed: $e');
    }
  }

  void _onChat(Message message) {
    try {
      final r = message.reader();
      final playerId = r.readInt();
      final text = r.readUTF();
      final sender = state?.players[playerId]?.base.name ?? 'System';
      ref.read(chatControllerProvider.notifier).addMessage(sender, text);
    } catch (_) {}
  }

  void _onSkipTurn(Message message) {
    try {
      final playerId = _mapper.decodeSkipTurn(message);
      _logger.info('Player $playerId skipped their turn');
    } catch (_) {}
  }

  void _onUseItem(Message message) {
    try {
      final (playerId, itemId) = _mapper.decodeUseItem(message);
      _logger.info('Player $playerId used item $itemId');
    } catch (e) {
      _logger.warning('useItem parse failed: $e');
    }
  }

  void _onBossSpawn(Message message) {
    if (state == null) return;
    try {
      final newPlayers = _mapper.decodeAddPlayers(message);
      final players = Map<int, MatchPlayer>.from(state!.players);
      for (final p in newPlayers) {
        players[p.base.id] = p;
        _logger.info('Boss spawned: ${p.base.name} at ${p.x}, ${p.y}');
      }
      state = state!.copyWith(players: players);
    } catch (e) {
      _logger.warning('bossSpawn parse failed: $e');
    }
  }

  void _onBonusMoney(Message message) {
    try {
      final (money, reason) = _mapper.decodeBonusMoney(message);
      ref.read(chatControllerProvider.notifier).addMessage(
            'System',
            'Nhận $money xu: $reason',
          );
    } catch (e) {
      _logger.warning('bonusMoney parse failed: $e');
    }
  }

  void _onPlayerLeave(Message message) {
    if (state == null) return;
    try {
      final playerId = _mapper.decodeLeave(message);
      final players = Map<int, MatchPlayer>.from(state!.players);
      players.remove(playerId);
      state = state!.copyWith(players: players);
      _logger.info('Player $playerId left the match');
    } catch (e) {
      _logger.warning('playerLeave parse failed: $e');
    }
  }

  void _onFinishMatch(Message message) {
    if (state == null) return;
    try {
      final result = _mapper.decodeFinishMatch(message);
      state = state!.copyWith(
        isMatchEnded: true,
        matchResult: result,
      );
      _logger.info('Match finished');
    } catch (e) {
      _logger.warning('finishMatch parse failed: $e');
    }
  }

  Future<void> skipTurn() async {
    await _repository.sendSkipTurn();
  }

  bool get isMyTurn {
    final myId = ref.read(authControllerProvider).session?.id;
    return state?.currentTurnPlayerId == myId;
  }
}

final gameplayControllerProvider =
    NotifierProvider<GameplayController, MatchState?>(GameplayController.new);
```

### `D:\personal\army/lib\features\gameplay\application\gameplay_provider.dart`
```dart
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mobiarmy_flutter/features/gameplay/domain/match_state.dart';
import 'gameplay_controller.dart';

export 'gameplay_handler.dart';

final gameplayControllerProvider =
    NotifierProvider<GameplayController, MatchState?>(
  GameplayController.new,
);
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

### `D:\personal\army/lib\features\gameplay\data\gameplay_packet_mapper.dart`
```dart
import 'package:mobiarmy_flutter/core/network/protocol/message.dart';
import 'package:mobiarmy_flutter/features/gameplay/domain/match_state.dart';
import 'package:mobiarmy_flutter/features/gameplay/game/projectile/projectile_trajectory.dart';
import 'package:mobiarmy_flutter/features/room/domain/room_player.dart';

class GameplayPacketMapper {
  const GameplayPacketMapper();

  /// cmd 20 `startGame`
  MatchState decodeStartGame(Message message, Map<int, RoomPlayer> roomPlayers) {
    final r = message.reader();
    final mapId = r.readByte();
    final playerSize = r.readByte();

    final players = <int, MatchPlayer>{};
    for (int i = 0; i < playerSize; i++) {
      final id = r.readInt();
      final x = r.readShort();
      final y = r.readShort();

      final base = roomPlayers[id];
      if (base != null) {
        players[id] = MatchPlayer(base: base, x: x, y: y);
      }
    }
    if (r.available > 0) r.readByte();

    return MatchState(mapId: mapId, players: players, status: MatchLoopStatus.loadingMap);
  }

  /// cmd 24 `setTurn`
  (int, int) decodeNextTurn(Message message) {
    final r = message.reader();
    return (r.readInt(), r.readShort());
  }

  /// cmd 25 `setWind`
  (int, int) decodeWind(Message message) {
    final r = message.reader();
    final windX = r.readShort();
    final windY = r.available >= 2 ? r.readShort() : 0;
    return (windX, windY);
  }

  /// cmd 21 `move` sync
  (int, int, int, int) decodeMove(Message message) {
    final r = message.reader();
    return (r.readInt(), r.readByte(), r.readShort(), r.readShort());
  }

  /// cmd 53 `updateXy`
  (int, int, int) decodeUpdateXy(Message message) {
    final r = message.reader();
    return (r.readInt(), r.readShort(), r.readShort());
  }

  /// cmd 22 `shoot`
  ShootData decodeShoot(Message message) {
    final r = message.reader();
    final typeShoot = r.readByte();
    final isPow = r.readByte() == 1;
    final playerId = r.readInt();
    final bulletId = r.readByte();
    final gunX = r.readShort();
    final gunY = r.readShort();
    final angle = r.readShort();
    final nShot = r.readByte();
    final numBullets = r.readByte();

    final allTrajectories = <ProjectileTrajectory>[];
    for (int i = 0; i < numBullets; i++) {
      final numFrames = r.readShort();
      final frames = <TrajectoryFrame>[];
      int lastX = 0;
      int lastY = 0;
      for (int j = 0; j < numFrames; j++) {
        if (j == 0 || typeShoot == 1) {
          lastX = r.readShort();
          lastY = r.readShort();
        } else {
          lastX += r.readByte();
          lastY += r.readByte();
        }
        frames.add(TrajectoryFrame(x: lastX, y: lastY));
      }
      allTrajectories.add(
        ProjectileTrajectory(bulletId: bulletId, frames: frames),
      );
    }

    return ShootData(
      playerId: playerId,
      isPow: isPow,
      bulletId: bulletId,
      gunX: gunX,
      gunY: gunY,
      angle: angle,
      nShot: nShot,
      trajectories: allTrajectories,
    );
  }

  /// cmd 23 `shootResult`
  List<HitResult> decodeShootResult(Message message) {
    final r = message.reader();
    final numHits = r.readByte();
    final results = <HitResult>[];
    for (int i = 0; i < numHits; i++) {
      results.add(HitResult(
        playerId: r.readInt(),
        damage: r.readInt(),
        newHp: r.readInt(),
        isDead: r.readBoolean(),
      ));
    }
    return results;
  }

  /// cmd 49 `skipTurn`
  int decodeSkipTurn(Message message) {
    return message.reader().readInt();
  }

  /// cmd 15 `leaveRoomWait` / `leaveMatch`
  int decodeLeave(Message message) {
    return message.reader().readInt();
  }

  /// cmd 26 `useItem`
  (int, int) decodeUseItem(Message message) {
    final r = message.reader();
    return (r.readInt(), r.readByte());
  }

  /// cmd 89 `addPlayer` (Boss spawn)
  List<MatchPlayer> decodeAddPlayers(Message message) {
    final r = message.reader();
    final size = r.readByte();
    final results = <MatchPlayer>[];
    for (int i = 0; i < size; i++) {
      final id = r.readInt();
      final name = r.readUTF();
      final hpMax = r.readInt();
      final glassId = r.readByte();
      final x = r.readShort();
      final y = r.readShort();

      results.add(MatchPlayer(
        base: RoomPlayer(
          id: id,
          name: name,
          level: 0,
          clan: 0,
          glassId: glassId,
          equips: [],
          isBoss: true,
        ),
        x: x,
        y: y,
        hp: hpMax,
        maxHp: hpMax,
      ));
    }
    return results;
  }

  /// cmd 52 `bonusMoney`
  (int, String) decodeBonusMoney(Message message) {
    final r = message.reader();
    return (r.readInt(), r.readUTF());
  }

  /// cmd 100 `finishMatch`
  MatchResult decodeFinishMatch(Message message) {
    final r = message.reader();
    final numPlayers = r.readByte();
    final results = <PlayerMatchResult>[];
    for (int i = 0; i < numPlayers; i++) {
      results.add(PlayerMatchResult(
        playerId: r.readInt(),
        exp: r.readInt(),
        xu: r.readInt(),
        luong: r.readInt(),
      ));
    }
    return MatchResult(playerResults: results);
  }
}

class ShootData {
  const ShootData({
    required this.playerId,
    required this.isPow,
    required this.bulletId,
    required this.gunX,
    required this.gunY,
    required this.angle,
    required this.nShot,
    required this.trajectories,
  });

  final int playerId;
  final bool isPow;
  final int bulletId;
  final int gunX;
  final int gunY;
  final int angle;
  final int nShot;
  final List<ProjectileTrajectory> trajectories;
}

class MatchResult {
  const MatchResult({required this.playerResults});
  final List<PlayerMatchResult> playerResults;
}

class PlayerMatchResult {
  const PlayerMatchResult({
    required this.playerId,
    required this.exp,
    required this.xu,
    required this.luong,
  });
  final int playerId;
  final int exp;
  final int xu;
  final int luong;
}

class HitResult {
  const HitResult({
    required this.playerId,
    required this.damage,
    required this.newHp,
    required this.isDead,
  });
  final int playerId;
  final int damage;
  final int newHp;
  final bool isDead;
}
```

### `D:\personal\army/lib\features\gameplay\data\gameplay_repository.dart`
```dart
import 'package:mobiarmy_flutter/core/network/command/commands.dart';
import 'package:mobiarmy_flutter/core/network/protocol/message.dart';
import 'package:mobiarmy_flutter/core/network/transport/tcp_session.dart';

class GameplayRepository {
  GameplayRepository(this._session);
  final TcpSession _session;

  Future<void> sendMove(int type, int x, int y) async {
    final message = Message(Commands.move);
    message.writer().writeByte(type);
    message.writer().writeShort(x);
    message.writer().writeShort(y);
    await _session.sendMessage(message);
  }

  Future<void> sendShoot(int angle, int force, int force2, int nShot) async {
    final message = Message(Commands.shoot);
    message.writer().writeShort(angle);
    message.writer().writeByte(force);
    message.writer().writeByte(force2);
    message.writer().writeByte(nShot);
    await _session.sendMessage(message);
  }

  Future<void> sendSkipTurn() async {
    await _session.sendMessage(Message(Commands.skipTurn));
  }

  Future<void> sendUseItem(int itemId) async {
    final message = Message(Commands.useItem);
    message.writer().writeByte(itemId);
    await _session.sendMessage(message);
  }

  Future<void> sendLeave() async {
    await _session.sendMessage(Message(Commands.leaveRoomWait));
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
    this.hp = 1000,
    this.maxHp = 1000,
    this.angle = 0,
    this.force = 0,
    this.isAngry = false,
    this.isFrozen = false,
    this.isPoisoned = false,
    this.isSmoked = false,
    this.isWebbed = false,
    this.isTimeBomb = false,
    this.isInvisible = false,
  });

  final CharacterAnimationKind kind;
  final int frame;
  final double elapsed;
  final CharacterFacing facing;
  final int hp;
  final int maxHp;
  final int angle;
  final int force;
  final bool isAngry;
  final bool isFrozen;
  final bool isPoisoned;
  final bool isSmoked;
  final bool isWebbed;
  final bool isTimeBomb;
  final bool isInvisible;

  CharacterAnimationState copyWith({
    CharacterAnimationKind? kind,
    int? frame,
    double? elapsed,
    CharacterFacing? facing,
    int? hp,
    int? maxHp,
    int? angle,
    int? force,
    bool? isAngry,
    bool? isFrozen,
    bool? isPoisoned,
    bool? isSmoked,
    bool? isWebbed,
    bool? isTimeBomb,
    bool? isInvisible,
  }) => CharacterAnimationState(
    kind: kind ?? this.kind,
    frame: frame ?? this.frame,
    elapsed: elapsed ?? this.elapsed,
    facing: facing ?? this.facing,
    hp: hp ?? this.hp,
    maxHp: maxHp ?? this.maxHp,
    angle: angle ?? this.angle,
    force: force ?? this.force,
    isAngry: isAngry ?? this.isAngry,
    isFrozen: isFrozen ?? this.isFrozen,
    isPoisoned: isPoisoned ?? this.isPoisoned,
    isSmoked: isSmoked ?? this.isSmoked,
    isWebbed: isWebbed ?? this.isWebbed,
    isTimeBomb: isTimeBomb ?? this.isTimeBomb,
    isInvisible: isInvisible ?? this.isInvisible,
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

### `D:\personal\army/lib\features\gameplay\domain\match_state.dart`
```dart
import 'package:mobiarmy_flutter/features/gameplay/data/gameplay_packet_mapper.dart';
import 'package:mobiarmy_flutter/features/room/domain/room_player.dart';

enum MatchLoopStatus {
  preparing,
  loadingMap,
  spawning,
  turnStart,
  playerInput,
  firing,
  projectilePlayback,
  resolvingImpact,
  turnEnd,
  nextTurn,
  matchEnd,
}

/// Runtime data for an active match with strict FSM tracking.
class MatchState {
  const MatchState({
    required this.mapId,
    required this.players,
    this.status = MatchLoopStatus.preparing,
    this.currentTurnPlayerId,
    this.turnTimeSeconds = 0,
    this.windX = 0,
    this.windY = 0,
    this.isMatchEnded = false,
    this.matchResult,
    this.lastShoot,
  });

  final int mapId;
  final Map<int, MatchPlayer> players;
  final MatchLoopStatus status;
  final int? currentTurnPlayerId;
  final int turnTimeSeconds;
  final int windX;
  final int windY;
  final bool isMatchEnded;
  final MatchResult? matchResult;
  final ShootData? lastShoot;

  MatchState copyWith({
    MatchLoopStatus? status,
    int? currentTurnPlayerId,
    int? turnTimeSeconds,
    int? windX,
    int? windY,
    Map<int, MatchPlayer>? players,
    bool? isMatchEnded,
    MatchResult? matchResult,
    ShootData? lastShoot,
  }) {
    return MatchState(
      mapId: mapId,
      players: players ?? this.players,
      status: status ?? this.status,
      currentTurnPlayerId: currentTurnPlayerId ?? this.currentTurnPlayerId,
      turnTimeSeconds: turnTimeSeconds ?? this.turnTimeSeconds,
      windX: windX ?? this.windX,
      windY: windY ?? this.windY,
      isMatchEnded: isMatchEnded ?? this.isMatchEnded,
      matchResult: matchResult ?? this.matchResult,
      lastShoot: lastShoot ?? this.lastShoot,
    );
  }
}

/// Runtime extension of RoomPlayer during gameplay.
class MatchPlayer {
  const MatchPlayer({
    required this.base,
    required this.x,
    required this.y,
    this.hp = 1000,
    this.maxHp = 1000,
    this.stamina = 100.0,
    this.isDead = false,
    this.state = 0,
  });

  final RoomPlayer base;
  final int x;
  final int y;
  final int hp;
  final int maxHp;
  final double stamina;
  final bool isDead;
  final int state;

  MatchPlayer copyWith({
    int? x,
    int? y,
    int? hp,
    double? stamina,
    bool? isDead,
    int? state,
  }) {
    return MatchPlayer(
      base: base,
      x: x ?? this.x,
      y: y ?? this.y,
      hp: hp ?? this.hp,
      stamina: stamina ?? this.stamina,
      isDead: isDead ?? this.isDead,
      state: state ?? this.state,
    );
  }
}
```

### `D:\personal\army/lib\features\gameplay\domain\player\movement_intent.dart`
```dart
enum MovementDirection { none, left, right }

class MovementIntent {
  const MovementIntent({
    this.direction = MovementDirection.none,
    this.jump = false,
  });

  final MovementDirection direction;
  final bool jump;

  static const none = MovementIntent();
}
```

### `D:\personal\army/lib\features\gameplay\domain\player\player_movement_state.dart`
```dart
import 'package:flame/extensions.dart';

enum PlayerMovementKind {
  idle,
  walking,
  falling,
  hurt,
  dead,
  frozen,
  teleport,
}

class PlayerMovementState {
  PlayerMovementState({
    this.kind = PlayerMovementKind.idle,
    Vector2? velocity,
    this.isOnGround = false,
    this.stamina = 100.0,
    this.friction = 0.1,
    this.slopeAngle = 0.0,
  }) : velocity = velocity ?? Vector2.zero();

  final PlayerMovementKind kind;
  final Vector2 velocity;
  final bool isOnGround;
  final double stamina;
  final double friction;
  final double slopeAngle;

  PlayerMovementState copyWith({
    PlayerMovementKind? kind,
    Vector2? velocity,
    bool? isOnGround,
    double? stamina,
    double? friction,
    double? slopeAngle,
  }) {
    return PlayerMovementState(
      kind: kind ?? this.kind,
      velocity: velocity ?? this.velocity,
      isOnGround: isOnGround ?? this.isOnGround,
      stamina: stamina ?? this.stamina,
      friction: friction ?? this.friction,
      slopeAngle: slopeAngle ?? this.slopeAngle,
    );
  }
}
```

### `D:\personal\army/lib\features\gameplay\domain\room_list_models.dart`
```dart
import 'package:mobiarmy_flutter/core/network/data_cache_parsers.dart';
import 'package:mobiarmy_flutter/core/network/protocol/message.dart';

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
import 'package:flame/events.dart';
import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:mobiarmy_flutter/core/audio/audio_service.dart';
import 'package:mobiarmy_flutter/features/gameplay/domain/match_state.dart';
import 'package:mobiarmy_flutter/features/gameplay/game/effects/explosion_component.dart';
import 'package:mobiarmy_flutter/features/gameplay/game/input/gameplay_input_controller.dart';
import 'package:mobiarmy_flutter/features/gameplay/game/map/background_component.dart';
import 'package:mobiarmy_flutter/features/gameplay/game/map/destructible_terrain.dart';
import 'package:mobiarmy_flutter/features/gameplay/game/map/game_map_definition.dart';
import 'package:mobiarmy_flutter/features/gameplay/game/map/map_json_loader.dart';
import 'package:mobiarmy_flutter/features/gameplay/game/map/terrain_component.dart';
import 'package:mobiarmy_flutter/features/gameplay/game/player/boss_character.dart';
import 'package:mobiarmy_flutter/features/gameplay/game/player/game_player.dart';
import 'package:mobiarmy_flutter/features/gameplay/game/player/online_character.dart';
import 'package:mobiarmy_flutter/features/gameplay/game/projectile/projectile_component.dart';
import 'package:mobiarmy_flutter/features/gameplay/game/projectile/projectile_trajectory.dart';
import 'package:mobiarmy_flutter/features/gameplay/game/projectile/trajectory_simulator.dart';
import 'package:mobiarmy_flutter/features/gameplay/game/sandbox/sandbox_scenario.dart';
import 'package:mobiarmy_flutter/features/gameplay/game/systems/camera_system.dart';
import 'package:mobiarmy_flutter/features/gameplay/game/systems/combat_system.dart';
import 'package:mobiarmy_flutter/features/gameplay/game/systems/player_collision_system.dart';
import 'package:mobiarmy_flutter/features/gameplay/game/systems/player_movement_system.dart';

class ArmyGame extends FlameGame with DragCallbacks, HasKeyboardHandlerComponents, ScrollDetector {
  ArmyGame({this.scenario, this.onLoaded, this.audio});

  final SandboxScenario? scenario;
  final VoidCallback? onLoaded;
  final AudioService? audio;

  late final GameplayInputController inputController;
  late final World gameWorld;
  late final CameraSystem cameraSystem;

  DestructibleTerrain? terrain;
  GameMapDefinition? map;
  final Map<int, GamePlayer> players = {};
  int? activePlayerId;
  int windX = 0;
  int windY = 0;
  TerrainComponent? _terrainComponent;

  Future<void> setupMatch(MatchState matchState) async {
    // 1. Clear existing
    gameWorld.removeAll(gameWorld.children);
    players.clear();

    // 2. Load Map (Placeholder until Phase 3 complete)
    // For now, we reuse the Sandbox maps logic
    map = scenario?.map ??
        MapJsonLoader.parse(
          SandboxMaps.cayCauBang,
          mapId: matchState.mapId,
          backgroundId: 7,
        );
    terrain = TerrainMaskBuilder.build(map!, tileSize: SandboxMaps.tileSize);

    await gameWorld.add(
      BackgroundComponent(
        environment: map!.environment,
        mapSize: Vector2(map!.width.toDouble(), map!.height.toDouble()),
      ),
    );

    final terrainComponent = TerrainComponent(terrain: terrain!);
    _terrainComponent = terrainComponent;
    await gameWorld.add(terrainComponent);

    // 3. Spawn Players
    for (final entry in matchState.players.entries) {
      final id = entry.key;
      final p = entry.value;

      GamePlayer character;
      if (p.base.isBoss) {
        character = BossCharacter(
          bossType: BossType.fromGunType(p.base.glassId),
          id: id,
          name: p.base.name,
          maxHp: p.maxHp,
        )..hp = p.hp;
      } else {
        character = OnlineCharacter(
          glassId: p.base.glassId,
          equipIds: p.base.equips,
          name: p.base.name,
          maxHp: p.maxHp,
        );
        await (character as OnlineCharacter).load();
        character.hp = p.hp;
      }

      character.moveTo(p.x.toDouble(), p.y.toDouble());
      await gameWorld.add(character);
      players[id] = character;
    }

    windX = matchState.windX;
    windY = matchState.windY;
    activePlayerId = matchState.currentTurnPlayerId;
  }

  Future<void> syncPlayers(Map<int, MatchPlayer> matchPlayers) async {
    // Add new players or bosses
    for (final entry in matchPlayers.entries) {
      final id = entry.key;
      final p = entry.value;

      if (!players.containsKey(id)) {
        GamePlayer character;
        if (p.base.isBoss) {
          character = BossCharacter(
            bossType: BossType.fromGunType(p.base.glassId),
            id: id,
            name: p.base.name,
            maxHp: p.maxHp,
          )..hp = p.hp;
        } else {
          character = OnlineCharacter(
            glassId: p.base.glassId,
            equipIds: p.base.equips,
            name: p.base.name,
            maxHp: p.maxHp,
          );
          await (character as OnlineCharacter).load();
          character.hp = p.hp;
        }
        character.moveTo(p.x.toDouble(), p.y.toDouble());
        await gameWorld.add(character);
        players[id] = character;
      } else {
        // Sync stats for existing
        final character = players[id]!;
        character.hp = p.hp;
        if (character is BossCharacter) {
          character.state = p.state;
        }
      }
    }

    // Remove players who left
    final idsToRemove = players.keys.where((id) => !matchPlayers.containsKey(id)).toList();
    for (final id in idsToRemove) {
      final c = players.remove(id);
      if (c != null) gameWorld.remove(c);
    }
  }

  @override
  Color backgroundColor() => const Color(0xFF87CEEB); // Sky blue background color

  @override
  Future<void> onLoad() async {
    await super.onLoad();

    gameWorld = World();
    world = gameWorld; // Gán world để camera nhìn thấy
    await add(gameWorld);

    inputController = GameplayInputController();
    await add(inputController);

    await add(PlayerMovementSystem());
    await add(PlayerCollisionSystem());
    await add(CombatSystem());
    cameraSystem = CameraSystem();
    await add(cameraSystem);

    camera.viewfinder.anchor = Anchor.center;
    camera.viewfinder.zoom = 2.0; // Zoom in to see characters clearly as in original game

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
      activePlayerId = 0; // Đặt nhân vật đầu tiên làm người chơi hiện tại để Camera follow
    }

    onLoaded?.call();
  }

  /// Entry point for network replay (command 22), reused by offline fire().
  void spawnProjectile(ProjectileTrajectory trajectory) {
    gameWorld.add(
      ProjectileComponent(trajectory: trajectory, onImpact: _onBulletImpact),
    );
    audio?.playSfx('shoot');
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

  void _onBulletImpact(int x, int y, int radius) {
    _terrainComponent?.makeHole(x, y, radius);
    gameWorld.add(ExplosionComponent(
      position: Vector2(x.toDouble(), y.toDouble()),
      radius: radius.toDouble(),
    ));
    cameraSystem.shake(intensity: 3, duration: 0.25);
    audio?.playSfx('explosion');
  }

  @override
  void onDragUpdate(DragUpdateEvent event) {
    super.onDragUpdate(event);
    cameraSystem.pan(event.localDelta);
  }

  @override
  void onScroll(PointerScrollInfo info) {
    super.onScroll(info);
    final scrollDelta = info.scrollDelta.global.y;
    if (scrollDelta != 0) {
      final zoomDelta = -scrollDelta / 500;
      final newZoom = (camera.viewfinder.zoom + zoomDelta).clamp(0.5, 4.0);
      camera.viewfinder.zoom = newZoom;
    }
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

### `D:\personal\army/lib\features\gameplay\game\effects\damage_text_component.dart`
```dart
import 'package:flame/components.dart';
import 'package:flutter/material.dart';

class DamageTextComponent extends PositionComponent {
  DamageTextComponent({
    required Vector2 position,
    required this.damage,
  }) : super(position: position, priority: 50);

  final int damage;
  double _elapsed = 0;
  static const double duration = 1.0;
  static const double upwardSpeed = 40.0;

  @override
  void update(double dt) {
    super.update(dt);
    _elapsed += dt;
    position.y -= upwardSpeed * dt;
    if (_elapsed >= duration) {
      removeFromParent();
    }
  }

  @override
  void render(Canvas canvas) {
    final opacity = (1.0 - _elapsed / duration).clamp(0.0, 1.0);
    final textPainter = TextPainter(
      text: TextSpan(
        text: '-$damage',
        style: TextStyle(
          color: Colors.red.withValues(alpha: opacity),
          fontSize: 16,
          fontWeight: FontWeight.bold,
          shadows: const [Shadow(blurRadius: 2, color: Colors.black)],
        ),
      ),
      textDirection: TextDirection.ltr,
    );
    textPainter.layout();
    textPainter.paint(canvas, Offset(-textPainter.width / 2, -textPainter.height / 2));
  }
}
```

### `D:\personal\army/lib\features\gameplay\game\effects\effects.dart`
```dart
import 'dart:ui' as ui;
import 'package:flame/components.dart';
import 'package:mobiarmy_flutter/core/assets/bmfont.dart';
import 'package:mobiarmy_flutter/core/assets/game_asset_loader.dart';
import 'package:mobiarmy_flutter/core/assets/graphics_utility.dart';

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

    // Original anchor: HCENTER | VCENTER with -12 vertical offset
    GraphicsUtility.drawRegion(
      canvas,
      img!,
      sx.toDouble(),
      sy.toDouble(),
      frameW.toDouble(),
      frameH.toDouble(),
      GraphicsUtility.transNone,
      x,
      y - 12,
      GraphicsAnchor.hCenter | GraphicsAnchor.vCenter,
    );
  }
}
```

### `D:\personal\army/lib\features\gameplay\game\effects\explosion_component.dart`
```dart
import 'package:flame/components.dart';
import 'package:flutter/material.dart';

class ExplosionComponent extends PositionComponent with HasGameRef {
  ExplosionComponent({
    required Vector2 position,
    required this.radius,
  }) : super(position: position, anchor: Anchor.center, priority: 30);

  final double radius;
  double _elapsed = 0;
  static const double duration = 0.4;

  @override
  void update(double dt) {
    super.update(dt);
    _elapsed += dt;
    if (_elapsed >= duration) {
      removeFromParent();
    }
  }

  @override
  void render(Canvas canvas) {
    final progress = _elapsed / duration;
    final currentRadius = radius * (0.5 + 0.5 * progress);
    final opacity = (1.0 - progress).clamp(0.0, 1.0);

    final paint = Paint()
      ..color = Colors.orange.withValues(alpha: opacity)
      ..style = PaintingStyle.fill;

    canvas.drawCircle(Offset.zero, currentRadius, paint);

    final corePaint = Paint()
      ..color = Colors.yellow.withValues(alpha: opacity)
      ..style = PaintingStyle.fill;

    canvas.drawCircle(Offset.zero, currentRadius * 0.6, corePaint);
  }
}
```

### `D:\personal\army/lib\features\gameplay\game\effects\smoke_particle.dart`
```dart
import 'package:flame/components.dart';
import 'package:flutter/material.dart';

class SmokeParticle extends PositionComponent {
  SmokeParticle({
    required Vector2 position,
    this.lifespan = 0.5,
  }) : super(position: position, size: Vector2.all(4), anchor: Anchor.center, priority: 15);

  final double lifespan;
  double _elapsed = 0;

  @override
  void update(double dt) {
    super.update(dt);
    _elapsed += dt;
    if (_elapsed >= lifespan) {
      removeFromParent();
    }
  }

  @override
  void render(Canvas canvas) {
    final progress = _elapsed / lifespan;
    final opacity = (0.6 * (1.0 - progress)).clamp(0.0, 1.0);
    final size = 4.0 * (1.0 + progress);

    final paint = Paint()..color = Colors.white.withValues(alpha: opacity);
    canvas.drawCircle(Offset.zero, size / 2, paint);
  }
}
```

### `D:\personal\army/lib\features\gameplay\game\input\gameplay_input_controller.dart`
```dart
import 'package:flame/components.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'gameplay_input_state.dart';

class GameplayInputController extends Component with ChangeNotifier, KeyboardHandler {
  GameplayInputState _state = const GameplayInputState();
  GameplayInputState get state => _state;

  /// Speed of charging, 100 units in 2 seconds
  static const double chargeSpeed = 50.0;
  static const double angleChangeSpeed = 40.0; // degrees per second

  int _angleDelta = 0;

  @override
  bool onKeyEvent(KeyEvent event, Set<LogicalKeyboardKey> keysPressed) {
    if (event is KeyDownEvent) {
      if (event.logicalKey == LogicalKeyboardKey.arrowLeft) setMovingLeft(true);
      if (event.logicalKey == LogicalKeyboardKey.arrowRight) setMovingRight(true);
      if (event.logicalKey == LogicalKeyboardKey.arrowUp) setAngleDelta(1);
      if (event.logicalKey == LogicalKeyboardKey.arrowDown) setAngleDelta(-1);
      if (event.logicalKey == LogicalKeyboardKey.space) startCharging();
    } else if (event is KeyUpEvent) {
      if (event.logicalKey == LogicalKeyboardKey.arrowLeft) setMovingLeft(false);
      if (event.logicalKey == LogicalKeyboardKey.arrowRight) setMovingRight(false);
      if (event.logicalKey == LogicalKeyboardKey.arrowUp || event.logicalKey == LogicalKeyboardKey.arrowDown) setAngleDelta(0);
      if (event.logicalKey == LogicalKeyboardKey.space) stopCharging();
    }
    return true;
  }

  void setAngleDelta(int delta) {
    _angleDelta = delta;
  }

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

  void reset() {
    _state = const GameplayInputState();
    _angleDelta = 0;
    notifyListeners();
  }

  @override
  void update(double dt) {
    bool changed = false;
    if (_state.isCharging) {
      final newForce = (_state.force + dt * chargeSpeed).clamp(0.0, 100.0);
      if (newForce != _state.force) {
        _state = _state.copyWith(force: newForce);
        changed = true;
      }
    }

    if (_angleDelta != 0) {
      final double delta = _angleDelta * angleChangeSpeed * dt;
      var newAngle = _state.angle + delta.round();
      while (newAngle < 0) {
        newAngle += 360;
      }
      while (newAngle >= 360) {
        newAngle -= 360;
      }

      if (newAngle != _state.angle) {
        _state = _state.copyWith(angle: newAngle);
        changed = true;
      }
    }

    if (changed) {
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
import 'dart:ui' as ui;

import 'package:flame/components.dart';
import 'package:mobiarmy_flutter/features/gameplay/game/army_game.dart';
import 'package:mobiarmy_flutter/features/gameplay/game/map/game_map_definition.dart';

class BackgroundComponent extends PositionComponent with HasGameReference<ArmyGame> {
  BackgroundComponent({required this.environment, required Vector2 mapSize})
    : super(size: mapSize, priority: -100);

  final MapEnvironmentDefinition environment;
  ui.Image? _bgImage;

  @override
  Future<void> onLoad() async {
    await super.onLoad();
    try {
      // Dùng bigImage0.png thường là hình bầu trời/mây trong Mobi Army 2
      _bgImage = await game.images.load('BigImage/bigImage0.png');
    } catch (_) {
      // Nếu không có bigImage0, thử bigImage7 hoặc bỏ qua
    }
  }

  @override
  void render(ui.Canvas canvas) {
    // Vẽ màu nền xanh trời mặc định của Army 2
    canvas.drawRect(
      ui.Rect.fromLTWH(0, 0, size.x, size.y),
      ui.Paint()..color = const ui.Color(0xFF87CEEB),
    );

    if (_bgImage != null) {
      // Vẽ lặp lại hình nền (Tiled) thay vì kéo giãn toàn bộ
      final paint = ui.Paint()..filterQuality = ui.FilterQuality.none;
      for (double x = 0; x < size.x; x += _bgImage!.width) {
        canvas.drawImage(_bgImage!, ui.Offset(x, 0), paint);
      }
    }

    if (environment.hasWaterOrGlass) {
      canvas.drawRect(
        ui.Rect.fromLTWH(
          0,
          environment.waterY.toDouble(),
          size.x,
          (size.y - environment.waterY).clamp(0.0, size.y).toDouble(),
        ),
        ui.Paint()..color = const ui.Color(0x8838bdf8),
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

  double? findGroundBelow(double startX, double startY, {double maxDistance = 500}) {
    final ix = startX.toInt();
    final iyStart = startY.toInt();
    for (int dy = 0; dy < maxDistance; dy++) {
      final y = iyStart + dy;
      if (isSolid(ix, y)) {
        return y.toDouble();
      }
    }
    return null;
  }

  void makeHole(int centerX, int centerY, int radius) {
    final r2 = radius * radius;
    for (int y = centerY - radius; y <= centerY + radius; y++) {
      if (y < 0 || y >= height) continue;
      final rowOffset = y * width;
      for (int x = centerX - radius; x <= centerX + radius; x++) {
        if (x < 0 || x >= width) continue;
        final dx = x - centerX;
        final dy = y - centerY;
        if (dx * dx + dy * dy <= r2) {
          _mask[rowOffset + x] = 0;
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

/// Builds a pixel collision mask from brick metadata matching alpha bounds.
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

/// Renders the destructible terrain from the collision mask using Nearest-Neighbor filtering.
class TerrainComponent extends PositionComponent {
  TerrainComponent({
    required DestructibleTerrain terrain,
    this.cellSize = 2,
    this.groundColor = const ui.Color(0xFFB0E2FF),
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
    _cache = null;
  }

  ui.Picture _buildCache() {
    final recorder = ui.PictureRecorder();
    final canvas = ui.Canvas(recorder);
    final paint = ui.Paint()
      ..color = groundColor
      ..filterQuality = ui.FilterQuality.none;
    final linePaint = ui.Paint()
      ..color = ui.Color(0xFF000000).withValues(alpha: 0.1)
      ..strokeWidth = 1
      ..filterQuality = ui.FilterQuality.none;

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

          if (cx % 16 == 0 && cy % 8 == 0) {
             canvas.drawLine(
               ui.Offset(cx.toDouble(), cy.toDouble()),
               ui.Offset(cx.toDouble() + 16, cy.toDouble()),
               linePaint,
             );
             canvas.drawLine(
               ui.Offset(cx.toDouble(), cy.toDouble()),
               ui.Offset(cx.toDouble(), cy.toDouble() + 8),
               linePaint,
             );
          }
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
import 'package:mobiarmy_flutter/features/gameplay/domain/character/character_animation_state.dart';
import 'package:mobiarmy_flutter/features/gameplay/domain/character/character_appearance.dart';
import 'package:mobiarmy_flutter/features/gameplay/domain/character/character_definition.dart';
import 'package:mobiarmy_flutter/features/gameplay/domain/character/equipment_definition.dart';
import 'package:mobiarmy_flutter/features/gameplay/domain/player/movement_intent.dart';
import 'package:mobiarmy_flutter/features/gameplay/domain/player/player_movement_state.dart';
import 'package:mobiarmy_flutter/features/gameplay/game/player/character_animation_controller.dart';
import 'package:mobiarmy_flutter/features/gameplay/game/player/character_sprite_resolver.dart';
import 'package:mobiarmy_flutter/features/gameplay/game/player/equipment_layer_component.dart';
import 'package:mobiarmy_flutter/features/gameplay/game/player/game_player.dart';

final class CharacterComponent extends GamePlayer {
  CharacterComponent({
    required this.name,
    required this.appearance,
    required this.glassId,
    required this.resolver,
    required this.animationController,
    CharacterAnimationState animation = const CharacterAnimationState(),
    PlayerMovementState? movement,
  }) : _animation = animation,
       _movement = movement ?? PlayerMovementState();

  @override
  final String name;
  CharacterAppearance appearance;
  final int glassId;
  final CharacterSpriteResolver resolver;
  final CharacterAnimationController animationController;
  CharacterAnimationState _animation;
  PlayerMovementState _movement;
  final Map<EquipmentSlot, EquipmentLayerComponent> _layers = {};

  @override
  int get hp => _animation.hp;
  @override
  set hp(int value) {
    _animation = _animation.copyWith(hp: value);
  }

  @override
  int get maxHp => _animation.maxHp;
  @override
  set maxHp(int value) {
    _animation = _animation.copyWith(maxHp: value);
  }

  @override
  MovementIntent intent = MovementIntent.none;

  @override
  PlayerMovementState get movement => _movement;
  @override
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

  @override
  void update(double dt) {
    super.update(dt);

    // 1. Sync Animation Kind with Movement State
    CharacterAnimationKind nextKind = _animation.kind;
    switch (_movement.kind) {
      case PlayerMovementKind.idle:
        nextKind = CharacterAnimationKind.idle;
      case PlayerMovementKind.walking:
        nextKind = CharacterAnimationKind.walk;
      case PlayerMovementKind.falling:
        nextKind = CharacterAnimationKind.idle;
      case PlayerMovementKind.hurt:
        nextKind = CharacterAnimationKind.hurt;
      case PlayerMovementKind.dead:
        nextKind = CharacterAnimationKind.death;
      case PlayerMovementKind.frozen:
        nextKind = CharacterAnimationKind.idle;
      case PlayerMovementKind.teleport:
        nextKind = CharacterAnimationKind.idle;
    }

    // 2. Sync Facing with Movement Intent/Velocity
    CharacterFacing nextFacing = _animation.facing;
    if (_movement.velocity.x > 0.1) {
      nextFacing = CharacterFacing.right;
    } else if (_movement.velocity.x < -0.1) {
      nextFacing = CharacterFacing.left;
    }

    if (nextKind != _animation.kind || nextFacing != _animation.facing) {
       _animation = _animation.copyWith(kind: nextKind, facing: nextFacing, frame: 0, elapsed: 0);
    }

    // 3. Update Animation Frame
    final nextState = animationController.update(_animation, dt);
    if (nextState.frame != _animation.frame || nextState.kind != _animation.kind) {
      _animation = nextState;
      _synchronizeLayers();
    }
  }

  void setAnimation(CharacterAnimationState value) {
    _animation = value;
    _synchronizeLayers();
  }

  void setAppearance(CharacterAppearance value) {
    appearance = value;
    _synchronizeLayers();
  }

  @override
  void moveTo(double x, double y) {
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

  CharacterAnimationState get animationState => _animation;
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
import 'dart:ui';

import 'package:flame/components.dart';

class EquipmentLayerComponent extends SpriteComponent {
  EquipmentLayerComponent({required super.priority}) {
    paint.filterQuality = FilterQuality.none;
  }

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
import 'package:mobiarmy_flutter/features/gameplay/domain/player/movement_intent.dart';
import 'package:mobiarmy_flutter/features/gameplay/domain/player/player_movement_state.dart';

/// Common contract for anything controllable in the sandbox, so that both the
/// placeholder sandbox character and the real [CharacterComponent] can be
/// driven by PlayerMovementSystem / PlayerCollisionSystem.
abstract base class GamePlayer extends PositionComponent {
  GamePlayer({super.priority});

  String get name;
  PlayerMovementState get movement;
  set movement(PlayerMovementState value);
  void moveTo(double x, double y);
  MovementIntent get intent;
  set intent(MovementIntent value);
  int get hp;
  set hp(int value);
  int get maxHp;
  set maxHp(int value);
}
```

### `D:\personal\army/lib\features\gameplay\game\player\online_character.dart`
```dart
import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:mobiarmy_flutter/core/assets/bmfont.dart';
import 'package:mobiarmy_flutter/core/assets/graphics_utility.dart';
import 'package:mobiarmy_flutter/core/network/data_cache_parsers.dart';
import 'package:mobiarmy_flutter/features/gameplay/domain/player/movement_intent.dart';
import 'package:mobiarmy_flutter/features/gameplay/domain/player/player_movement_state.dart';
import 'package:mobiarmy_flutter/features/gameplay/game/player/equip_anchor.dart';
import 'package:mobiarmy_flutter/features/gameplay/game/player/game_player.dart';
import 'package:mobiarmy_flutter/features/gameplay/game/player/player_sprites.dart';

/// Nhan vat online THAT: body strip tu PlayerSprites (playerdata2 FilePack)
/// + trang bi ve dung cong thuc EquipAnchor (+18/+40, W/H theo glass,
/// mirror khi quay trai, thu tu: SUNG->CANH->FACE->NON->GIAP->KINH).
final class OnlineCharacter extends GamePlayer {
  OnlineCharacter({
    required this.glassId,
    required this.equipIds, // 5 slot: gun, hat, armor, glasses, wing
    required this.name,
    this.maxHp = 1000,
    this.equipAtlas,
  });

  final int glassId;
  final List<int> equipIds;
  @override
  final String name;
  @override
  int maxHp;
  ui.Image? equipAtlas; // imgData[glass] — nap tu cmd 126
  ui.Image? _body;

  @override
  int hp = 1000;
  int look = 0; // 0 = phai, 2 = trai
  int frame = 0; // 0..5 animation frame
  bool isReady = false;

  @override
  PlayerMovementState movement = PlayerMovementState(isOnGround: true);

  @override
  MovementIntent intent = MovementIntent.none;

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
    final isMirror = look == 2;
    final transform =
        isMirror ? GraphicsUtility.transMirror : GraphicsUtility.transNone;

    // Drawing order: SUNG (0) -> CANH (4) -> FACE -> NON (1) -> GIAP (2) -> KINH (3)
    _drawSlot(canvas, _slots[0], f, transform);
    _drawSlot(canvas, _slots[4], f, transform);

    if (_body != null) {
      final src = BodyStrip.srcRegion(_body!, f);
      // Body anchor is BOTTOM | HCENTER
      GraphicsUtility.drawRegion(
        canvas,
        _body!,
        src.left,
        src.top,
        src.width,
        src.height,
        transform,
        0,
        0,
        GraphicsAnchor.bottom | GraphicsAnchor.hCenter,
      );
    } else {
      canvas.drawRect(
        const Rect.fromLTWH(-8, -26, 16, 26),
        Paint()..color = const Color(0xFF94A3B8),
      );
    }

    _drawSlot(canvas, _slots[1], f, transform);
    _drawSlot(canvas, _slots[2], f, transform);
    _drawSlot(canvas, _slots[3], f, transform);

    _drawHpBar(canvas);
  }

  void _drawSlot(Canvas canvas, EquipEntry? e, int f, int transform) {
    if (e == null) return;
    final g = e.frames[f.clamp(0, e.frames.length - 1)];
    final d = EquipAnchor.dest(
      glassId,
      f,
      look,
      0,
      0,
      g.x,
      g.y,
      g.w,
      g.h,
      g.dx,
      g.dy,
    );

    if (equipAtlas != null) {
      // EquipAnchor.dest provides top-left for the target, so we use TOP | LEFT anchor.
      GraphicsUtility.drawRegion(
        canvas,
        equipAtlas!,
        g.x.toDouble(),
        g.y.toDouble(),
        g.w.toDouble(),
        g.h.toDouble(),
        transform,
        d.dx,
        d.dy,
        GraphicsAnchor.top | GraphicsAnchor.left,
      );
    } else {
      canvas.drawRect(
        Rect.fromLTWH(d.dx, d.dy, g.w.toDouble(), g.h.toDouble()),
        Paint()..color = const Color(0x66F59E0B),
      );
    }
  }

  void _drawHpBar(Canvas canvas) {
    final pct = (hp / maxHp).clamp(0.0, 1.0);
    final paint = Paint()..color = Colors.black54;
    canvas.drawRect(const Rect.fromLTWH(-20, -38, 40, 5), paint);
    paint.color = pct > 0.3 ? Colors.green : Colors.red;
    canvas.drawRect(Rect.fromLTWH(-20, -38, 40 * pct, 5), paint);
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
import 'dart:ui' as ui;

import 'package:flame/components.dart';
import 'package:mobiarmy_flutter/features/gameplay/domain/character/equipment_definition.dart';
import 'package:mobiarmy_flutter/features/gameplay/domain/player/movement_intent.dart';
import 'package:mobiarmy_flutter/features/gameplay/domain/player/player_movement_state.dart';
import 'package:mobiarmy_flutter/features/gameplay/game/army_game.dart';
import 'package:mobiarmy_flutter/features/gameplay/game/player/game_player.dart';

/// Placeholder character for the offline vertical slice.
///
/// Renders real sprite sheets from Teamobi `assets/equip/` using real frame
/// geometry so layer offsets and anchor conventions are exercised.
final class SandboxCharacterComponent extends GamePlayer with HasGameReference<ArmyGame> {
  SandboxCharacterComponent({
    required this.slotEquipment,
    required this.bodyColor,
    this.name = 'Bot',
    this.aimAngle = 45,
    this.classId = 1,
  }) : super(priority: 50);

  final Map<EquipmentSlot, EquipmentDefinition> slotEquipment;
  final ui.Color bodyColor;
  final int classId;
  int aimAngle;
  @override
  final String name;

  PlayerMovementState _movement = PlayerMovementState(isOnGround: true);
  ui.Image? _characterImage;
  bool _isLookingLeft = false;

  @override
  int hp = 1000;

  @override
  int maxHp = 1000;

  @override
  MovementIntent intent = MovementIntent.none;

  @override
  PlayerMovementState get movement => _movement;

  @override
  set movement(PlayerMovementState value) => _movement = value;

  @override
  void moveTo(double x, double y) => position.setValues(x, y);

  @override
  Future<void> onLoad() async {
    await super.onLoad();
    try {
      final paddedId = classId.toString().padLeft(2, '0');
      // Load image using Flame's standard cache
      _characterImage = await game.images.load('equip/$paddedId.png');
    } catch (e) {
      // Fallback handled in render
    }
  }

  @override
  void update(double dt) {
    super.update(dt);
    if (_movement.velocity.x < -0.1) {
      _isLookingLeft = true;
    } else if (_movement.velocity.x > 0.1) {
      _isLookingLeft = false;
    }
  }

  @override
  void render(ui.Canvas canvas) {
    canvas.save();

    if (_isLookingLeft) {
      canvas.scale(-1, 1);
    }

    if (_characterImage != null) {
      // Standard Mobi Army 2 character frame is 24x24
      canvas.drawImageRect(
        _characterImage!,
        const ui.Rect.fromLTWH(0, 0, 24, 24),
        const ui.Rect.fromLTWH(-12, -24, 24, 24),
        ui.Paint(),
      );
    } else {
      // Fallback body: feet at (0,0), head up.
      canvas.drawRect(
        const ui.Rect.fromLTWH(-8, -26, 16, 26),
        ui.Paint()..color = bodyColor,
      );
    }

    canvas.restore();

    // Aim indicator
    final angleInRadians = (_isLookingLeft ? (180 - aimAngle) : aimAngle) * math.pi / 180.0;
    canvas.drawLine(
      const ui.Offset(0, -12),
      ui.Offset(math.cos(angleInRadians) * 30, -12 - math.sin(angleInRadians) * 30),
      ui.Paint()..color = const ui.Color(0xFFFFEB3B)..strokeWidth = 2,
    );

    _renderHUD(canvas);
  }

  void _renderHUD(ui.Canvas canvas) {
    // HP Bar background
    final barWidth = 30.0;
    final barHeight = 3.0;
    final topOffset = -35.0;

    canvas.drawRect(
      ui.Rect.fromLTWH(-barWidth / 2, topOffset, barWidth, barHeight),
      ui.Paint()..color = const ui.Color(0xFF000000),
    );

    // HP Bar foreground
    final hpPercent = (hp / maxHp).clamp(0.0, 1.0);
    canvas.drawRect(
      ui.Rect.fromLTWH(-barWidth / 2, topOffset, barWidth * hpPercent, barHeight),
      ui.Paint()..color = const ui.Color(0xFF00FF00),
    );
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
import 'package:mobiarmy_flutter/features/gameplay/game/effects/smoke_particle.dart';
import 'package:mobiarmy_flutter/features/gameplay/game/projectile/projectile_trajectory.dart';

/// Plays back a server-computed (or offline-simulated) trajectory frame list.
class ProjectileComponent extends PositionComponent {
  ProjectileComponent({
    required this.trajectory,
    this.onImpact,
    this.stepsPerSecond = 60,
  }) : super(anchor: Anchor.center, priority: 20);

  final ProjectileTrajectory trajectory;
  final void Function(int x, int y, int radius)? onImpact;
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
          onImpact?.call(
            frames.last.x,
            frames.last.y,
            trajectory.explosionRadius,
          );
        }
        removeFromParent();
        return;
      }
      final frame = trajectory.frames[_frame];
      position.setValues(frame.x.toDouble(), frame.y.toDouble());

      // Spawn smoke trail
      parent?.add(SmokeParticle(position: position.clone()));
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
  const ProjectileTrajectory({
    required this.bulletId,
    required this.frames,
    this.explosionRadius = 18,
  });

  final int bulletId;
  final List<TrajectoryFrame> frames;
  final int explosionRadius;
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

    // MobiArmy2 Gun constants (approximate for Phase 17 parity)
    int ax100 = 0;
    int ay100 = 0;
    int g100 = 100;

    switch (bulletId) {
      case 0: // Gunner
        ax100 = (windX * 80) ~/ 100;
        ay100 = (windY * 80) ~/ 100;
        g100 = 100;
        break;
      case 1: // Miss 6
        ax100 = (windX * 90) ~/ 100;
        ay100 = (windY * 90) ~/ 100;
        g100 = 80;
        break;
      case 2: // Apache
        ax100 = (windX * 40) ~/ 100;
        ay100 = (windY * 40) ~/ 100;
        g100 = 120;
        break;
      case 5: // Tazan (Boomerang effect simulated by high wind sensitivity)
        ax100 = (windX * 250) ~/ 100;
        ay100 = (windY * 150) ~/ 100;
        g100 = 90;
        break;
      case 7: // Chicky (Egg)
        ax100 = (windX * 60) ~/ 100;
        ay100 = (windY * 60) ~/ 100;
        g100 = 70;
        break;
      default:
        ax100 = (windX * 80) ~/ 100;
        ay100 = (windY * 80) ~/ 100;
        g100 = 100;
    }

    if (bulletId == 1) { // Miss 6 example
      for (int i = -1; i <= 1; i++) {
        final spreadAng = ang + i * 5;
        final spreadVx = force * LegacyTrigonometry.cos(spreadAng) >> 10;
        final spreadVy = -(force * LegacyTrigonometry.sin(spreadAng) >> 10);

        final bullet = BulletSimulator(
          bulletId: bulletId,
          x: bx,
          y: by,
          vx: spreadVx,
          vy: spreadVy,
          ax100: ax100,
          ay100: ay100,
          g100: g100,
        );
        while (!bullet.collect && bullet.frame < 1000) {
          bullet.nextXY(mapWidth, mapHeight, isCollision);
        }
        trajectories.add(
          ProjectileTrajectory(
            bulletId: bulletId,
            frames: bullet.frames,
            explosionRadius: _getExplosionRadius(bulletId),
          ),
        );
      }
    } else {
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
        ProjectileTrajectory(
          bulletId: bulletId,
          frames: bullet.frames,
          explosionRadius: _getExplosionRadius(bulletId),
        ),
      );
    }

    return trajectories;
  }

  static int _getExplosionRadius(int bulletId) {
    switch (bulletId) {
      case 0: return 18; // Gunner
      case 1: return 15; // Miss 6 (smaller)
      case 2: return 22; // Apache (larger)
      case 5: return 20; // Tazan
      case 7: return 16; // Chicky
      default: return 18;
    }
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

  static SandboxScenario build({required int heroIndex}) {
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
      int classId,
    ) {
      final point = map.spawnPoints[spawnIndex % map.spawnPoints.length];
      final groundY =
          probe.findGroundBelow(point.x.toDouble(), point.y.toDouble()) ??
          point.y.toDouble();
      final character = SandboxCharacterComponent(
        slotEquipment: {for (final e in equipment) e.slot as dynamic: e},
        bodyColor: bodyColor,
        classId: classId,
      );
      character.moveTo(point.x.toDouble(), groundY);
      return character;
    }

    final heroes = [
      {'color': const Color(0xFFF97316), 'equips': SandboxEquipmentData.gunnerSet(), 'classId': 1},
      {'color': const Color(0xFF22D3EE), 'equips': SandboxEquipmentData.miss6Set(), 'classId': 2},
    ];

    final hero = heroes[heroIndex % heroes.length];

    final characters = [
      spawn(4, hero['equips'] as List<dynamic>, hero['color'] as Color, hero['classId'] as int),
    ];

    return SandboxScenario._(
      map: map,
      terrain: terrain,
      characters: characters,
    );
  }

  static SandboxScenario buildDefault() {
    return build(heroIndex: 0);
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
  double _freePanTimeout = 0;
  final Vector2 _anchorCorrection = Vector2.zero();

  void shake({double intensity = 5.0, double duration = 0.5}) {
    add(ScreenShakeEffect(intensity: intensity, duration: duration));
  }

  void pan(Vector2 delta) {
    mode = CameraMode.freePan;
    _freePanTimeout = 3.0; // Return to player after 3s of inactivity
    game.camera.viewfinder.position -= delta;
    _followApplied = null;
    game.camera.stop();
  }

  @override
  void update(double dt) {
    super.update(dt);

    if (mode == CameraMode.freePan) {
      _freePanTimeout -= dt;
      if (_freePanTimeout <= 0) {
        mode = CameraMode.playerFollow;
      }
    }

    _updateTarget();
    _applyClamping();

    // Hard-stabilize camera coordinates immediately after any update loop to eradicate drift completely
    _anchorCorrection.setFrom(game.camera.viewfinder.position);
  }

  void _applyFollow(PositionComponent target, double maxSpeed) {
    if (_followApplied == target) return;
    _followApplied = target;
    game.camera.follow(target, maxSpeed: maxSpeed);
  }

  void _updateTarget() {
    if (mode == CameraMode.freePan) return;

    final projectiles = game.gameWorld.children.query<ProjectileComponent>();
    final PositionComponent? target;
    final double maxSpeed;
    if (projectiles.isNotEmpty) {
      mode = CameraMode.bulletFollow;
      target = projectiles.first;
      maxSpeed = 1000;
    } else {
      mode = CameraMode.playerFollow;
      target = game.players[game.activePlayerId ?? 0];
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

  Vector2 get anchorCorrection => _anchorCorrection;
}
```

### `D:\personal\army/lib\features\gameplay\game\systems\combat_system.dart`
```dart
import 'package:flame/components.dart';
import 'package:mobiarmy_flutter/features/gameplay/domain/player/player_movement_state.dart';
import 'package:mobiarmy_flutter/features/gameplay/game/army_game.dart';
import 'package:mobiarmy_flutter/features/gameplay/game/effects/damage_text_component.dart';

class CombatSystem extends Component with HasGameReference<ArmyGame> {
  void applyDamage(int playerId, int damage, int newHp, bool isDead) {
    final player = game.players[playerId];
    if (player == null) return;

    game.gameWorld.add(DamageTextComponent(
      position: player.position - Vector2(0, 30),
      damage: damage,
    ));

    player.hp = newHp;
    if (isDead) {
      player.movement = player.movement.copyWith(kind: PlayerMovementKind.dead);
    } else {
      player.movement = player.movement.copyWith(kind: PlayerMovementKind.hurt);
    }
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
  static const int groundSnapDistance = 5;

  @override
  void update(double dt) {
    super.update(dt);
    final terrain = game.terrain;
    if (terrain == null) return;

    final probe = GroundProbe(terrain);

    for (final player in game.players.values) {
      var movement = player.movement;
      if (movement.kind == PlayerMovementKind.dead ||
          movement.kind == PlayerMovementKind.teleport) {
        continue;
      }

      // 1. Apply Gravity if not on ground
      if (!movement.isOnGround) {
        final velocity = movement.velocity;
        velocity.y += gravity * dt;
        if (velocity.y > terminalVelocity) {
          velocity.y = terminalVelocity;
        }
        player.movement = movement.copyWith(velocity: velocity);
        movement = player.movement;

        final nextY = player.y + movement.velocity.y * dt;

        // Check for landing
        if (probe.isSolid(player.x, nextY)) {
          final groundY = probe.findGroundBelow(player.x, player.y);
          if (groundY != null) {
            player.y = groundY;
            player.movement = movement.copyWith(
              velocity: Vector2(movement.velocity.x, 0),
              isOnGround: true,
              kind: movement.velocity.x.abs() > 0.1
                  ? PlayerMovementKind.walking
                  : PlayerMovementKind.idle,
            );
          }
        } else {
          player.y = nextY;
        }
      } else {
        // 2. On ground: snap to ground (handle stepping down slopes)
        final groundY = probe.findGroundBelow(player.x, player.y - 2, maxDistance: groundSnapDistance.toDouble() + 2);

        if (groundY != null) {
          player.y = groundY;
          // Ensure state is correct
          if (movement.kind == PlayerMovementKind.falling) {
             player.movement = movement.copyWith(
               isOnGround: true,
               kind: PlayerMovementKind.idle,
               velocity: Vector2(movement.velocity.x, 0),
             );
          }
        } else {
          // No ground found nearby, start falling
          player.movement = movement.copyWith(
            isOnGround: false,
            kind: PlayerMovementKind.falling,
            velocity: Vector2(movement.velocity.x, 0),
          );
        }
      }

      // 3. Map Boundaries & Death zones
      if (player.x < 0) player.x = 0;
      if (player.x > terrain.width) player.x = terrain.width.toDouble();

      final waterY = game.map?.environment.waterY;
      if (waterY != null && waterY > 0 && player.y > waterY) {
        if (movement.kind != PlayerMovementKind.dead) {
          player.movement = movement.copyWith(
            kind: PlayerMovementKind.dead,
            velocity: Vector2.zero(),
          );
        }
      }

      // Fall out of map (death)
      if (player.y > terrain.height + 64) {
        if (movement.kind != PlayerMovementKind.dead) {
          player.movement = movement.copyWith(
            kind: PlayerMovementKind.dead,
            velocity: Vector2.zero(),
          );
        }
      }
    }
  }
}
```

### `D:\personal\army/lib\features\gameplay\game\systems\player_movement_system.dart`
```dart
import 'package:flame/components.dart';
import 'package:mobiarmy_flutter/features/gameplay/domain/player/movement_intent.dart';
import 'package:mobiarmy_flutter/features/gameplay/domain/player/player_movement_state.dart';
import 'package:mobiarmy_flutter/features/gameplay/game/army_game.dart';
import 'package:mobiarmy_flutter/features/gameplay/game/player/game_player.dart';
import 'package:mobiarmy_flutter/features/gameplay/game/player/sandbox_character_component.dart';

class PlayerMovementSystem extends Component with HasGameReference<ArmyGame> {
  static const double walkSpeed = 60.0;
  static const double staminaConsumption = 25.0; // matches legacy feel
  static const int maxSlopeClimb = 4;

  @override
  void update(double dt) {
    super.update(dt);
    final terrain = game.terrain;
    if (terrain == null) return;

    final input = game.inputController.state;

    // 1. Bridge Input to Intent (for local sandbox or active turn player)
    final localPlayer = game.players[0] ?? game.players[game.activePlayerId];
    if (localPlayer != null) {
      MovementDirection dir = MovementDirection.none;
      if (input.movingLeft) {
        dir = MovementDirection.left;
      } else if (input.movingRight) dir = MovementDirection.right;

      localPlayer.intent = MovementIntent(direction: dir);
    }

    final activePlayer = game.players[game.activePlayerId ?? 0];
    if (activePlayer is SandboxCharacterComponent) {
      activePlayer.aimAngle = input.angle;
    }

    // 2. Process Movement based on Intents
    for (final player in game.players.values) {
      _processPlayerMovement(player, dt);
    }
  }

  void _processPlayerMovement(GamePlayer player, double dt) {
    final terrain = game.terrain;
    if (terrain == null) return;

    var movement = player.movement;
    if (movement.kind == PlayerMovementKind.dead ||
        movement.kind == PlayerMovementKind.frozen) {
      return;
    }

    final intent = player.intent;
    double dx = 0;
    if (intent.direction == MovementDirection.left) dx = -1;
    if (intent.direction == MovementDirection.right) dx = 1;

    if (dx != 0 && movement.isOnGround && movement.stamina > 0) {
      final deltaX = dx * walkSpeed * dt;
      final nextX = player.x + deltaX;

      // Slope climbing: check if we need to step up
      double nextY = player.y;
      bool blocked = false;

      if (terrain.isSolid(nextX.toInt(), nextY.toInt())) {
        blocked = true;
        // Try to climb up
        for (int i = 1; i <= maxSlopeClimb; i++) {
          if (!terrain.isSolid(nextX.toInt(), (nextY - i).toInt())) {
            nextY -= i;
            blocked = false;
            break;
          }
        }
      }

      if (!blocked) {
        final newStamina = (movement.stamina - staminaConsumption * dt).clamp(0.0, 100.0);

        player.x = nextX;
        player.y = nextY;

        player.movement = movement.copyWith(
          velocity: Vector2(deltaX / dt, 0),
          stamina: newStamina,
          kind: PlayerMovementKind.walking,
        );
      } else {
        // Blocked by wall
        player.movement = movement.copyWith(
          velocity: Vector2.zero(),
          kind: PlayerMovementKind.idle,
        );
      }
    } else {
      // No horizontal intent or no stamina
      final velocity = movement.velocity;
      velocity.x = 0;
      player.movement = movement.copyWith(
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
import 'package:mobiarmy_flutter/core/audio/audio_provider.dart';
import 'package:mobiarmy_flutter/features/gameplay/application/gameplay_provider.dart';
import 'package:mobiarmy_flutter/shared/overlays/gameplay_hud.dart';
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
    final audio = ref.read(audioServiceProvider);
    _game = ArmyGame(audio: audio);

    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(gameplayHandlerProvider).attachGame(_game);
    });
  }

  @override
  void dispose() {
    ref.read(gameplayHandlerProvider).detachGame();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          GameWidget<ArmyGame>(
            game: _game,
            overlayBuilderMap: {
              'HUD': (context, game) => GameplayHud(game: game),
            },
            initialActiveOverlays: const ['HUD'],
          ),
        ],
      ),
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
import 'package:mobiarmy_flutter/core/audio/audio_provider.dart';
import 'package:mobiarmy_flutter/core/network/connection_lifecycle.dart';
import 'package:mobiarmy_flutter/features/gameplay/game/army_game.dart';
import 'package:mobiarmy_flutter/features/gameplay/game/sandbox/sandbox_scenario.dart';
import 'package:mobiarmy_flutter/shared/overlays/gameplay_hud.dart';
import 'package:mobiarmy_flutter/shared/widgets/game_viewport.dart';

class GameplaySandboxScreen extends ConsumerStatefulWidget {
  const GameplaySandboxScreen({super.key, this.heroIndex = 0});

  final int heroIndex;

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
    // Sandbox uses internal audio but no network connection lifecycle
    final audio = ref.read(audioServiceProvider);

    final scenario = SandboxScenario.build(heroIndex: widget.heroIndex);
    _game = ArmyGame(scenario: scenario, audio: audio);
    _game.activePlayerId = 0; // Local user player ID

    _lifecycle = AppLifecycleCoordinator(
      game: _game,
      connection: const NoopConnectionLifecycle(),
      audio: audio,
    )..start();
  }

  @override
  void dispose() {
    _lifecycle.dispose();
    _game.pauseSafely();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GameViewport(
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
              top: 50,
              left: 12,
              child: DecoratedBox(
                decoration: BoxDecoration(
                  color: Color(0xAA000000),
                  borderRadius: BorderRadius.all(Radius.circular(12)),
                ),
                child: Padding(
                  padding: EdgeInsets.all(10),
                  child: Text(
                    'Gameplay sandbox — offline vertical slice',
                    style: TextStyle(color: Colors.white, fontSize: 10),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
```

### `D:\personal\army/lib\features\gameplay\presentation\offline_demo_screen.dart`
```dart
import 'dart:typed_data';

import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:mobiarmy_flutter/core/network/data_cache_parsers.dart';
import 'package:mobiarmy_flutter/features/gameplay/game/army_game.dart';
import 'package:mobiarmy_flutter/features/gameplay/game/map/game_map_definition.dart';
import 'package:mobiarmy_flutter/features/gameplay/game/map/map_binary_parser.dart';
import 'package:mobiarmy_flutter/features/gameplay/game/map/terrain_component.dart';
import 'package:mobiarmy_flutter/features/gameplay/game/player/online_character.dart';
import 'package:mobiarmy_flutter/features/gameplay/game/player/player_sprites.dart';
import 'package:mobiarmy_flutter/features/gameplay/game/systems/ground_probe.dart';
import 'package:mobiarmy_flutter/shared/widgets/game_viewport.dart';

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
      final bd = await rootBundle.load('assets/rms/$name');
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
      _status = 'OK — map ${bin.width}x${bin.height}, ${bricks.length} bricks, ${DataCache.equips.length} equips';
    });
  }

  @override
  Widget build(BuildContext context) {
    final game = _game;
    return Scaffold(
      body: GameViewport(
        child: PopScope(
          canPop: true,
          child: Stack(children: [
            if (game != null)
              Positioned.fill(child: GameWidget(game: game))
            else
              Center(child: Text(_status)),
            Positioned(
              top: 12,
              left: 12,
              child: Container(
                color: Colors.black54,
                padding: const EdgeInsets.all(8),
                child: Text(_status, style: const TextStyle(color: Colors.white)),
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
```

### `D:\personal\army/lib\features\gameplay\presentation\online_game_screen.dart`
```dart
import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mobiarmy_flutter/app/lifecycle/app_lifecycle_coordinator.dart';
import 'package:mobiarmy_flutter/core/audio/audio_provider.dart';
import 'package:mobiarmy_flutter/core/network/connection_lifecycle.dart';
import 'package:mobiarmy_flutter/features/gameplay/application/gameplay_controller.dart';
import 'package:mobiarmy_flutter/features/gameplay/game/army_game.dart';
import 'package:mobiarmy_flutter/shared/widgets/game_viewport.dart';
import 'package:mobiarmy_flutter/shared/overlays/gameplay_hud.dart';

class OnlineGameScreen extends ConsumerStatefulWidget {
  const OnlineGameScreen({super.key});
  @override
  ConsumerState<OnlineGameScreen> createState() => _OnlineGameScreenState();
}

class _OnlineGameScreenState extends ConsumerState<OnlineGameScreen> {
  ArmyGame? _game;
  AppLifecycleCoordinator? _lifecycle;
  String? _error;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) => _start());
  }

  Future<void> _start() async {
    final match = ref.read(gameplayControllerProvider);
    final audio = ref.read(audioServiceProvider);

    if (match == null) {
      setState(() => _error = 'Không thể khởi tạo trận đấu (thiếu dữ liệu MatchState)');
      return;
    }

    final game = ArmyGame(audio: audio);
    await game.onLoad();
    await game.setupMatch(match);

    _lifecycle = AppLifecycleCoordinator(
      game: game,
      connection: const NoopConnectionLifecycle(),
      audio: audio,
    )..start();

    setState(() => _game = game);
  }

  @override
  void dispose() {
    _lifecycle?.dispose();
    _game?.pauseSafely();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final match = ref.watch(gameplayControllerProvider);
    final game = _game;

    if (match == null) {
      return const Scaffold(body: Center(child: Text('Đang thoát trận...')));
    }

    // Handle one-off events from MatchState
    ref.listen(gameplayControllerProvider.select((s) => s?.lastShoot), (prev, next) {
      if (next != null && game != null) {
        for (final trajectory in next.trajectories) {
          game.spawnProjectile(trajectory);
        }
      }
    });

    ref.listen(gameplayControllerProvider.select((s) => s?.players), (prev, next) {
      if (next != null && game != null) {
        game.syncPlayers(next);
      }
    });

    return Scaffold(
      body: GameViewport(
        child: PopScope(
          canPop: false,
          onPopInvokedWithResult: (didPop, result) async {
            if (didPop) return;
            final shouldExit = await showDialog<bool>(
              context: context,
              builder: (context) => AlertDialog(
                title: const Text('Thoát trận?'),
                content: const Text('Bạn có chắc muốn rời khỏi trận đấu đang diễn ra?'),
                actions: [
                  TextButton(
                    onPressed: () => Navigator.of(context).pop(false),
                    child: const Text('Ở lại'),
                  ),
                  TextButton(
                    onPressed: () => Navigator.of(context).pop(true),
                    child: const Text('Thoát', style: TextStyle(color: Colors.red)),
                  ),
                ],
              ),
            );

            if (shouldExit == true && mounted) {
              // ignore: use_build_context_synchronously
              Navigator.of(context).pop();
            }
          },
          child: Stack(
            children: [
              if (game != null)
                Positioned.fill(
                  child: GameWidget<ArmyGame>(
                    game: game,
                    overlayBuilderMap: {
                      'HUD': (context, g) => GameplayHud(game: g),
                    },
                    initialActiveOverlays: const ['HUD'],
                  ),
                )
              else if (_error != null)
                Center(child: Text(_error!))
              else
                const Center(child: CircularProgressIndicator()),
              if (game != null) _buildStatusHeader(match),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildStatusHeader(dynamic match) {
    final isMyTurn = ref.watch(gameplayControllerProvider.notifier).isMyTurn;

    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              decoration: BoxDecoration(
                color: Colors.black54,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text('Gió: ${match.windX}',
                      style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                  const SizedBox(width: 16),
                  Text(
                    isMyTurn ? 'LƯỢT CỦA BẠN' : 'Đang chờ...',
                    style: TextStyle(
                      color: isMyTurn ? Colors.greenAccent : Colors.white70,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
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
          normalAsset: 'assets/gui/nut_up.png',
          pressedAsset: 'assets/gui/nut_up_.png',
          fallbackIcon: Icons.keyboard_arrow_up,
          onPressedStart: () => game.inputController.setAngleDelta(1),
          onPressedEnd: () => game.inputController.setAngleDelta(0),
        ),
        const SizedBox(height: 12),
        _AimButton(
          normalAsset: 'assets/gui/nut_down.png',
          pressedAsset: 'assets/gui/nut_down_.png',
          fallbackIcon: Icons.keyboard_arrow_down,
          onPressedStart: () => game.inputController.setAngleDelta(-1),
          onPressedEnd: () => game.inputController.setAngleDelta(0),
        ),
      ],
    );
  }
}

class _AimButton extends StatefulWidget {
  const _AimButton({
    required this.normalAsset,
    required this.pressedAsset,
    required this.fallbackIcon,
    required this.onPressedStart,
    required this.onPressedEnd,
  });

  final String normalAsset;
  final String pressedAsset;
  final IconData fallbackIcon;
  final VoidCallback onPressedStart;
  final VoidCallback onPressedEnd;

  @override
  State<_AimButton> createState() => _AimButtonState();
}

class _AimButtonState extends State<_AimButton> {
  bool _isPressed = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (_) {
        setState(() => _isPressed = true);
        widget.onPressedStart();
      },
      onTapUp: (_) {
        setState(() => _isPressed = false);
        widget.onPressedEnd();
      },
      onTapCancel: () {
        setState(() => _isPressed = false);
        widget.onPressedEnd();
      },
      child: Image.asset(
        _isPressed ? widget.pressedAsset : widget.normalAsset,
        width: 40,
        height: 40,
        fit: BoxFit.contain,
        errorBuilder: (context, error, stackTrace) {
          return Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: _isPressed ? Colors.white24 : Colors.black45,
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: Colors.white24),
            ),
            child: Icon(widget.fallbackIcon, color: Colors.white),
          );
        },
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
          normalAsset: 'assets/gui/nut1.png',
          pressedAsset: 'assets/gui/nut1_.png',
          onPressedStart: () => game.inputController.setMovingLeft(true),
          onPressedEnd: () => game.inputController.setMovingLeft(false),
        ),
        const SizedBox(width: 16),
        _MoveButton(
          normalAsset: 'assets/gui/nut2.png',
          pressedAsset: 'assets/gui/nut2_.png',
          onPressedStart: () => game.inputController.setMovingRight(true),
          onPressedEnd: () => game.inputController.setMovingRight(false),
        ),
      ],
    );
  }
}

class _MoveButton extends StatefulWidget {
  const _MoveButton({
    required this.normalAsset,
    required this.pressedAsset,
    required this.onPressedStart,
    required this.onPressedEnd,
  });

  final String normalAsset;
  final String pressedAsset;
  final VoidCallback onPressedStart;
  final VoidCallback onPressedEnd;

  @override
  State<_MoveButton> createState() => _MoveButtonState();
}

class _MoveButtonState extends State<_MoveButton> {
  bool _isPressed = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (_) {
        setState(() => _isPressed = true);
        widget.onPressedStart();
      },
      onTapUp: (_) {
        setState(() => _isPressed = false);
        widget.onPressedEnd();
      },
      onTapCancel: () {
        setState(() => _isPressed = false);
        widget.onPressedEnd();
      },
      child: Image.asset(
        _isPressed ? widget.pressedAsset : widget.normalAsset,
        width: 46,
        height: 46,
        fit: BoxFit.contain,
        errorBuilder: (context, error, stackTrace) {
          // Fallback to generic shape if asset fails
          return Container(
            width: 46,
            height: 46,
            decoration: BoxDecoration(
              color: _isPressed ? Colors.white24 : Colors.black45,
              shape: BoxShape.circle,
              border: Border.all(color: Colors.white24),
            ),
            child: Icon(
              widget.normalAsset.contains('nut1') ? Icons.arrow_back : Icons.arrow_forward,
              color: Colors.white,
            ),
          );
        },
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

### `D:\personal\army/lib\features\gameplay\presentation\widgets\wind_indicator.dart`
```dart
import 'package:flutter/material.dart';

class WindIndicator extends StatelessWidget {
  const WindIndicator({
    super.key,
    required this.windX,
    required this.windY,
  });

  final int windX;
  final int windY;

  @override
  Widget build(BuildContext context) {
    final isLeft = windX < 0;
    final absWind = windX.abs();

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
      decoration: BoxDecoration(
        color: Colors.black87,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.orange.withValues(alpha: 0.5), width: 1.5),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (windX != 0)
            Transform.flip(
              flipX: !isLeft, // wind.png usually points left or right, adjust based on convention
              child: Image.asset(
                'assets/wind.png',
                width: 22,
                height: 14,
                fit: BoxFit.contain,
                errorBuilder: (_, _, _) => Icon(
                  isLeft ? Icons.arrow_back : Icons.arrow_forward,
                  color: Colors.lightBlueAccent,
                  size: 16,
                ),
              ),
            ),
          const SizedBox(width: 8),
          Text(
            'WIND: $absWind',
            style: const TextStyle(
              color: Colors.yellow,
              fontWeight: FontWeight.bold,
              fontFamily: 'monospace',
              fontSize: 16,
              shadows: [
                Shadow(blurRadius: 2, color: Colors.black, offset: Offset(1, 1))
              ],
            ),
          ),
        ],
      ),
    );
  }
}
```

### `D:\personal\army/lib\features\inventory\application\inventory_controller.dart`
```dart
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logging/logging.dart';
import 'package:mobiarmy_flutter/core/network/command/commands.dart';
import 'package:mobiarmy_flutter/core/network/dispatcher/message_dispatcher.dart';
import 'package:mobiarmy_flutter/core/network/network_provider.dart';
import 'package:mobiarmy_flutter/core/network/protocol/message.dart';
import 'package:mobiarmy_flutter/features/inventory/data/inventory_packet_mapper.dart';
import 'package:mobiarmy_flutter/features/inventory/data/inventory_repository.dart';
import 'package:mobiarmy_flutter/features/inventory/domain/equipment_stats.dart';
import 'package:mobiarmy_flutter/features/inventory/domain/inventory_item.dart';

class InventoryState {
  const InventoryState({
    this.items = const [],
    this.materials = const [],
    this.characterStats = CharacterStats.defaultStats,
    this.isLoading = false,
    this.error,
  });

  final List<InventoryItem> items;
  final List<InventoryItem> materials;
  final CharacterStats characterStats;
  final bool isLoading;
  final String? error;

  InventoryState copyWith({
    List<InventoryItem>? items,
    List<InventoryItem>? materials,
    CharacterStats? characterStats,
    bool? isLoading,
    String? error,
  }) {
    return InventoryState(
      items: items ?? this.items,
      materials: materials ?? this.materials,
      characterStats: characterStats ?? this.characterStats,
      isLoading: isLoading ?? this.isLoading,
      error: error ?? this.error,
    );
  }
}

class InventoryController extends Notifier<InventoryState> {
  final _logger = Logger('InventoryController');
  late final InventoryRepository _repository;
  late final InventoryPacketMapper _mapper;

  @override
  InventoryState build() {
    _repository = InventoryRepository(ref.watch(tcpSessionProvider));
    _mapper = const InventoryPacketMapper();

    final dispatcher = ref.watch(messageDispatcherProvider);
    _registerHandlers(dispatcher);

    ref.onDispose(() {
      _unregisterHandlers(dispatcher);
    });

    return const InventoryState();
  }

  void _registerHandlers(MessageDispatcher dispatcher) {
    dispatcher
      ..register(Commands.inventory, _onInventory)
      ..register(Commands.materialUpdate, _onMaterials)
      ..register(99, _onCharacterInfo)
      ..register(Commands.inventoryUpdate, _onInventoryUpdate)
      ..register(Commands.log, _onLog);
  }

  void _unregisterHandlers(MessageDispatcher dispatcher) {
    dispatcher
      ..unregister(Commands.inventory, _onInventory)
      ..unregister(Commands.materialUpdate, _onMaterials)
      ..unregister(99, _onCharacterInfo)
      ..unregister(Commands.inventoryUpdate, _onInventoryUpdate)
      ..unregister(Commands.log, _onLog);
  }

  Future<void> loadInventory() async {
    state = state.copyWith(isLoading: true, error: null);
    try {
      await _repository.requestInventory();
      await _repository.requestCharacterStats();
    } catch (e) {
      state = state.copyWith(isLoading: false, error: e.toString());
    }
  }

  Future<void> changeEquip(List<int> dbKeys) async {
    state = state.copyWith(isLoading: true);
    try {
      await _repository.changeEquip(dbKeys);
    } catch (e) {
      state = state.copyWith(isLoading: false, error: e.toString());
    }
  }

  // --------------------------------------------------------------- handlers

  void _onInventory(Message message) {
    try {
      final items = _mapper.decodeInventory(message);
      state = state.copyWith(items: items, isLoading: false);
    } catch (e, stack) {
      _logger.severe('Failed to decode inventory', e, stack);
    }
  }

  void _onMaterials(Message message) {
    try {
      final materials = _mapper.decodeMaterials(message);
      state = state.copyWith(materials: materials, isLoading: false);
    } catch (e, stack) {
      _logger.severe('Failed to decode materials', e, stack);
    }
  }

  void _onCharacterInfo(Message message) {
    try {
      final r = message.reader();
      r.readUnsignedByte(); // level2
      r.readByte(); // level2Percen
      r.readShort(); // point
      final abilities = [for (var i = 0; i < 5; i++) r.readShort()];
      state = state.copyWith(
        characterStats: CharacterStats(ability: abilities),
        isLoading: false,
      );
    } catch (e, stack) {
      _logger.severe('Failed to decode character stats', e, stack);
    }
  }

  void _onInventoryUpdate(Message message) {
    // Refresh inventory on update
    loadInventory();
  }

  void _onLog(Message message) {
    // Only capture error if we are expecting a result (e.g. after a request)
    if (state.isLoading) {
      final text = message.reader().readUTF();
      state = state.copyWith(error: text, isLoading: false);
    }
  }
}

final inventoryControllerProvider = NotifierProvider<InventoryController, InventoryState>(InventoryController.new);
```

### `D:\personal\army/lib\features\inventory\domain\inventory_item.dart`
```dart
import 'equipment_stats.dart';

class InventoryItem {
  final int dbKey;
  final int id;
  final int icon;
  final int type;
  final int glass;
  final String name;
  final int date;
  final int slot;
  final int vip;
  final int level;
  final int level2;
  final bool isMaterial;
  final String strDetail;
  final int quantity;
  final int bullet;
  final EquipmentStats stats;

  const InventoryItem({
    required this.dbKey,
    required this.id,
    required this.icon,
    required this.type,
    required this.glass,
    required this.name,
    required this.date,
    required this.slot,
    required this.vip,
    required this.level,
    required this.level2,
    required this.isMaterial,
    required this.strDetail,
    required this.quantity,
    required this.bullet,
    required this.stats,
  });

  static const empty = InventoryItem(
    dbKey: -1,
    id: -1,
    icon: -1,
    type: -1,
    glass: -1,
    name: '',
    date: 0,
    slot: 0,
    vip: 0,
    level: 0,
    level2: 0,
    isMaterial: false,
    strDetail: '',
    quantity: 0,
    bullet: -1,
    stats: EquipmentStats.empty,
  );

  /// Compatibility factory for consumable items.
  factory InventoryItem.consumable({
    required int id,
    required String name,
    int quantity = 0,
  }) {
    return InventoryItem(
      dbKey: -1,
      id: id,
      icon: -1,
      type: 0,
      glass: 0,
      name: name,
      date: 0,
      slot: 0,
      vip: 0,
      level: 0,
      level2: 0,
      isMaterial: false,
      strDetail: '',
      quantity: quantity,
      bullet: -1,
      stats: EquipmentStats.empty,
    );
  }
}
```

### `D:\personal\army/lib\features\inventory\presentation\inventory_screen.dart`
```dart
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mobiarmy_flutter/features/inventory/application/inventory_controller.dart';
import 'package:mobiarmy_flutter/features/inventory/domain/inventory_item.dart';

class InventoryScreen extends ConsumerStatefulWidget {
  const InventoryScreen({super.key});

  @override
  ConsumerState<InventoryScreen> createState() => _InventoryScreenState();
}

class _InventoryScreenState extends ConsumerState<InventoryScreen> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    Future.microtask(() => ref.read(inventoryControllerProvider.notifier).loadInventory());
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final inventory = ref.watch(inventoryControllerProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Hành trang'),
        bottom: TabBar(
          controller: _tabController,
          tabs: const [
            Tab(text: 'Trang bị'),
            Tab(text: 'Nguyên liệu'),
          ],
        ),
      ),
      body: inventory.isLoading
          ? const Center(child: CircularProgressIndicator())
          : Column(
              children: [
                _PlayerAttributesBar(stats: inventory.characterStats),
                Expanded(
                  child: TabBarView(
                    controller: _tabController,
                    children: [
                      _InventoryGrid(items: inventory.items),
                      _InventoryGrid(items: inventory.materials),
                    ],
                  ),
                ),
              ],
            ),
    );
  }
}

class _PlayerAttributesBar extends StatelessWidget {
  const _PlayerAttributesBar({required this.stats});
  final dynamic stats;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      color: Colors.black12,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _AttributeItem(label: 'HP', value: stats.ability[0]),
          _AttributeItem(label: 'ATK', value: stats.ability[1]),
          _AttributeItem(label: 'DEF', value: stats.ability[2]),
          _AttributeItem(label: 'LUK', value: stats.ability[3]),
          _AttributeItem(label: 'TEAM', value: stats.ability[4]),
        ],
      ),
    );
  }
}

class _AttributeItem extends StatelessWidget {
  const _AttributeItem({required this.label, required this.value});
  final String label;
  final int value;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(label, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 10)),
        Text('$value', style: const TextStyle(fontSize: 12)),
      ],
    );
  }
}

class _InventoryGrid extends StatelessWidget {
  const _InventoryGrid({required this.items});
  final List<InventoryItem> items;

  @override
  Widget build(BuildContext context) {
    if (items.isEmpty) {
      return const Center(child: Text('Trống'));
    }
    return GridView.builder(
      padding: const EdgeInsets.all(16),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 5,
        mainAxisSpacing: 8,
        crossAxisSpacing: 8,
      ),
      itemCount: items.length,
      itemBuilder: (context, index) {
        final item = items[index];
        return _InventoryItemTile(item: item);
      },
    );
  }
}

class _InventoryItemTile extends StatelessWidget {
  const _InventoryItemTile({required this.item});
  final InventoryItem item;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: item.dbKey != -1 ? Colors.blue.shade50 : null,
      child: InkWell(
        onTap: () {
          // TODO: show item detail
        },
        child: Stack(
          children: [
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(item.isMaterial ? Icons.category : Icons.shield, size: 24),
                  const SizedBox(height: 2),
                  Text(
                    item.name,
                    style: const TextStyle(fontSize: 8),
                    textAlign: TextAlign.center,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
            if (item.quantity > 1)
              Positioned(
                right: 2,
                bottom: 2,
                child: Text(
                  'x${item.quantity}',
                  style: const TextStyle(fontSize: 10, fontWeight: FontWeight.bold),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
```

### `D:\personal\army/lib\features\lobby\application\lobby_controller.dart`
```dart
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logging/logging.dart';
import 'package:mobiarmy_flutter/core/network/command/commands.dart';
import 'package:mobiarmy_flutter/core/network/dispatcher/message_dispatcher.dart';
import 'package:mobiarmy_flutter/core/network/network_provider.dart';
import 'package:mobiarmy_flutter/core/network/protocol/message.dart';
import 'package:mobiarmy_flutter/features/lobby/application/lobby_state_machine.dart';
import 'package:mobiarmy_flutter/features/lobby/data/lobby_packet_mapper.dart';
import 'package:mobiarmy_flutter/features/lobby/data/lobby_repository.dart';
import 'package:mobiarmy_flutter/features/lobby/domain/lobby_state.dart';
import 'package:mobiarmy_flutter/features/room/data/room_packet_mapper.dart';

class LobbyController extends Notifier<LobbyState> {
  final _logger = Logger('LobbyController');

  late final LobbyStateMachine _machine;
  late final LobbyRepository _repository;
  late final LobbyPacketMapper _mapper;
  late final RoomPacketMapper _roomMapper;

  @override
  LobbyState build() {
    _machine = LobbyStateMachine();
    _mapper = const LobbyPacketMapper();
    _roomMapper = const RoomPacketMapper();
    _repository = LobbyRepository(ref.watch(tcpSessionProvider));

    final dispatcher = ref.watch(messageDispatcherProvider);
    _registerHandlers(dispatcher);

    ref.onDispose(() {
      _unregisterHandlers(dispatcher);
    });

    // Initial load
    Future.microtask(() => loadAreas());

    return _machine.state;
  }

  void _registerHandlers(MessageDispatcher dispatcher) {
    dispatcher
      ..register(Commands.roomList, _onRoomList)
      ..register(Commands.roomWaitList, _onRoomWaitList)
      ..register(Commands.joinRoomWait, _onLoadRoomWait) // cmd 8
      ..register(Commands.log, _onLog);
  }

  void _unregisterHandlers(MessageDispatcher dispatcher) {
    dispatcher
      ..unregister(Commands.roomList, _onRoomList)
      ..unregister(Commands.roomWaitList, _onRoomWaitList)
      ..unregister(Commands.joinRoomWait, _onLoadRoomWait)
      ..unregister(Commands.log, _onLog);
  }

  // ---------------------------------------------------------------- commands

  Future<void> loadAreas() async {
    state = _machine.areasRequested();
    try {
      await _repository.requestAreas();
    } catch (e) {
      state = _machine.joinFailed('Không thể tải danh sách khu vực: $e');
    }
  }

  Future<void> loadBoards(int areaId) async {
    state = _machine.boardsRequested(areaId);
    try {
      await _repository.requestBoards(areaId);
    } catch (e) {
      state = _machine.joinFailed('Không thể tải danh sách bàn: $e');
    }
  }

  Future<void> joinBoard(int areaId, int boardId, [String password = '']) async {
    state = _machine.joinRequested();
    try {
      await _repository.joinBoard(areaId, boardId, password);
    } catch (e) {
      state = _machine.joinFailed('Không thể gửi yêu cầu vào bàn: $e');
    }
  }

  Future<void> quickJoin(int mode) async {
    state = _machine.joinRequested();
    try {
      await _repository.quickJoin(mode);
    } catch (e) {
      state = _machine.joinFailed('Không thể gửi yêu cầu chơi ngay: $e');
    }
  }

  // --------------------------------------------------------------- packets

  void _onRoomList(Message message) {
    try {
      final areas = _mapper.decodeAreas(message);
      state = _machine.areasLoaded(areas);
    } catch (e, stack) {
      _logger.severe('roomList parse failed', e, stack);
    }
  }

  void _onRoomWaitList(Message message) {
    try {
      final (areaId, boards) = _mapper.decodeBoards(message);
      state = _machine.boardsLoaded(areaId, boards);
    } catch (e, stack) {
      _logger.severe('roomWaitList parse failed', e, stack);
    }
  }

  void _onLoadRoomWait(Message message) {
    try {
      _logger.info('Received loadRoomWait (cmd 8) - success joining room');
      final roomState = _roomMapper.decodeLoadRoomWait(message);
      state = _machine.joinSucceeded(roomState);
    } catch (e, stack) {
      _logger.severe('loadRoomWait parse failed in LobbyController', e, stack);
    }
  }

  void _onLog(Message message) {
    // If we are joining, a log message usually means failure.
    if (state.status == LobbyStatus.joining) {
      final text = message.reader().readUTF();
      state = _machine.joinFailed(text);
    }
  }
}

final lobbyControllerProvider =
    NotifierProvider<LobbyController, LobbyState>(LobbyController.new);
```

### `D:\personal\army/lib\features\lobby\application\lobby_state_machine.dart`
```dart
import 'package:mobiarmy_flutter/features/lobby/domain/area_summary.dart';
import 'package:mobiarmy_flutter/features/lobby/domain/board_summary.dart';
import 'package:mobiarmy_flutter/features/lobby/domain/lobby_state.dart';
import 'package:mobiarmy_flutter/features/room/domain/room_session_state.dart';

/// Pure state machine for the lobby flow.
class LobbyStateMachine {
  LobbyState _state = const LobbyState.initial();

  LobbyState get state => _state;

  LobbyState areasRequested() {
    return _set(const LobbyState.loadingAreas());
  }

  LobbyState areasLoaded(List<AreaSummary> areas) {
    if (_state.status != LobbyStatus.loadingAreas) return _state;
    return _set(LobbyState.areasLoaded(areas));
  }

  LobbyState boardsRequested(int areaId) {
    if (_state.status != LobbyStatus.areasLoaded &&
        _state.status != LobbyStatus.boardsLoaded) {
      return _state;
    }
    return _set(LobbyState.loadingBoards(_state.areas, areaId));
  }

  LobbyState boardsLoaded(int areaId, List<BoardSummary> boards) {
    if (_state.status != LobbyStatus.loadingBoards ||
        _state.selectedAreaId != areaId) {
      return _state;
    }
    return _set(LobbyState.boardsLoaded(_state.areas, areaId, boards));
  }

  LobbyState joinRequested() {
    if (_state.status != LobbyStatus.boardsLoaded &&
        _state.status != LobbyStatus.areasLoaded) {
      return _state;
    }
    return _set(const LobbyState.joining());
  }

  LobbyState joinSucceeded(RoomSessionState initialRoomState) {
    if (_state.status != LobbyStatus.joining) return _state;
    return _set(LobbyState.joined(initialRoomState));
  }

  LobbyState joinFailed(String message) {
    if (_state.status != LobbyStatus.joining) return _state;
    // Revert to boardsLoaded if we were there, else areasLoaded
    if (_state.selectedAreaId != null) {
      return _set(LobbyState.failed(message));
    }
    return _set(LobbyState.failed(message));
  }

  LobbyState reset() {
    return _set(const LobbyState.initial());
  }

  LobbyState _set(LobbyState next) {
    _state = next;
    return next;
  }
}
```

### `D:\personal\army/lib\features\lobby\data\lobby_packet_mapper.dart`
```dart
import 'package:mobiarmy_flutter/core/network/protocol/message.dart';
import 'package:mobiarmy_flutter/features/lobby/domain/area_summary.dart';
import 'package:mobiarmy_flutter/features/lobby/domain/board_summary.dart';

/// Decoders for lobby server packets.
/// Parity with SessionHandler.java.
class LobbyPacketMapper {
  const LobbyPacketMapper();

  /// cmd 6 `roomList`
  List<AreaSummary> decodeAreas(Message message) {
    final r = message.reader();
    final areas = <AreaSummary>[];
    while (r.available >= 4) {
      final id = r.readByte();
      final status = r.readByte();
      r.readByte(); // padding 0
      final type = r.readByte();
      areas.add(
        AreaSummary(id: id, status: status, type: type),
      );
    }
    return areas;
  }

  /// cmd 7 `roomWaitList`
  (int, List<BoardSummary>) decodeBoards(Message message) {
    final r = message.reader();
    final areaId = r.readByte();
    final boards = <BoardSummary>[];

    // Each board record is at least:
    // 1 (id) + 1 (num) + 1 (limit) + 1 (pass) + 4 (money) + 1 (started) + 2 (utf len) + 1 (mode) = 12 bytes
    while (r.available >= 12) {
      boards.add(
        BoardSummary(
          id: r.readByte(),
          numPlayers: r.readByte(),
          maxPlayers: r.readByte(),
          hasPassword: r.readBoolean(),
          bet: r.readInt(),
          isStarted: r.readBoolean(),
          name: r.readUTF(),
          mode: r.readByte(),
        ),
      );
    }
    return (areaId, boards);
  }
}
```

### `D:\personal\army/lib\features\lobby\data\lobby_repository.dart`
```dart
import 'package:mobiarmy_flutter/core/network/command/commands.dart';
import 'package:mobiarmy_flutter/core/network/protocol/message.dart';
import 'package:mobiarmy_flutter/core/network/transport/tcp_session.dart';

class LobbyRepository {
  LobbyRepository(this._session);
  final TcpSession _session;

  Future<void> requestAreas() async {
    await _session.sendMessage(Message(Commands.roomList));
  }

  Future<void> requestBoards(int areaId) async {
    final message = Message(Commands.roomWaitList);
    message.writer().writeByte(areaId);
    await _session.sendMessage(message);
  }

  Future<void> joinBoard(int areaId, int boardId, [String password = '']) async {
    final message = Message(Commands.joinRoomWait);
    message.writer().writeByte(areaId);
    message.writer().writeByte(boardId);
    message.writer().writeUTF(password);
    await _session.sendMessage(message);
  }

  Future<void> quickJoin(int mode) async {
    final message = Message(Commands.quickPlay);
    message.writer().writeByte(mode);
    await _session.sendMessage(message);
  }
}
```

### `D:\personal\army/lib\features\lobby\domain\area_summary.dart`
```dart
/// Summary of a server area (Khu vực).
/// Parity with SessionHandler.java: loadRoomInfo (cmd 6).
class AreaSummary {
  const AreaSummary({
    required this.id,
    required this.status,
    required this.type,
  });

  final int id;
  final int status;
  final int type;

  @override
  String toString() => 'AreaSummary(id: $id, status: $status, type: $type)';
}
```

### `D:\personal\army/lib\features\lobby\domain\board_summary.dart`
```dart
/// Summary of a game board (Bàn) within an area.
/// Parity with SessionHandler.java: loadRoomWaits (cmd 7).
class BoardSummary {
  const BoardSummary({
    required this.id,
    required this.numPlayers,
    required this.maxPlayers,
    required this.hasPassword,
    required this.bet,
    required this.isStarted,
    required this.name,
    required this.mode,
  });

  final int id;
  final int numPlayers;
  final int maxPlayers;
  final bool hasPassword;
  final int bet;
  final bool isStarted;
  final String name;
  final int mode;

  @override
  String toString() => 'BoardSummary(id: $id, name: $name, players: $numPlayers/$maxPlayers)';
}
```

### `D:\personal\army/lib\features\lobby\domain\lobby_state.dart`
```dart
import 'package:mobiarmy_flutter/features/room/domain/room_session_state.dart';
import 'area_summary.dart';
import 'board_summary.dart';

enum LobbyStatus {
  initial,
  loadingAreas,
  areasLoaded,
  loadingBoards,
  boardsLoaded,
  joining,
  joined, // Room UI will take over
  failed,
}

class LobbyState {
  const LobbyState._({
    required this.status,
    this.areas = const [],
    this.selectedAreaId,
    this.boards = const [],
    this.message,
    this.initialRoomState,
  });

  const LobbyState.initial() : this._(status: LobbyStatus.initial);

  const LobbyState.loadingAreas() : this._(status: LobbyStatus.loadingAreas);

  const LobbyState.areasLoaded(List<AreaSummary> areas)
    : this._(status: LobbyStatus.areasLoaded, areas: areas);

  const LobbyState.loadingBoards(List<AreaSummary> areas, int areaId)
    : this._(
        status: LobbyStatus.loadingBoards,
        areas: areas,
        selectedAreaId: areaId,
      );

  const LobbyState.boardsLoaded(
    List<AreaSummary> areas,
    int areaId,
    List<BoardSummary> boards,
  ) : this._(
        status: LobbyStatus.boardsLoaded,
        areas: areas,
        selectedAreaId: areaId,
        boards: boards,
      );

  const LobbyState.joining() : this._(status: LobbyStatus.joining);

  const LobbyState.joined(RoomSessionState initialRoomState)
    : this._(status: LobbyStatus.joined, initialRoomState: initialRoomState);

  const LobbyState.failed(String message)
    : this._(status: LobbyStatus.failed, message: message);

  final LobbyStatus status;
  final List<AreaSummary> areas;
  final int? selectedAreaId;
  final List<BoardSummary> boards;
  final String? message;
  final RoomSessionState? initialRoomState;

  bool get isBusy => {
    LobbyStatus.loadingAreas,
    LobbyStatus.loadingBoards,
    LobbyStatus.joining,
  }.contains(status);
}
```

### `D:\personal\army/lib\features\lobby\presentation\lobby_screen.dart`
```dart
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:mobiarmy_flutter/app/router/app_route.dart';
import 'package:mobiarmy_flutter/features/authentication/application/auth_controller.dart';
import 'package:mobiarmy_flutter/features/lobby/application/lobby_controller.dart';
import 'package:mobiarmy_flutter/features/lobby/domain/lobby_state.dart';
import 'package:mobiarmy_flutter/shared/widgets/bitmap_text.dart';
import 'package:mobiarmy_flutter/shared/widgets/game_viewport.dart';
import 'package:mobiarmy_flutter/shared/widgets/legacy_button.dart';
import 'package:mobiarmy_flutter/shared/widgets/legacy_dialog.dart';
import 'package:mobiarmy_flutter/shared/widgets/legacy_panel.dart';

class LobbyScreen extends ConsumerWidget {
  const LobbyScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final lobby = ref.watch(lobbyControllerProvider);
    final notifier = ref.read(lobbyControllerProvider.notifier);

    ref.listen(lobbyControllerProvider, (previous, next) {
      if (next.status == LobbyStatus.joined) {
        context.go(AppRoute.room.path);
      }
    });

    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, result) async {
        if (didPop) return;
        final exit = await LegacyDialog.showExitDialog(context);
        if (exit == true) {
          await ref.read(authControllerProvider.notifier).disconnect();
        }
      },
      child: Scaffold(
        body: GameViewport(
          child: Stack(
            children: [
            // Background
            Container(color: const Color(0xFF77D3FF)),

            Center(
              child: LegacyPanel(
                width: 400,
                height: 250,
                title: lobby.status == LobbyStatus.boardsLoaded
                    ? 'Khu vực ${lobby.selectedAreaId}'
                    : 'Chọn khu vực',
                child: lobby.isBusy
                    ? const Center(child: CircularProgressIndicator())
                    : lobby.status == LobbyStatus.boardsLoaded
                        ? _BoardList(
                            areaId: lobby.selectedAreaId!,
                            boards: lobby.boards,
                          )
                        : _AreaList(areas: lobby.areas),
              ),
            ),

            // Soft Keys
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                height: 35,
                color: Colors.black54,
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    LegacyButton(
                      label: lobby.status == LobbyStatus.boardsLoaded ? 'Quay lại' : 'Thoát',
                      width: 80,
                      height: 25,
                      onPressed: () {
                        if (lobby.status == LobbyStatus.boardsLoaded) {
                          notifier.loadAreas();
                        } else {
                          context.go('/');
                        }
                      },
                    ),
                    Row(
                      children: [
                        LegacyButton(
                          label: 'Thêm',
                          width: 80,
                          height: 25,
                          onPressed: () => _showMoreMenu(context),
                        ),
                        const SizedBox(width: 5),
                        LegacyButton(
                          label: 'Chơi ngay',
                          width: 80,
                          height: 25,
                          onPressed: () => notifier.quickJoin(0), // Mode 0 = default quick play
                        ),
                        const SizedBox(width: 5),
                        LegacyButton(
                          label: 'Cập nhật',
                          width: 80,
                          height: 25,
                          onPressed: () {
                            if (lobby.status == LobbyStatus.boardsLoaded && lobby.selectedAreaId != null) {
                              notifier.loadBoards(lobby.selectedAreaId!);
                            } else {
                              notifier.loadAreas();
                            }
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      ),
    );
  }

  void _showMoreMenu(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (ctx) => Container(
        padding: const EdgeInsets.all(16),
        child: Wrap(
          spacing: 16,
          runSpacing: 16,
          children: [
            _MenuIcon(icon: Icons.inventory, label: 'Hành trang', route: AppRoute.inventory),
            _MenuIcon(icon: Icons.shopping_cart, label: 'Cửa hàng', route: AppRoute.shop),
            _MenuIcon(icon: Icons.people, label: 'Bạn bè', route: AppRoute.friends),
            _MenuIcon(icon: Icons.shield, label: 'Biệt đội', route: AppRoute.clan),
            _MenuIcon(icon: Icons.assignment, label: 'Nhiệm vụ', route: AppRoute.missions),
            _MenuIcon(icon: Icons.casino, label: 'Quay số', route: AppRoute.luckyGame),
            _MenuIcon(icon: Icons.leaderboard, label: 'Hạng', route: AppRoute.ranking),
            _MenuIcon(icon: Icons.build, label: 'Chế tạo', route: AppRoute.formulas),
            _MenuIcon(icon: Icons.account_circle, label: 'Cá nhân', route: AppRoute.profile),
          ],
        ),
      ),
    );
  }
}

class _MenuIcon extends StatelessWidget {
  const _MenuIcon({required this.icon, required this.label, required this.route});
  final IconData icon;
  final String label;
  final AppRoute route;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pop(context);
        context.push(route.path);
      },
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 40),
          const SizedBox(height: 4),
          Text(label, style: const TextStyle(fontSize: 12)),
        ],
      ),
    );
  }
}

class _AreaList extends ConsumerWidget {
  const _AreaList({required this.areas});
  final List<dynamic> areas;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    if (areas.isEmpty) {
      return const Center(child: BitmapText('Không có khu vực nào', scale: 0.8));
    }
    return ListView.builder(
      itemCount: areas.length,
      itemBuilder: (context, index) {
        final area = areas[index];
        return ListTile(
          dense: true,
          title: BitmapText('Khu vực ${area.id}', scale: 0.9),
          subtitle: BitmapText('Trạng thái: ${area.status} - Loại: ${area.type}', scale: 0.7),
          trailing: const Icon(Icons.chevron_right, color: Colors.black54),
          onTap: () => ref.read(lobbyControllerProvider.notifier).loadBoards(area.id),
        );
      },
    );
  }
}

class _BoardList extends ConsumerWidget {
  const _BoardList({required this.areaId, required this.boards});
  final int areaId;
  final List<dynamic> boards;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    if (boards.isEmpty) {
      return const Center(child: BitmapText('Không có bàn nào trống', scale: 0.8));
    }
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 4,
        childAspectRatio: 1.4,
        crossAxisSpacing: 5,
        mainAxisSpacing: 5,
      ),
      itemCount: boards.length,
      itemBuilder: (context, index) {
        final board = boards[index];
        final isFull = board.numPlayers >= board.maxPlayers;

        return GestureDetector(
          onTap: board.isStarted || isFull
              ? null
              : () {
                  if (board.hasPassword) {
                    _promptPassword(context, ref, board.id);
                  } else {
                    ref.read(lobbyControllerProvider.notifier).joinBoard(areaId, board.id);
                  }
                },
          child: Container(
            decoration: BoxDecoration(
              color: board.isStarted
                  ? Colors.grey
                  : isFull
                      ? Colors.redAccent.withValues(alpha: 0.2)
                      : const Color(0xFF3379FF).withValues(alpha: 0.3),
              border: Border.all(color: const Color(0xFF303030)),
              borderRadius: BorderRadius.circular(4),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                BitmapText('Bàn ${board.id}', scale: 0.8),
                BitmapText('${board.numPlayers}/${board.maxPlayers}', scale: 0.6),
                if (board.hasPassword)
                  const Icon(Icons.lock, size: 12, color: Colors.amber),
              ],
            ),
          ),
        );
      },
    );
  }

  void _promptPassword(BuildContext context, WidgetRef ref, int boardId) {
    final textController = TextEditingController();
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text('Mật khẩu bàn $boardId'),
        content: TextField(
          controller: textController,
          autofocus: true,
          decoration: const InputDecoration(hintText: 'Nhập mật khẩu'),
          obscureText: true,
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(ctx).pop(),
            child: const Text('Hủy'),
          ),
          TextButton(
            onPressed: () {
              ref.read(lobbyControllerProvider.notifier).joinBoard(areaId, boardId, textController.text);
              Navigator.of(ctx).pop();
            },
            child: const Text('Vào phòng'),
          ),
        ],
      ),
    );
  }
}
```

### `D:\personal\army/lib\features\room\application\room_controller.dart`
```dart
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logging/logging.dart';
import 'package:mobiarmy_flutter/core/network/command/commands.dart';
import 'package:mobiarmy_flutter/core/network/dispatcher/message_dispatcher.dart';
import 'package:mobiarmy_flutter/core/network/network_provider.dart';
import 'package:mobiarmy_flutter/core/network/protocol/message.dart';
import 'package:mobiarmy_flutter/features/authentication/application/auth_controller.dart';
import 'package:mobiarmy_flutter/features/gameplay/application/chat_controller.dart';
import 'package:mobiarmy_flutter/features/lobby/application/lobby_controller.dart';
import 'package:mobiarmy_flutter/features/lobby/domain/lobby_state.dart';

import 'package:mobiarmy_flutter/features/room/application/room_state_machine.dart';
import 'package:mobiarmy_flutter/features/room/data/room_packet_mapper.dart';
import 'package:mobiarmy_flutter/features/room/data/room_repository.dart';
import 'package:mobiarmy_flutter/features/room/domain/room_session_state.dart';

class RoomController extends Notifier<RoomSessionState?> {
  final _logger = Logger('RoomController');

  late RoomStateMachine _machine;
  late RoomRepository _repository;
  late RoomPacketMapper _mapper;

  @override
  RoomSessionState? build() {
    _machine = RoomStateMachine();
    _mapper = const RoomPacketMapper();
    _repository = RoomRepository(ref.watch(tcpSessionProvider));

    final dispatcher = ref.watch(messageDispatcherProvider);
    _registerHandlers(dispatcher);

    ref.onDispose(() {
      _unregisterHandlers(dispatcher);
    });

    // Check for initial state from Lobby transition
    final lobby = ref.read(lobbyControllerProvider);
    if (lobby.status == LobbyStatus.joined && lobby.initialRoomState != null) {
      _machine.initialized(lobby.initialRoomState!);
    }

    return _machine.state;
  }

  void _registerHandlers(MessageDispatcher dispatcher) {
    dispatcher
      ..register(Commands.joinRoomWait, _onLoadRoomWait)
      ..register(Commands.ready, _onReadySync)
      ..register(Commands.changeTeam, _onTeamSync)
      ..register(Commands.selectMap, _onMapSync)
      ..register(Commands.chat, _onChat)
      ..register(Commands.startGame, _onGameStart)
      ..register(Commands.bet, _onBetSync)
      ..register(Commands.kick, _onKickSync)
      ..register(Commands.leaveRoomWait, _onLeaveSync)
      ..register(Commands.buyGlass, _onGlassSync);
  }

  void _unregisterHandlers(MessageDispatcher dispatcher) {
    dispatcher
      ..unregister(Commands.joinRoomWait, _onLoadRoomWait)
      ..unregister(Commands.ready, _onReadySync)
      ..unregister(Commands.changeTeam, _onTeamSync)
      ..unregister(Commands.selectMap, _onMapSync)
      ..unregister(Commands.chat, _onChat)
      ..unregister(Commands.startGame, _onGameStart)
      ..unregister(Commands.bet, _onBetSync)
      ..unregister(Commands.kick, _onKickSync)
      ..unregister(Commands.leaveRoomWait, _onLeaveSync)
      ..unregister(Commands.buyGlass, _onGlassSync);
  }

  // ---------------------------------------------------------------- commands

  Future<void> toggleReady() => _repository.sendReady();
  Future<void> changeTeam() => _repository.sendChangeTeam();
  Future<void> sendChat(String text) => _repository.sendChat(text);
  Future<void> selectMap(int mapId) => _repository.sendSelectMap(mapId);
  Future<void> startGame() => _repository.sendStartGame();
  Future<void> changeBet(int amount) => _repository.sendBet(amount);
  Future<void> kickPlayer(int playerId) => _repository.sendKick(playerId);
  Future<void> selectGlass(int glassId) => _repository.sendSelectGlass(glassId);

  Future<void> leaveRoom() async {
    await _repository.sendLeave();
    _machine.reset();
    state = null;
  }

  // --------------------------------------------------------------- packets

  void _onLoadRoomWait(Message message) {
    try {
      final roomState = _mapper.decodeLoadRoomWait(message);
      _machine.initialized(roomState);
      state = _machine.state;
    } catch (e, stack) {
      _logger.severe('loadRoomWait parse failed', e, stack);
    }
  }

  void _onReadySync(Message message) {
    try {
      final (playerId, isReady) = _mapper.decodeReady(message);
      _machine.readySynced(playerId, isReady);
      state = _machine.state;
    } catch (e) {
      _logger.warning('readySync parse failed: $e');
    }
  }

  void _onTeamSync(Message message) {
    try {
      final (playerId, teamId) = _mapper.decodeTeam(message);
      _machine.teamSynced(playerId, teamId);
      state = _machine.state;
    } catch (e) {
      _logger.warning('teamSync parse failed: $e');
    }
  }

  void _onMapSync(Message message) {
    try {
      final mapId = message.reader().readByte();
      _machine.mapChanged(mapId);
      state = _machine.state;
    } catch (e) {
      _logger.warning('mapSync parse failed: $e');
    }
  }

  void _onBetSync(Message message) {
    try {
      final bet = _mapper.decodeBet(message);
      _machine.betChanged(bet);
      state = _machine.state;
    } catch (e) {
      _logger.warning('betSync parse failed: $e');
    }
  }

  void _onKickSync(Message message) {
    try {
      final playerId = _mapper.decodeKick(message);
      _machine.playerLeft(playerId);
      state = _machine.state;
    } catch (e) {
      _logger.warning('kickSync parse failed: $e');
    }
  }

  void _onLeaveSync(Message message) {
    try {
      final playerId = message.reader().readInt();
      _machine.playerLeft(playerId);
      state = _machine.state;
    } catch (e) {
      _logger.warning('leaveSync parse failed: $e');
    }
  }

  void _onGlassSync(Message message) {
    try {
      final r = message.reader();
      final playerId = r.readInt();
      final glassId = r.readByte();
      _machine.glassChanged(playerId, glassId);
      state = _machine.state;
    } catch (e) {
      _logger.warning('glassSync parse failed: $e');
    }
  }

  void _onChat(Message message) {
    try {
      final (playerId, text) = _mapper.decodeChat(message);
      final sender = state?.players[playerId]?.name ?? 'System';
      ref.read(chatControllerProvider.notifier).addMessage(sender, text);
    } catch (_) {}
  }

  void _onGameStart(Message message) {
    _logger.info('Game Starting (cmd 20)...');
    // Phase 16 will handle match start navigation
  }

  bool get isMaster {
    final myId = ref.read(authControllerProvider).session?.id;
    return state?.masterId == myId;
  }
}

final roomControllerProvider =
    NotifierProvider<RoomController, RoomSessionState?>(RoomController.new);
```

### `D:\personal\army/lib\features\room\application\room_state_machine.dart`
```dart
import 'package:mobiarmy_flutter/features/room/domain/room_player.dart';
import 'package:mobiarmy_flutter/features/room/domain/room_session_state.dart';

class RoomStateMachine {
  RoomSessionState? _state;

  RoomSessionState? get state => _state;

  void initialized(RoomSessionState state) {
    _state = state;
  }

  void playerJoined(int slotIndex, RoomPlayer player) {
    if (_state == null) return;
    final players = Map<int, RoomPlayer>.from(_state!.players);
    players[player.id] = player.copyWith();
    _state = _state!.copyWith(players: players);
  }

  void playerLeft(int playerId) {
    if (_state == null) return;
    final players = Map<int, RoomPlayer>.from(_state!.players);
    players.remove(playerId);

    // Automatic master transfer logic if the host left and room is not empty
    int newMasterId = _state!.masterId;
    if (playerId == _state!.masterId && players.isNotEmpty) {
      newMasterId = players.keys.first;
    }

    _state = _state!.copyWith(players: players, masterId: newMasterId);
  }

  void readySynced(int playerId, bool isReady) {
    if (_state == null) return;
    final player = _state!.players[playerId];
    if (player == null) return;

    final players = Map<int, RoomPlayer>.from(_state!.players);
    players[playerId] = player.copyWith(isReady: isReady);
    _state = _state!.copyWith(players: players);
  }

  void teamSynced(int playerId, int team) {
    if (_state == null) return;
    final player = _state!.players[playerId];
    if (player == null) return;

    final players = Map<int, RoomPlayer>.from(_state!.players);
    players[playerId] = player.copyWith(team: team);
    _state = _state!.copyWith(players: players);
  }

  void mapChanged(int mapId) {
    if (_state == null) return;
    _state = _state!.copyWith(mapId: mapId);
  }

  void masterChanged(int masterId) {
    if (_state == null) return;
    _state = _state!.copyWith(masterId: masterId);
  }

  void betChanged(int bet) {
    if (_state == null) return;
    _state = _state!.copyWith(bet: bet);
  }

  void glassChanged(int playerId, int glassId) {
    if (_state == null) return;
    final player = _state!.players[playerId];
    if (player == null) return;

    final players = Map<int, RoomPlayer>.from(_state!.players);
    players[playerId] = player.copyWith(glassId: glassId, gun: glassId);
    _state = _state!.copyWith(players: players);
  }

  void reset() {
    _state = null;
  }
}
```

### `D:\personal\army/lib\features\room\data\room_packet_mapper.dart`
```dart
import 'package:mobiarmy_flutter/core/network/protocol/message.dart';
import 'package:mobiarmy_flutter/features/room/domain/room_player.dart';
import 'package:mobiarmy_flutter/features/room/domain/room_session_state.dart';

class RoomPacketMapper {
  const RoomPacketMapper();

  /// cmd 8 `loadRoomWait`
  RoomSessionState decodeLoadRoomWait(Message message) {
    final r = message.reader();
    final masterId = r.readInt();
    final bet = r.readInt();
    final roomType = r.readByte();
    final gameMode = r.readByte();

    final players = <int, RoomPlayer>{};
    // Standard MobiArmy2 room has 8 slots
    for (int i = 0; i < 8; i++) {
      final playerId = r.readInt();
      if (playerId == -1) continue;

      final clan = r.readShort();
      final name = r.readUTF();
      r.readInt(); // unknown/unused field
      final level = r.readByte();
      final glassId = r.readByte();

      // 5 equip slots (gun, hat, armor, glasses, wing)
      final equips = [for (var j = 0; j < 5; j++) r.readShort()];
      final isReady = r.readBoolean();

      players[playerId] = RoomPlayer(
        id: playerId,
        name: name,
        level: level,
        clan: clan,
        glassId: glassId,
        equips: equips,
        isReady: isReady,
        slotIndex: i,
        // Team is usually derived from slot index: even = Blue (0), odd = Red (1)
        team: i % 2,
        gun: glassId,
      );
    }

    return RoomSessionState(
      masterId: masterId,
      bet: bet,
      roomType: RoomType.fromInt(roomType),
      gameMode: GameMode.fromInt(gameMode),
      players: players,
    );
  }

  /// cmd 16 `ready` sync (S -> C)
  (int, bool) decodeReady(Message message) {
    final r = message.reader();
    return (r.readInt(), r.readBoolean());
  }

  /// cmd 71 `changeTeam` sync (S -> C)
  (int, int) decodeTeam(Message message) {
    final r = message.reader();
    return (r.readInt(), r.readByte());
  }

  /// cmd 9 `chat` (S -> C)
  (int, String) decodeChat(Message message) {
    final r = message.reader();
    return (r.readInt(), r.readUTF());
  }

  /// cmd 19 `bet` sync (S -> C)
  int decodeBet(Message message) {
    return message.reader().readInt();
  }

  /// cmd 11 `kick` sync (S -> C)
  int decodeKick(Message message) {
    return message.reader().readInt();
  }
}
```

### `D:\personal\army/lib\features\room\data\room_repository.dart`
```dart
import 'package:mobiarmy_flutter/core/network/command/commands.dart';
import 'package:mobiarmy_flutter/core/network/protocol/message.dart';
import 'package:mobiarmy_flutter/core/network/transport/tcp_session.dart';

class RoomRepository {
  RoomRepository(this._session);
  final TcpSession _session;

  Future<void> sendReady() async {
    await _session.sendMessage(Message(Commands.ready));
  }

  Future<void> sendChangeTeam() async {
    await _session.sendMessage(Message(Commands.changeTeam));
  }

  Future<void> sendChat(String text) async {
    final message = Message(Commands.chat);
    message.writer().writeUTF(text);
    await _session.sendMessage(message);
  }

  Future<void> sendSelectMap(int mapId) async {
    final message = Message(Commands.selectMap);
    message.writer().writeByte(mapId);
    await _session.sendMessage(message);
  }

  Future<void> sendStartGame() async {
    await _session.sendMessage(Message(Commands.startGame));
  }

  Future<void> sendLeave() async {
    await _session.sendMessage(Message(Commands.leaveRoomWait));
  }

  Future<void> sendKick(int playerId) async {
    final message = Message(Commands.kick);
    message.writer().writeInt(playerId);
    await _session.sendMessage(message);
  }

  Future<void> sendBet(int amount) async {
    final message = Message(Commands.bet);
    message.writer().writeInt(amount);
    await _session.sendMessage(message);
  }

  Future<void> sendSelectGlass(int glassId) async {
    final message = Message(Commands.buyGlass);
    message.writer().writeByte(glassId);
    await _session.sendMessage(message);
  }
}
```

### `D:\personal\army/lib\features\room\domain\room_player.dart`
```dart
/// A player inside a waiting room.
class RoomPlayer {
  const RoomPlayer({
    required this.id,
    required this.name,
    required this.level,
    required this.clan,
    required this.glassId,
    required this.equips,
    this.isReady = false,
    this.team = 0,
    this.slotIndex = -1,
    this.gun = 0,
    this.isBoss = false,
    this.connectionState = 'connected',
  });

  final int id;
  final String name;
  final int level;
  final int clan;
  final int glassId;
  final List<int> equips;
  final bool isReady;
  final int team;
  final int slotIndex;
  final int gun;
  final bool isBoss;
  final String connectionState;

  RoomPlayer copyWith({
    bool? isReady,
    int? team,
    List<int>? equips,
    int? gun,
    String? connectionState,
    int? glassId,
  }) {
    return RoomPlayer(
      id: id,
      name: name,
      level: level,
      clan: clan,
      glassId: glassId ?? this.glassId,
      equips: equips ?? this.equips,
      isReady: isReady ?? this.isReady,
      team: team ?? this.team,
      slotIndex: slotIndex,
      gun: gun ?? this.gun,
      connectionState: connectionState ?? this.connectionState,
    );
  }

  @override
  String toString() => 'RoomPlayer($name, ready: $isReady, team: $team)';
}
```

### `D:\personal\army/lib\features\room\domain\room_session_state.dart`
```dart
import 'room_player.dart';

enum RoomType {
  normal(0),
  boss(5),
  training(3),
  vip(4),
  arena(6);

  const RoomType(this.value);
  final int value;

  static RoomType fromInt(int value) =>
      RoomType.values.firstWhere((e) => e.value == value, orElse: () => RoomType.normal);
}

enum GameMode {
  normal(0),
  power(1),
  pro(2);

  const GameMode(this.value);
  final int value;

  static GameMode fromInt(int value) =>
      GameMode.values.firstWhere((e) => e.value == value, orElse: () => GameMode.normal);
}

class RoomSessionState {
  const RoomSessionState({
    required this.masterId,
    required this.bet,
    required this.players,
    this.roomId = 0,
    this.boardId = 0,
    this.roomType = RoomType.normal,
    this.gameMode = GameMode.normal,
    this.mapId = 0,
    this.areaId = 0,
    this.capacity = 8,
    this.roomName = '',
    this.connectionState = 'connected',
  });

  final int masterId;
  final int bet;
  final Map<int, RoomPlayer> players; // Key is playerId
  final int roomId;
  final int boardId;
  final RoomType roomType;
  final GameMode gameMode;
  final int mapId;
  final int areaId;
  final int capacity;
  final String roomName;
  final String connectionState;

  List<RoomPlayer> get playerList => players.values.toList();

  bool isMaster(int playerId) => playerId == masterId;

  bool get isBossRoom => roomType == RoomType.boss;
  bool get isTraining => roomType == RoomType.training;
  bool get isArena => roomType == RoomType.arena;

  bool canStart(int myId) {
    if (!isMaster(myId)) return false;
    if (players.length < 2 && !isArena && !isTraining) return false;

    // Check if everyone is ready
    final allReady = players.values
        .where((p) => p.id != masterId)
        .every((p) => p.isReady);
    if (!allReady) return false;

    // Team balance check (Team mode is usually even/odd slots)
    if (roomType == RoomType.normal || roomType == RoomType.vip) {
      int team0 = players.values.where((p) => p.team == 0).length;
      int team1 = players.values.where((p) => p.team == 1).length;
      if (team0 != team1) return false;
    }

    return true;
  }

  RoomSessionState copyWith({
    int? masterId,
    int? mapId,
    Map<int, RoomPlayer>? players,
    int? roomId,
    int? boardId,
    RoomType? roomType,
    GameMode? gameMode,
    int? areaId,
    int? capacity,
    int? bet,
    String? roomName,
    String? connectionState,
  }) {
    return RoomSessionState(
      masterId: masterId ?? this.masterId,
      bet: bet ?? this.bet,
      players: players ?? this.players,
      roomId: roomId ?? this.roomId,
      boardId: boardId ?? this.boardId,
      roomType: roomType ?? this.roomType,
      gameMode: gameMode ?? this.gameMode,
      mapId: mapId ?? this.mapId,
      areaId: areaId ?? this.areaId,
      capacity: capacity ?? this.capacity,
      roomName: roomName ?? this.roomName,
      connectionState: connectionState ?? this.connectionState,
    );
  }
}
```

### `D:\personal\army/lib\features\room\presentation\room_screen.dart`
```dart
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:mobiarmy_flutter/app/router/app_route.dart';
import 'package:mobiarmy_flutter/core/assets/bmfont.dart';
import 'package:mobiarmy_flutter/features/authentication/application/auth_controller.dart';
import 'package:mobiarmy_flutter/features/room/application/room_controller.dart';
import 'package:mobiarmy_flutter/features/room/domain/room_player.dart';
import 'package:mobiarmy_flutter/features/room/domain/room_session_state.dart';
import 'package:mobiarmy_flutter/shared/widgets/bitmap_text.dart';
import 'package:mobiarmy_flutter/shared/widgets/game_viewport.dart';
import 'package:mobiarmy_flutter/shared/widgets/legacy_button.dart';
import 'package:mobiarmy_flutter/shared/widgets/legacy_panel.dart';

class RoomScreen extends ConsumerWidget {
  const RoomScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final roomState = ref.watch(roomControllerProvider);
    final controller = ref.read(roomControllerProvider.notifier);
    final myId = ref.watch(authControllerProvider).session?.id;

    if (roomState == null) {
      return Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const CircularProgressIndicator(),
              const SizedBox(height: 10),
              LegacyButton(
                label: 'Quay lại',
                width: 100,
                height: 30,
                onPressed: () => context.go(AppRoute.lobby.path),
              ),
            ],
          ),
        ),
      );
    }

    final isMaster = roomState.masterId == myId;

    return Scaffold(
      body: GameViewport(
        child: Stack(
          children: [
            // Background
            Container(color: const Color(0xFF5CB3FF)),

            Center(
              child: LegacyPanel(
                width: 460,
                height: 280,
                title: 'Bàn: ${roomState.boardId} - Map: ${roomState.mapId} - Cược: ${roomState.bet}',
                child: Column(
                  children: [
                    Expanded(
                      child: GridView.builder(
                        padding: const EdgeInsets.all(4),
                        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          childAspectRatio: 3.8,
                          crossAxisSpacing: 6,
                          mainAxisSpacing: 6,
                        ),
                        itemCount: 8,
                        itemBuilder: (context, index) {
                          final player = roomState.playerList.firstWhere(
                            (p) => p.slotIndex == index,
                            orElse: () => const RoomPlayer(
                              id: -1, name: '', level: 0, clan: 0, glassId: 0, equips: [],
                            ),
                          );
                          return _PlayerSlot(
                            player: player,
                            isMaster: roomState.masterId == player.id,
                            isMe: player.id == myId,
                            amIMaster: isMaster,
                            onKick: () => controller.kickPlayer(player.id),
                          );
                        },
                      ),
                    ),
                    _buildRoomControls(context, controller, roomState, myId),
                  ],
                ),
              ),
            ),

            // Soft Keys (Bottom Bar)
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                height: 35,
                color: const Color(0xD9000000), // black84
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    LegacyButton(
                      label: 'Thoát',
                      width: 70,
                      height: 25,
                      onPressed: () async {
                        await controller.leaveRoom();
                        if (context.mounted) {
                          context.go(AppRoute.lobby.path);
                        }
                      },
                    ),
                    BitmapText(
                      'Chế độ: ${roomState.gameMode == GameMode.normal ? "Đối kháng" : "Đấu đội"}',
                      anchor: GraphicsAnchor.hCenter | GraphicsAnchor.vCenter,
                    ),
                    const SizedBox(width: 70),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildRoomControls(
    BuildContext context,
    RoomController controller,
    RoomSessionState roomState,
    int? myId,
  ) {
    final isMaster = roomState.masterId == myId;
    final me = roomState.players[myId];

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
      child: Wrap(
        spacing: 8,
        runSpacing: 4,
        alignment: WrapAlignment.center,
        children: [
          LegacyButton(
            label: 'Đổi đội',
            width: 75,
            height: 24,
            onPressed: controller.changeTeam,
          ),
          LegacyButton(
            label: 'Đổi súng',
            width: 75,
            height: 24,
            onPressed: () => _showGlassSelection(context, controller, me?.glassId ?? 0),
          ),
          if (isMaster) ...[
            LegacyButton(
              label: 'Đổi Map',
              width: 75,
              height: 24,
              onPressed: () => _showMapSelection(context, controller, roomState.mapId),
            ),
            LegacyButton(
              label: 'Đổi Tiền',
              width: 75,
              height: 24,
              onPressed: () => _showBetSelection(context, controller, roomState.bet),
            ),
            LegacyButton(
              label: 'Bắt đầu',
              width: 90,
              height: 24,
              onPressed: controller.startGame,
              isSelected: true,
            ),
          ] else
            LegacyButton(
              label: me?.isReady == true ? 'Sẵn sàng' : 'Chưa SS',
              width: 90,
              height: 24,
              onPressed: controller.toggleReady,
              isSelected: me?.isReady == true,
            ),
        ],
      ),
    );
  }

  void _showGlassSelection(BuildContext context, RoomController controller, int current) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('Chọn Nhân Vật / Súng', style: TextStyle(fontSize: 14)),
        content: Wrap(
          spacing: 10,
          children: List.generate(4, (index) {
            return ChoiceChip(
              label: Text('Gun $index'),
              selected: current == index,
              onSelected: (_) {
                controller.selectGlass(index);
                Navigator.of(ctx).pop();
              },
            );
          }),
        ),
      ),
    );
  }

  void _showMapSelection(BuildContext context, RoomController controller, int current) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('Chọn Bản Đồ', style: TextStyle(fontSize: 14)),
        content: Wrap(
          spacing: 10,
          children: List.generate(5, (index) {
            return ChoiceChip(
              label: Text('Map $index'),
              selected: current == index,
              onSelected: (_) {
                controller.selectMap(index);
                Navigator.of(ctx).pop();
              },
            );
          }),
        ),
      ),
    );
  }

  void _showBetSelection(BuildContext context, RoomController controller, int current) {
    final bets = [100, 500, 1000, 5000, 10000];
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('Chọn Mức Cược', style: TextStyle(fontSize: 14)),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: bets.map((b) {
            return ListTile(
              title: Text('$b xu'),
              trailing: current == b ? const Icon(Icons.check, color: Colors.green) : null,
              onTap: () {
                controller.changeBet(b);
                Navigator.of(ctx).pop();
              },
            );
          }).toList(),
        ),
      ),
    );
  }
}

class _PlayerSlot extends StatelessWidget {
  const _PlayerSlot({
    required this.player,
    required this.isMaster,
    required this.isMe,
    required this.amIMaster,
    required this.onKick,
  });

  final RoomPlayer player;
  final bool isMaster;
  final bool isMe;
  final bool amIMaster;
  final VoidCallback onKick;

  @override
  Widget build(BuildContext context) {
    if (player.id == -1) {
      return Container(
        decoration: BoxDecoration(
          color: Colors.black26,
          border: Border.all(color: Colors.black38),
          borderRadius: BorderRadius.circular(4),
        ),
        child: const Center(
          child: BitmapText('Trống', scale: 0.6),
        ),
      );
    }

    final teamColor = player.team == 0
        ? const Color(0xFF3379FF).withValues(alpha: 0.25)
        : const Color(0xFFFF3333).withValues(alpha: 0.25);

    return InkWell(
      onTap: (amIMaster && !isMe) ? onKick : null,
      child: Container(
        decoration: BoxDecoration(
          color: teamColor,
          border: Border.all(color: isMe ? Colors.yellow : const Color(0xFF303030), width: isMe ? 1.5 : 1),
          borderRadius: BorderRadius.circular(4),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 2),
          child: Row(
            children: [
              Container(
                width: 18,
                height: 18,
                decoration: BoxDecoration(
                  color: Colors.blueGrey,
                  borderRadius: BorderRadius.circular(2),
                ),
                child: Center(
                  child: Text(
                    player.level.toString(),
                    style: const TextStyle(fontSize: 9, color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              const SizedBox(width: 4),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    BitmapText(
                      player.name,
                      scale: 0.7,
                      colorIndex: isMe ? 3 : -1, // YELLOW for me
                    ),
                    Row(
                      children: [
                        if (isMaster)
                          const Padding(
                            padding: EdgeInsets.only(right: 4),
                            child: BitmapText('H', scale: 0.5, colorIndex: 5),
                          ),
                        BitmapText('G:${player.gun}', scale: 0.5, colorIndex: 0),
                      ],
                    ),
                  ],
                ),
              ),
              if (!isMaster && player.isReady)
                const Icon(Icons.check_circle, color: Colors.green, size: 14),
              if (amIMaster && !isMe)
                const Icon(Icons.gavel, color: Colors.redAccent, size: 12),
            ],
          ),
        ),
      ),
    );
  }
}
```

### `D:\personal\army/lib\features\shop\application\shop_controller.dart`
```dart
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logging/logging.dart';
import 'package:mobiarmy_flutter/core/network/command/commands.dart';
import 'package:mobiarmy_flutter/core/network/dispatcher/message_dispatcher.dart';
import 'package:mobiarmy_flutter/core/network/network_provider.dart';
import 'package:mobiarmy_flutter/core/network/protocol/message.dart';
import 'package:mobiarmy_flutter/features/shop/data/shop_packet_mapper.dart';
import 'package:mobiarmy_flutter/features/shop/data/shop_repository.dart';
import 'package:mobiarmy_flutter/features/shop/domain/shop_models.dart';

class ShopState {
  const ShopState({
    this.equipments = const [],
    this.specialItems = const [],
    this.clanItems = const [],
    this.isLoading = false,
    this.error,
  });

  final List<ShopEquipment> equipments;
  final List<ShopSpecialItem> specialItems;
  final List<ClanShopItem> clanItems;
  final bool isLoading;
  final String? error;

  ShopState copyWith({
    List<ShopEquipment>? equipments,
    List<ShopSpecialItem>? specialItems,
    List<ClanShopItem>? clanItems,
    bool? isLoading,
    String? error,
  }) {
    return ShopState(
      equipments: equipments ?? this.equipments,
      specialItems: specialItems ?? this.specialItems,
      clanItems: clanItems ?? this.clanItems,
      isLoading: isLoading ?? this.isLoading,
      error: error ?? this.error,
    );
  }
}

class ShopController extends Notifier<ShopState> {
  final _logger = Logger('ShopController');
  late final ShopRepository _repository;
  late final ShopPacketMapper _mapper;

  @override
  ShopState build() {
    _repository = ShopRepository(ref.watch(tcpSessionProvider));
    _mapper = const ShopPacketMapper();

    final dispatcher = ref.watch(messageDispatcherProvider);
    _registerHandlers(dispatcher);

    ref.onDispose(() {
      _unregisterHandlers(dispatcher);
    });

    return const ShopState();
  }

  void _registerHandlers(MessageDispatcher dispatcher) {
    dispatcher
      ..register(Commands.getShopEquip, _onShopEquipment)
      ..register(Commands.shopSpecial, _onShopSpecial)
      ..register(Commands.shopBietDoi, _onShopClan)
      ..register(Commands.buySellEquip, _onTransactionResult)
      ..register(Commands.log, _onLog);
  }

  void _unregisterHandlers(MessageDispatcher dispatcher) {
    dispatcher
      ..unregister(Commands.getShopEquip, _onShopEquipment)
      ..unregister(Commands.shopSpecial, _onShopSpecial)
      ..unregister(Commands.shopBietDoi, _onShopClan)
      ..unregister(Commands.buySellEquip, _onTransactionResult)
      ..unregister(Commands.log, _onLog);
  }

  Future<void> loadShopEquipment() async {
    state = state.copyWith(isLoading: true, error: null);
    try {
      await _repository.requestShopEquipment();
    } catch (e) {
      state = state.copyWith(isLoading: false, error: e.toString());
    }
  }

  Future<void> loadShopSpecial() async {
    state = state.copyWith(isLoading: true, error: null);
    try {
      await _repository.requestShopSpecial();
    } catch (e) {
      state = state.copyWith(isLoading: false, error: e.toString());
    }
  }

  Future<void> buyEquipment(int shopIndex, int moneyType) async {
    state = state.copyWith(isLoading: true);
    try {
      await _repository.buyEquipment(shopIndex, moneyType);
    } catch (e) {
      state = state.copyWith(isLoading: false, error: e.toString());
    }
  }

  // --------------------------------------------------------------- handlers

  void _onShopEquipment(Message message) {
    try {
      final items = _mapper.decodeShopEquipment(message);
      state = state.copyWith(equipments: items, isLoading: false);
    } catch (e, stack) {
      _logger.severe('Failed to decode shop equipment', e, stack);
    }
  }

  void _onShopSpecial(Message message) {
    try {
      final items = _mapper.decodeShopSpecial(message);
      state = state.copyWith(specialItems: items, isLoading: false);
    } catch (e, stack) {
      _logger.severe('Failed to decode shop special', e, stack);
    }
  }

  void _onShopClan(Message message) {
    try {
      final items = _mapper.decodeShopClan(message);
      state = state.copyWith(clanItems: items, isLoading: false);
    } catch (e, stack) {
      _logger.severe('Failed to decode shop clan', e, stack);
    }
  }

  void _onTransactionResult(Message message) {
    final r = message.reader();
    final action = r.readByte();
    if (action == 1) {
      final info = r.readUTF();
      state = state.copyWith(error: info, isLoading: false);
    }
  }

  void _onLog(Message message) {
    if (state.isLoading) {
      final text = message.reader().readUTF();
      state = state.copyWith(error: text, isLoading: false);
    }
  }
}

final shopControllerProvider = NotifierProvider<ShopController, ShopState>(ShopController.new);
```

### `D:\personal\army/lib\features\shop\domain\shop_item.dart`
```dart
enum ShopItemType { equipment, item }

class ShopItem {
  const ShopItem({
    required this.id,
    required this.name,
    required this.priceXu,
    required this.priceLuong,
    required this.type,
    this.description = '',
  });

  final int id;
  final String name;
  final int priceXu;
  final int priceLuong;
  final ShopItemType type;
  final String description;
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
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mobiarmy_flutter/features/authentication/application/auth_controller.dart';
import 'package:mobiarmy_flutter/features/gameplay/application/chat_controller.dart';
import 'package:mobiarmy_flutter/features/gameplay/application/gameplay_controller.dart';
import 'package:mobiarmy_flutter/features/gameplay/game/army_game.dart';
import 'package:mobiarmy_flutter/features/gameplay/presentation/widgets/aim_controls.dart';
import 'package:mobiarmy_flutter/features/gameplay/presentation/widgets/movement_controls.dart';
import 'package:mobiarmy_flutter/features/gameplay/presentation/widgets/power_bar.dart';
import 'package:mobiarmy_flutter/features/gameplay/presentation/widgets/wind_indicator.dart';
import 'package:mobiarmy_flutter/shared/overlays/match_result_overlay.dart';

class GameplayHud extends ConsumerWidget {
  const GameplayHud({super.key, required this.game});

  final ArmyGame game;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final gameplayState = ref.watch(gameplayControllerProvider);
    final isOffline = gameplayState == null;

    final chatMessages = ref.watch(chatControllerProvider);
    final myId = ref.watch(authControllerProvider).session?.id;

    final isMyTurn = isOffline || (gameplayState.currentTurnPlayerId != null && gameplayState.currentTurnPlayerId == myId);
    final windX = gameplayState?.windX ?? 0;
    final windY = gameplayState?.windY ?? 0;
    final turnTime = gameplayState?.turnTimeSeconds ?? 0;
    final matchResult = gameplayState?.matchResult;

    return ListenableBuilder(
      listenable: game.inputController,
      builder: (context, _) {
        return Stack(
          children: [
            if (isMyTurn && matchResult == null)
              Positioned(
                left: 10,
                bottom: 10,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    MovementControls(game: game),
                    const SizedBox(height: 4),
                    _AngleDisplay(game: game),
                  ],
                ),
              ),
            if (isMyTurn && matchResult == null)
              Positioned(
                right: 10,
                bottom: 10,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    _SkipButton(game: game, isOffline: isOffline),
                    const SizedBox(height: 8),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        AimControls(game: game),
                        const SizedBox(width: 8),
                        _FireButton(game: game, isOffline: isOffline),
                      ],
                    ),
                  ],
                ),
              ),
            Positioned(
              left: 0,
              right: 0,
              bottom: 5,
              child: Center(
                child: SizedBox(
                  width: 180,
                  height: 12,
                  child: PowerBar(
                    power: game.inputController.state.force * (100 / 30),
                  ),
                ),
              ),
            ),
            if (matchResult == null)
              Positioned(
                top: 10,
                left: 0,
                right: 0,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    WindIndicator(windX: windX, windY: windY),
                    const SizedBox(height: 4),
                    _TurnTimer(seconds: turnTime),
                  ],
                ),
              ),
            if (matchResult != null)
              MatchResultOverlay(
                game: game,
                result: matchResult,
                onClose: () {
                  // Navigation back to lobby via state change
                  ref.read(gameplayControllerProvider.notifier).leaveMatch();
                },
              ),
            Positioned(
              left: 20,
              top: 60,
              child: SizedBox(
                width: 250,
                height: 150,
                child: ListView.builder(
                  itemCount: chatMessages.length,
                  itemBuilder: (context, index) {
                    final msg = chatMessages[index];
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 2),
                      child: Text(
                        '${msg.sender}: ${msg.text}',
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                          shadows: [Shadow(blurRadius: 2, color: Colors.black)],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}

class _TurnTimer extends StatelessWidget {
  const _TurnTimer({required this.seconds});
  final int seconds;

  @override
  Widget build(BuildContext context) {
    final color = seconds <= 5 ? Colors.red : Colors.white;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 2),
      decoration: BoxDecoration(
        color: Colors.black38,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Text(
        '$seconds',
        style: TextStyle(
          color: color,
          fontSize: 24,
          fontWeight: FontWeight.bold,
          shadows: const [Shadow(blurRadius: 4, color: Colors.black)],
        ),
      ),
    );
  }
}

class _FireButton extends ConsumerWidget {
  const _FireButton({required this.game, this.isOffline = false});
  final ArmyGame game;
  final bool isOffline;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return GestureDetector(
      onTapDown: (_) => game.inputController.startCharging(),
      onTapUp: (_) {
        final force = game.inputController.stopCharging();
        if (isOffline) {
          game.fire(force);
        } else {
          final angle = game.inputController.state.angle;
          ref.read(gameplayControllerProvider.notifier).shoot(
                angle,
                force.round(),
                0, // force2
                1, // nShot
              );
        }
      },
      onTapCancel: () => game.inputController.stopCharging(),
      child: Container(
        width: 60,
        height: 60,
        decoration: BoxDecoration(
          color: Colors.red.withValues(alpha: 0.7),
          shape: BoxShape.circle,
          border: Border.all(color: Colors.white, width: 2),
          boxShadow: const [
            BoxShadow(color: Colors.black26, blurRadius: 5, spreadRadius: 1),
          ],
        ),
        child: const Center(
          child: Text(
            'FIRE',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 14,
            ),
          ),
        ),
      ),
    );
  }
}

class _SkipButton extends ConsumerWidget {
  const _SkipButton({required this.game, this.isOffline = false});
  final ArmyGame game;
  final bool isOffline;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return GestureDetector(
      onTap: () {
        if (!isOffline) {
          ref.read(gameplayControllerProvider.notifier).skipTurn();
        }
      },
      child: Container(
        width: 45,
        height: 45,
        decoration: BoxDecoration(
          color: Colors.orange.withValues(alpha: 0.7),
          shape: BoxShape.circle,
          border: Border.all(color: Colors.white, width: 1.5),
          boxShadow: const [
            BoxShadow(color: Colors.black26, blurRadius: 4, spreadRadius: 1),
          ],
        ),
        child: const Center(
          child: Text(
            'SKIP',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 10,
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
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
      decoration: BoxDecoration(
        color: Colors.black54,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Text(
        'Góc: ${game.inputController.state.angle}°',
        style: const TextStyle(
          color: Colors.white,
          fontSize: 12,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
```

### `D:\personal\army/lib\shared\overlays\match_result_overlay.dart`
```dart
import 'package:flutter/material.dart';
import 'package:mobiarmy_flutter/features/gameplay/data/gameplay_packet_mapper.dart';
import 'package:mobiarmy_flutter/features/gameplay/game/army_game.dart';

class MatchResultOverlay extends StatelessWidget {
  const MatchResultOverlay({
    super.key,
    required this.game,
    required this.result,
    required this.onClose,
  });

  final ArmyGame game;
  final MatchResult result;
  final VoidCallback onClose;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 400,
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.black87,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: Colors.amber, width: 2),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text(
              'MATCH FINISHED',
              style: TextStyle(
                color: Colors.amber,
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
            Flexible(
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: result.playerResults.length,
                itemBuilder: (context, index) {
                  final pr = result.playerResults[index];
                  final playerName = game.players[pr.playerId]?.name ?? 'Player ${pr.playerId}';
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 4),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          playerName,
                          style: const TextStyle(color: Colors.white, fontSize: 16),
                        ),
                        Text(
                          'Exp: +${pr.exp}  Xu: +${pr.xu}',
                          style: const TextStyle(color: Colors.greenAccent, fontSize: 14),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: onClose,
              style: ElevatedButton.styleFrom(backgroundColor: Colors.amber),
              child: const Text(
                'BACK TO LOBBY',
                style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
              ),
            ),
          ],
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

