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
│   │   ├── game_asset_bundle.dart
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
│       │   └── tcp_session.dart
│       ├── connection_lifecycle.dart
│       └── network_provider.dart
├── features
│   ├── authentication
│   │   └── data
│   │       └── auth_repository.dart
│   └── gameplay
│       ├── application
│       │   ├── gameplay_handler.dart
│       │   └── gameplay_provider.dart
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
│       │   └── player
│       │       └── player_movement_state.dart
│       ├── game
│       │   ├── input
│       │   │   ├── gameplay_input_controller.dart
│       │   │   └── gameplay_input_state.dart
│       │   ├── map
│       │   │   ├── background_component.dart
│       │   │   ├── destructible_terrain.dart
│       │   │   ├── game_map_definition.dart
│       │   │   ├── legacy_map_parser.dart
│       │   │   ├── map_component.dart
│       │   │   ├── map_debug_overlay.dart
│       │   │   ├── map_repository.dart
│       │   │   └── map_world_controller.dart
│       │   ├── player
│       │   │   ├── character_animation_controller.dart
│       │   │   ├── character_component.dart
│       │   │   ├── character_sprite_resolver.dart
│       │   │   └── equipment_layer_component.dart
│       │   ├── projectile
│       │   │   ├── bullet_simulator.dart
│       │   │   ├── projectile_component.dart
│       │   │   ├── projectile_trajectory.dart
│       │   │   └── trajectory_simulator.dart
│       │   ├── systems
│       │   │   ├── camera_system.dart
│       │   │   ├── combat_system.dart
│       │   │   ├── ground_probe.dart
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
│           └── gameplay_sandbox_screen.dart
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
  flutter_riverpod: ^3.4.3
  go_router: ^18.0.1
  collection: ^1.19.1
  logging: ^1.3.0

dev_dependencies:
  flutter_test:
    sdk: flutter
  flutter_lints: ^6.0.0

flutter:
  uses-material-design: true
  assets:
    - assets/manifests/
    - assets/sprites/
    - assets/maps/
    - assets/audio/
    - assets/fonts/
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

Future<void> bootstrap({bool debug = false}) async {
  WidgetsFlutterBinding.ensureInitialized();
  configureLogging(debug: debug);
  await SystemChrome.setPreferredOrientations(const [
    DeviceOrientation.landscapeLeft,
    DeviceOrientation.landscapeRight,
  ]);
  await SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);

  FlutterError.onError = (details) {
    FlutterError.presentError(details);
    Logger('FlutterError').severe(details.exceptionAsString(), details.exception, details.stack);
  };
  PlatformDispatcher.instance.onError = (error, stack) {
    Logger('PlatformDispatcher').severe('Uncaught platform error', error, stack);
    return true;
  };

  runZonedGuarded(
    () => runApp(const ProviderScope(child: AppErrorBoundary(child: ArmyApp()))),
    (error, stack) => Logger('Zone').severe('Uncaught zone error', error, stack),
  );
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
import 'package:mobiarmy_flutter/features/gameplay/presentation/gameplay_sandbox_screen.dart';
import 'package:mobiarmy_flutter/shared/widgets/placeholder_screen.dart';

final appRouterProvider = Provider<GoRouter>((ref) {
  final router = GoRouter(
    initialLocation: AppRoute.bootstrap.path,
    refreshListenable: _RouterRefresh(ref),
    redirect: (context, state) {
      final nav = ref.read(navigationControllerProvider);
      final location = state.matchedLocation;
      if (!nav.bootstrapped && location != AppRoute.bootstrap.path) return AppRoute.bootstrap.path;
      if (nav.bootstrapped && location == AppRoute.bootstrap.path) return AppRoute.serverSelection.path;
      if (!nav.authenticated && {AppRoute.lobby.path, AppRoute.room.path}.contains(location)) return AppRoute.login.path;
      return null;
    },
    errorBuilder: (context, state) => PlaceholderScreen(title: 'Navigation error', message: state.error.toString()),
    routes: [
      GoRoute(path: AppRoute.bootstrap.path, builder: (_, __) => const BootstrapScreen()),
      GoRoute(path: AppRoute.serverSelection.path, builder: (_, __) => const PlaceholderScreen(title: 'Server selection')),
      GoRoute(path: AppRoute.login.path, builder: (_, __) => const PlaceholderScreen(title: 'Login')),
      GoRoute(path: AppRoute.lobby.path, builder: (_, __) => const PlaceholderScreen(title: 'Lobby')),
      GoRoute(path: AppRoute.room.path, builder: (_, __) => const PlaceholderScreen(title: 'Room')),
      GoRoute(path: AppRoute.gameplaySandbox.path, builder: (_, __) => const GameplaySandboxScreen()),
    ],
  );
  ref.onDispose(router.dispose);
  return router;
});

class _RouterRefresh extends ChangeNotifier {
  _RouterRefresh(this.ref) { ref.listen(navigationControllerProvider, (_, __) => notifyListeners()); }
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
    Future<void>.microtask(() => ref.read(navigationControllerProvider.notifier).completeBootstrap());
  }
  @override
  Widget build(BuildContext context) => const Scaffold(body: Center(child: CircularProgressIndicator()));
}
```

### `D:\personal\army/lib\app\router\navigation_state.dart`
```dart
import 'package:flutter_riverpod/flutter_riverpod.dart';

class NavigationState {
  const NavigationState({required this.bootstrapped, required this.authenticated});
  const NavigationState.initial() : bootstrapped = false, authenticated = false;
  final bool bootstrapped;
  final bool authenticated;

  NavigationState copyWith({bool? bootstrapped, bool? authenticated}) => NavigationState(
    bootstrapped: bootstrapped ?? this.bootstrapped,
    authenticated: authenticated ?? this.authenticated,
  );
}

class NavigationController extends Notifier<NavigationState> {
  @override
  NavigationState build() => const NavigationState.initial();
  void completeBootstrap() => state = state.copyWith(bootstrapped: true);
  void setAuthenticated(bool value) => state = state.copyWith(authenticated: value);
}

final navigationControllerProvider = NotifierProvider<NavigationController, NavigationState>(NavigationController.new);
```

### `D:\personal\army/lib\core\assets\asset_manifest.dart`
```dart
import 'dart:convert';

class AssetManifestFormatException implements FormatException {
  const AssetManifestFormatException(this.message, [this.source, this.offset]);
  @override final String message;
  @override final dynamic source;
  @override final int? offset;
}

enum GameAssetKind { image, tile, map, font, audio }

class GameAssetEntry {
  const GameAssetEntry({required this.id, required this.kind, required this.path, required this.available});
  final String id; final GameAssetKind kind; final String path; final bool available;
}
class AtlasFrame {
  const AtlasFrame({required this.name, required this.x, required this.y, required this.width, required this.height});
  final String name; final int x,y,width,height;
}
class AtlasDefinition {
  const AtlasDefinition({required this.id, required this.imagePath, required this.width, required this.height, required this.frames});
  final String id,imagePath; final int width,height; final List<AtlasFrame> frames;
}
class GameAssetManifest {
  const GameAssetManifest({required this.assets, required this.atlases});
  final Map<String,GameAssetEntry> assets; final Map<String,AtlasDefinition> atlases;

  factory GameAssetManifest.fromJsonString(String source) {
    final value=jsonDecode(source);
    if (value is! Map<String,dynamic> || value['schemaVersion'] != 1) throw const AssetManifestFormatException('Unsupported asset manifest schema');
    final assets=<String,GameAssetEntry>{};
    for (final raw in (value['assets'] as List<dynamic>? ?? const [])) {
      final m=raw as Map<String,dynamic>; final id=m['id'] as String;
      if (assets.containsKey(id)) throw AssetManifestFormatException('Duplicate asset id: $id');
      assets[id]=GameAssetEntry(id:id,kind:GameAssetKind.values.byName(m['kind'] as String),path:m['path'] as String,available:m['available'] as bool? ?? true);
    }
    final atlases=<String,AtlasDefinition>{};
    for (final raw in (value['atlases'] as List<dynamic>? ?? const [])) {
      final m=raw as Map<String,dynamic>; final id=m['id'] as String;
      if (atlases.containsKey(id)) throw AssetManifestFormatException('Duplicate atlas id: $id');
      final width=m['width'] as int,height=m['height'] as int; final names=<String>{}; final frames=<AtlasFrame>[];
      for(final frameRaw in m['frames'] as List<dynamic>) {
        final f=frameRaw as Map<String,dynamic>; final name=f['name'] as String;
        if(!names.add(name)) throw AssetManifestFormatException('Duplicate frame: $id/$name');
        final frame=AtlasFrame(name:name,x:f['x'] as int,y:f['y'] as int,width:f['width'] as int,height:f['height'] as int);
        if(frame.x<0||frame.y<0||frame.width<=0||frame.height<=0||frame.x+frame.width>width||frame.y+frame.height>height) throw AssetManifestFormatException('Atlas frame out of bounds: $id/$name');
        frames.add(frame);
      }
      atlases[id]=AtlasDefinition(id:id,imagePath:m['imagePath'] as String,width:width,height:height,frames:List.unmodifiable(frames));
    }
    return GameAssetManifest(assets:Map.unmodifiable(assets),atlases:Map.unmodifiable(atlases));
  }
}
```

### `D:\personal\army/lib\core\assets\asset_scope.dart`
```dart
class AssetScope {
  AssetScope({required this.name}); final String name;
  final Map<String,int> _references={}; final Map<String,void Function()> _disposers={}; bool _disposed=false;
  int referenceCount(String id)=>_references[id]??0;
  void retain(String id,void Function() dispose){if(_disposed)throw StateError('AssetScope disposed');_references[id]=referenceCount(id)+1;_disposers[id]=dispose;}
  void release(String id){final count=referenceCount(id);if(count<=1){_references.remove(id);_disposers.remove(id)?.call();}else{_references[id]=count-1;}}
  void dispose(){if(_disposed)return;_disposed=true;for(final dispose in _disposers.values){dispose();}_disposers.clear();_references.clear();}
}
```

### `D:\personal\army/lib\core\assets\game_asset_bundle.dart`
```dart
import 'package:flutter/services.dart';
import 'package:mobiarmy_flutter/core/assets/asset_manifest.dart';

class MissingGameAssetException implements Exception {
  const MissingGameAssetException(this.assetId); final String assetId;
  @override String toString()=> 'MissingGameAssetException: $assetId';
}
class GameAssetBundle {
  GameAssetBundle(this.bundle); final AssetBundle bundle;
  Future<GameAssetManifest> loadManifest(String path) async => GameAssetManifest.fromJsonString(await bundle.loadString(path));
  Future<ByteData> loadAvailable(GameAssetEntry entry) {
    if(!entry.available) throw MissingGameAssetException(entry.id);
    return bundle.load(entry.path);
  }
}
```

### `D:\personal\army/lib\core\assets\map_asset_repository.dart`
```dart
import 'package:mobiarmy_flutter/core/assets/asset_manifest.dart';
class MapAssetRepository {
  MapAssetRepository(this.manifest); final GameAssetManifest manifest;
  GameAssetEntry definition(String id){final entry=manifest.assets[id];if(entry==null||entry.kind!=GameAssetKind.map)throw StateError('Unknown map asset: $id');return entry;}
}
```

### `D:\personal\army/lib\core\assets\sprite_atlas_repository.dart`
```dart
import 'dart:ui';
import 'package:flame/components.dart';
import 'package:flame/sprite.dart';
import 'package:mobiarmy_flutter/core/assets/asset_manifest.dart';

class SpriteAtlasRepository {
  SpriteAtlasRepository(this.manifest);
  final GameAssetManifest manifest;
  final Map<String,Image> _images={};
  Sprite frame(String atlasId,String frameName) {
    final atlas=manifest.atlases[atlasId]; if(atlas==null) throw StateError('Unknown atlas: $atlasId');
    final image=_images[atlasId]; if(image==null) throw StateError('Atlas not loaded: $atlasId');
    AtlasFrame? frame; for(final candidate in atlas.frames){if(candidate.name==frameName){frame=candidate;break;}}
    if(frame==null) throw StateError('Unknown frame: $atlasId/$frameName');
    return Sprite(image,srcPosition:Vector2(frame.x.toDouble(),frame.y.toDouble()),srcSize:Vector2(frame.width.toDouble(),frame.height.toDouble()));
  }
  void registerImage(String atlasId,Image image)=>_images[atlasId]=image;
  void unload(String atlasId)=>_images.remove(atlasId)?.dispose();
  void dispose(){for(final image in _images.values){image.dispose();}_images.clear();}
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
      child: Center(child: Text('Unexpected UI error
${details.exceptionAsString()}', textAlign: TextAlign.center)),
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
    if (divisor == 0) throw IntegerDivisionByZeroException();
    if (dividend == minValue && divisor == -1) return minValue;
    return dividend ~/ divisor;
  }
  static int remainder(int dividend, int divisor) => dividend - divide(dividend, divisor) * divisor;
}

class LegacyFixedPoint {
  const LegacyFixedPoint._();
  static const int trigonometryShift = 10;
  static const int one = 1 << trigonometryShift;
  static int multiplyQ10(int a, int b) => JavaInt32.wrap(JavaInt32.multiply(a, b) >> trigonometryShift);
  static int divideQ10(int numerator, int denominator) => JavaInt32.divide(JavaInt32.shiftLeft(numerator, trigonometryShift), denominator);
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

  static bool pointInRect(int x, int y, int left, int top, int width, int height) =>
      x >= left && x < left + width && y >= top && y < top + height;

  static bool rectanglesHit(int x, int y, int width, int height, int targetX, int targetY, int targetWidth, int targetHeight) =>
      x + width >= targetX && x <= targetX + targetWidth && y + height >= targetY && y <= targetY + targetHeight;

  static int integerSqrt(int value) {
    if (value <= 0) return 0;
    var x = JavaInt32.divide(JavaInt32.add(value, 1), 2);
    int previous;
    do {
      previous = x;
      x = JavaInt32.add(JavaInt32.divide(x, 2), JavaInt32.divide(value, JavaInt32.multiply(2, x)));
    } while ((previous - x).abs() > 1);
    return x;
  }

  static int distance(int x1, int y1, int x2, int y2) {
    final dx = JavaInt32.subtract(x1, x2);
    final dy = JavaInt32.subtract(y1, y2);
    final squared = JavaInt32.add(JavaInt32.multiply(dx, dx), JavaInt32.multiply(dy, dy));
    return integerSqrt(squared);
  }
}
```

### `D:\personal\army/lib\core\legacy_math\legacy_interpolation.dart`
```dart
abstract final class LegacyInterpolation {
  static double lerp(double start, double end, double time) => start + time * (end - start);
  static double clamp01(double value) => value < 0 ? 0 : (value > 1 ? 1 : value);
  static int clampInt(int value, int min, int max) => value < min ? min : (value > max ? max : value);
}
```

### `D:\personal\army/lib\core\legacy_math\legacy_position.dart`
```dart
class LegacyPosition {
  const LegacyPosition.xy(this.x, this.y) : xFrom = 0, yFrom = 0, xTo = 0, yTo = 0, frame = 0;
  const LegacyPosition.xyFrame(this.x, this.y, this.frame) : xFrom = 0, yFrom = 0, xTo = 0, yTo = 0;
  const LegacyPosition.transition(this.xFrom, this.yFrom, this.xTo, this.yTo) : x = 0, y = 0, frame = 0;
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

  int between(int minInclusive, int maxExclusive) => minInclusive + _random.nextInt(maxExclusive - minInclusive);

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

  static const List<int> _sinTable = <int>[0, 18, 36, 54, 71, 89, 107, 125, 143, 160, 178, 195, 213, 230, 248, 265, 282, 299, 316, 333, 350, 367, 384, 400, 416, 433, 449, 465, 481, 496, 512, 527, 543, 558, 573, 587, 602, 616, 630, 644, 658, 672, 685, 698, 711, 724, 737, 749, 761, 773, 784, 796, 807, 818, 828, 839, 849, 859, 868, 878, 887, 896, 904, 912, 920, 928, 935, 943, 949, 956, 962, 968, 974, 979, 984, 989, 994, 998, 1002, 1005, 1008, 1011, 1014, 1016, 1018, 1020, 1022, 1023, 1023, 1024, 1024];
  static final List<int> _cosTable = List<int>.generate(91, (i) => _sinTable[90 - i], growable: false);
  static final List<int> _tanTable = List<int>.generate(91, (i) {
    final cosine = _cosTable[i];
    return cosine == 0 ? JavaInt32.maxValue : JavaInt32.divide(JavaInt32.shiftLeft(_sinTable[i], 10), cosine);
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
    for (var i = 0; i <= 90; i++) { if (_tanTable[i] >= tangent) return i; }
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
  @override void onBackground() {}
  @override void onForeground() {}
  @override Future<void> dispose() async {}
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
import 'dispatcher/message_dispatcher.dart';
import 'transport/tcp_session.dart';

final messageDispatcherProvider = Provider<MessageDispatcher>((ref) {
  return MessageDispatcher();
});

final tcpSessionProvider = Provider<TcpSession>((ref) {
  final dispatcher = ref.watch(messageDispatcherProvider);
  return TcpSession(dispatcher);
});

final connectionStateProvider = StateProvider<bool>((ref) {
  return false;
});
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
    if (_data != null) return _data!;
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
  XorCodec(List<int> rawKey) : _key = Uint8List.fromList(rawKey), _readPos = 0, _writePos = 0;

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

### `D:\personal\army/lib\core\network\transport\tcp_session.dart`
```dart
import 'dart:async';
import 'dart:io';
import 'dart:typed_data';
import 'package:logging/logging.dart';

import '../codec/byte_reader.dart';
import '../codec/byte_writer.dart';
import '../command/commands.dart';
import '../protocol/message.dart';
import '../security/xor_codec.dart';
import '../dispatcher/message_dispatcher.dart';

class TcpSession {
  TcpSession(this.dispatcher);

  final MessageDispatcher dispatcher;
  final _logger = Logger('TcpSession');
  
  Socket? _socket;
  XorCodec? _codec;
  bool _getKeyComplete = false;
  
  final BytesBuilder _buffer = BytesBuilder();

  Future<void> connect(String host, int port) async {
    _logger.info('Connecting to $host:$port');
    try {
      _socket = await Socket.connect(host, port, timeout: const Duration(seconds: 20));
      _getKeyComplete = false;
      _codec = null;
      _buffer.clear();

      _socket!.listen(
        _onData,
        onError: (e) => _logger.severe('Socket error: $e'),
        onDone: () => _logger.info('Socket closed'),
        cancelOnError: true,
      );

      // Request key
      await sendMessage(Message(Commands.getKey));
    } catch (e) {
      _logger.severe('Failed to connect: $e');
      rethrow;
    }
  }

  Future<void> sendMessage(Message message) async {
    if (_socket == null) return;

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

    _socket!.add(writer.toBytes());
    await _socket!.flush();
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
        // Convert back to signed byte
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
          int b1 = reader.readUnsignedByte();
          int b2 = reader.readUnsignedByte();
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

        Uint8List payload = reader.readBytes(size);
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
    } else {
      dispatcher.dispatch(message);
    }
  }

  Future<void> dispose() async {
    await _socket?.close();
    _socket = null;
  }
}
```

### `D:\personal\army/lib\features\authentication\data\auth_repository.dart`
```dart
import 'package:mobiarmy_flutter/core/network/command/commands.dart';
import 'package:mobiarmy_flutter/core/network/protocol/message.dart';
import 'package:mobiarmy_flutter/core/network/transport/tcp_session.dart';

class AuthRepository {
  AuthRepository(this._session);
  final TcpSession _session;

  Future<void> login(String username, String password, String version) async {
    final message = Message(Commands.login);
    message.writer().writeUTF(username);
    message.writer().writeUTF(password);
    message.writer().writeUTF(version);
    await _session.sendMessage(message);
  }
}
```

### `D:\personal\army/lib\features\gameplay\application\gameplay_handler.dart`
```dart
import 'package:logging/logging.dart';
import 'package:mobiarmy_flutter/core/network/command/commands.dart';
import 'package:mobiarmy_flutter/core/network/dispatcher/message_dispatcher.dart';
import 'package:mobiarmy_flutter/core/network/protocol/message.dart';
import '../game/projectile/projectile_trajectory.dart';
import '../game/army_game.dart';

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
    final isPow = reader.readByte();
    final playerIndex = reader.readByte();
    final bulletId = reader.readByte();
    final gunX = reader.readShort();
    final gunY = reader.readShort();
    final angle = reader.readShort();

    // ... handle special bullets ...

    final nShoot = reader.readByte();
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
      allTrajectories.add(ProjectileTrajectory(bulletId: bulletId, frames: frames));
    }

    _logger.info('Received shoot message for player $playerIndex, $numBullets bullets');
    
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

### `D:\personal\army/lib\features\gameplay\data\character\equipment_manifest_parser.dart`
```dart
import 'dart:convert';
import 'package:mobiarmy_flutter/features/gameplay/domain/character/equipment_definition.dart';

class EquipmentManifestParser {
  const EquipmentManifestParser();
  List<EquipmentDefinition> parse(String source) {
    final value = jsonDecode(source);
    if (value is! Map<String, dynamic> || value['schemaVersion'] != 1) throw const FormatException('Unsupported equipment manifest schema');
    final ids = <String>{};
    return (value['equipment'] as List<dynamic>).map((raw) {
      final map = raw as Map<String, dynamic>;
      final id = map['id'] as int;
      final glassId = map['glassId'] as int;
      final key = '$glassId/${map['slot']}/$id';
      if (!ids.add(key)) throw FormatException('Duplicate equipment: $key');
      final frames = (map['frames'] as List<dynamic>).map((frameRaw) {
        final frame = frameRaw as Map<String, dynamic>;
        final geometry = EquipmentFrameGeometry(sourceX: frame['x'] as int, sourceY: frame['y'] as int, width: frame['w'] as int, height: frame['h'] as int, offsetX: frame['dx'] as int, offsetY: frame['dy'] as int);
        if (geometry.width <= 0 || geometry.height <= 0) throw FormatException('Invalid frame size: $key');
        return geometry;
      }).toList(growable: false);
      return EquipmentDefinition(id: id, slot: EquipmentSlot.values.byName(map['slot'] as String), glassId: glassId, atlasId: map['atlasId'] as String, frames: frames, bulletId: map['bulletId'] as int? ?? -1);
    }).toList(growable: false);
  }
}
```

### `D:\personal\army/lib\features\gameplay\domain\camera\camera_mode.dart`
```dart
enum CameraMode {
  playerFollow,
  bulletFollow,
  freePan,
  focusTarget,
}
```

### `D:\personal\army/lib\features\gameplay\domain\character\character_animation_state.dart`
```dart
import 'package:mobiarmy_flutter/features/gameplay/domain/character/character_definition.dart';

class CharacterAnimationState {
  const CharacterAnimationState({this.kind = CharacterAnimationKind.idle, this.frame = 0, this.elapsed = 0, this.facing = CharacterFacing.right});
  final CharacterAnimationKind kind;
  final int frame;
  final double elapsed;
  final CharacterFacing facing;
  CharacterAnimationState copyWith({CharacterAnimationKind? kind, int? frame, double? elapsed, CharacterFacing? facing}) => CharacterAnimationState(kind: kind ?? this.kind, frame: frame ?? this.frame, elapsed: elapsed ?? this.elapsed, facing: facing ?? this.facing);
}
```

### `D:\personal\army/lib\features\gameplay\domain\character\character_appearance.dart`
```dart
import 'package:mobiarmy_flutter/features/gameplay/domain/character/equipment_definition.dart';

class CharacterAppearance {
  CharacterAppearance({required this.characterType, required Map<EquipmentSlot, int> equipmentIds}) : equipmentIds = Map.unmodifiable(equipmentIds);
  final int characterType;
  final Map<EquipmentSlot, int> equipmentIds;
  int? operator [](EquipmentSlot slot) => equipmentIds[slot];
  CharacterAppearance equip(EquipmentSlot slot, int? id) {
    final next = Map<EquipmentSlot, int>.of(equipmentIds);
    id == null ? next.remove(slot) : next[slot] = id;
    return CharacterAppearance(characterType: characterType, equipmentIds: next);
  }
}
```

### `D:\personal\army/lib\features\gameplay\domain\character\character_definition.dart`
```dart
enum CharacterFacing { right, left }
enum CharacterAnimationKind { idle, walk, aim, fire, hurt, death }

class CharacterDefinition {
  const CharacterDefinition({required this.characterType, required this.bodyAtlasId, required this.frameCount, required this.anchorX, required this.anchorY});
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
  const EquipmentFrameGeometry({required this.sourceX, required this.sourceY, required this.width, required this.height, required this.offsetX, required this.offsetY});
  final int sourceX, sourceY, width, height, offsetX, offsetY;
}

class EquipmentDefinition {
  EquipmentDefinition({required this.id, required this.slot, required this.glassId, required this.atlasId, required List<EquipmentFrameGeometry> frames, this.bulletId = -1}) : frames = List.unmodifiable(frames) {
    if (frames.isEmpty) throw ArgumentError.value(frames, 'frames', 'must not be empty');
  }
  final int id;
  final EquipmentSlot slot;
  final int glassId;
  final String atlasId;
  final List<EquipmentFrameGeometry> frames;
  final int bulletId;

  EquipmentFrameGeometry frame(int index) => frames[index.clamp(0, frames.length - 1).toInt()];
}
```

### `D:\personal\army/lib\features\gameplay\domain\player\player_movement_state.dart`
```dart
import 'package:flame/extensions.dart';

enum PlayerMovementKind {
  idle,
  walking,
  falling,
  dead,
}

class PlayerMovementState {
  const PlayerMovementState({
    this.kind = PlayerMovementKind.idle,
    this.velocity = Vector2.zero,
    this.isOnGround = false,
    this.stamina = 100.0,
  });

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

### `D:\personal\army/lib\features\gameplay\game\army_game.dart`
```dart
import 'package:flame/components.dart';
import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'projectile/projectile_component.dart';
import 'projectile/projectile_trajectory.dart';
import 'map/map_component.dart';
import 'map/destructible_terrain.dart';
import 'input/gameplay_input_controller.dart';
import 'systems/camera_system.dart';
import 'systems/player_movement_system.dart';
import 'systems/player_collision_system.dart';
import 'player/character_component.dart';

class ArmyGame extends FlameGame {
  ArmyGame({this.onLoaded});
  final VoidCallback? onLoaded;
  
  late final GameplayInputController inputController;
  late final World gameWorld;
  DestructibleTerrain? terrain;
  
  late final CameraSystem cameraSystem;
  
  final Map<int, CharacterComponent> players = {};

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
    
    // Camera settings
    camera.viewport = FixedResolutionViewport(resolution: Vector2(480, 320));
    camera.viewfinder.anchor = Anchor.center;

    onLoaded?.call();
  }

  void spawnProjectile(ProjectileTrajectory trajectory) {
    gameWorld.add(ProjectileComponent(trajectory: trajectory));
  }

  void pauseSafely() { if (!paused) pauseEngine(); }
  void resumeSafely() { if (paused) resumeEngine(); }
}
```

### `D:\personal\army/lib\features\gameplay\game\input\gameplay_input_controller.dart`
```dart
import 'package:flutter/foundation.dart';
import 'package:flame/components.dart';
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
class BackgroundComponent extends PositionComponent { BackgroundComponent({required this.environment,required Vector2 mapSize}):super(size:mapSize,priority:-100); final MapEnvironmentDefinition environment;
 @override void render(Canvas canvas){canvas.drawRect(Rect.fromLTWH(0,0,size.x,size.y),Paint()..color=const Color(0xff0f2742));if(environment.hasWaterOrGlass){canvas.drawRect(Rect.fromLTWH(0,environment.waterY.toDouble(),size.x,(size.y-environment.waterY).clamp(0.0,size.y).toDouble()),Paint()..color=const Color(0x6638bdf8));}} }
```

### `D:\personal\army/lib\features\gameplay\game\map\destructible_terrain.dart`
```dart
import 'dart:typed_data';
import 'dart:ui' as ui;

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
  @override final String message; @override final dynamic source; @override final int? offset;
}
class SpawnPoint { const SpawnPoint({required this.x,required this.y,this.team}); final int x,y; final int? team; }
class MapBrickDefinition { const MapBrickDefinition({required this.tileId,required this.x,required this.y,required this.destructible}); final int tileId,x,y; final bool destructible; }
class MapLayerDefinition { const MapLayerDefinition({required this.id,required this.bricks}); final String id; final List<MapBrickDefinition> bricks; }
class TileSetDefinition { const TileSetDefinition({required this.id,required this.tileCount}); final int id,tileCount; }
class MapEnvironmentDefinition {
 const MapEnvironmentDefinition({required this.backgroundId,required this.backgroundY,required this.cloudY,required this.waterY,required this.waterClass});
 final int backgroundId,backgroundY,cloudY,waterY,waterClass;
 bool get hasWaterOrGlass=>waterClass!=-1;
}
class GameMapDefinition {
 GameMapDefinition({required this.id,required this.width,required this.height,required List<MapLayerDefinition> layers,required List<SpawnPoint> spawnPoints,required this.environment}) : layers=UnmodifiableListView(layers),spawnPoints=UnmodifiableListView(spawnPoints);
 final int id,width,height; final List<MapLayerDefinition> layers; final List<SpawnPoint> spawnPoints; final MapEnvironmentDefinition environment;
}
```

### `D:\personal\army/lib\features\gameplay\game\map\legacy_map_parser.dart`
```dart
import 'dart:typed_data';
import 'package:mobiarmy_flutter/features/gameplay/game/map/game_map_definition.dart';

class LegacyMapParser {
 const LegacyMapParser({this.isUndestroyableTile=neverUndestroyable});
 final bool Function(int tileId) isUndestroyableTile;
 static bool neverUndestroyable(int _) => false;

 GameMapDefinition parse({required int mapId,required Uint8List data,required List<int> environmentValues,List<SpawnPoint> spawnPoints=const []}) {
  if(environmentValues.length<5) throw const MapFormatException('Map environment requires 5 values');
  if(data.length<5) throw const MapFormatException('Map payload too short');
  final reader=_Reader(data); final width=reader.u16(); final height=reader.u16(); final count=reader.u8();
  final requiredLength=5+count*5; if(data.length<requiredLength) throw MapFormatException('Truncated brick list',data,data.length);
  final bricks=<MapBrickDefinition>[];
  for(var i=0;i<count;i++) { final tileId=reader.u8(); final x=reader.i16(); final y=reader.i16(); bricks.add(MapBrickDefinition(tileId:tileId,x:x,y:y,destructible:!isUndestroyableTile(tileId))); }
  if(reader.offset!=data.length) throw MapFormatException('Unexpected trailing map bytes',data,reader.offset);
  return GameMapDefinition(id:mapId,width:width,height:height,layers:[MapLayerDefinition(id:'terrain',bricks:List.unmodifiable(bricks))],spawnPoints:spawnPoints,environment:MapEnvironmentDefinition(backgroundId:environmentValues[0],backgroundY:environmentValues[1],cloudY:environmentValues[2],waterY:environmentValues[3],waterClass:environmentValues[4]));
 }
}
class _Reader { _Reader(this.data); final Uint8List data; int offset=0; int u8()=>data[offset++]; int u16(){final v=(data[offset]<<8)|data[offset+1];offset+=2;return v;} int i16(){final v=u16();return v>=0x8000?v-0x10000:v;} }
```

### `D:\personal\army/lib\features\gameplay\game\map\map_component.dart`
```dart
import 'dart:ui';
import 'package:flame/components.dart';
import 'package:mobiarmy_flutter/features/gameplay/game/map/game_map_definition.dart';
class MapComponent extends PositionComponent {
 MapComponent({required this.definition,required this.tileSize,this.debug=false}) : super(size:Vector2(definition.width.toDouble(),definition.height.toDouble()));
 final GameMapDefinition definition; final Vector2 tileSize; final bool debug; final Paint _fallback=Paint()..color=const Color(0xff64748b);
 @override void render(Canvas canvas){super.render(canvas);for(final layer in definition.layers){for(final brick in layer.bricks){canvas.drawRect(Rect.fromLTWH(brick.x.toDouble(),brick.y.toDouble(),tileSize.x,tileSize.y),_fallback);}}if(debug){final p=Paint()..color=const Color(0xffff00ff)..style=PaintingStyle.stroke;canvas.drawRect(Rect.fromLTWH(0,0,size.x,size.y),p);}}
}
```

### `D:\personal\army/lib\features\gameplay\game\map\map_debug_overlay.dart`
```dart
import 'dart:ui';
import 'package:flame/components.dart';
import 'package:mobiarmy_flutter/features/gameplay/game/map/game_map_definition.dart';
class MapDebugOverlay extends PositionComponent { MapDebugOverlay({required this.definition}); final GameMapDefinition definition;
 @override void render(Canvas canvas){final p=Paint()..color=const Color(0xff22c55e);for(final s in definition.spawnPoints){canvas.drawCircle(Offset(s.x.toDouble(),s.y.toDouble()),5,p);}} }
```

### `D:\personal\army/lib\features\gameplay\game\map\map_repository.dart`
```dart
import 'dart:typed_data';
import 'package:mobiarmy_flutter/features/gameplay/game/map/game_map_definition.dart';
import 'package:mobiarmy_flutter/features/gameplay/game/map/legacy_map_parser.dart';
abstract interface class MapDataSource { Future<Uint8List> loadMapBytes(int mapId); Future<List<int>> loadEnvironment(int mapId); Future<List<SpawnPoint>> loadSpawnPoints(int mapId); }
class MapRepository { MapRepository({required this.source,LegacyMapParser parser=const LegacyMapParser()}):_parser=parser; final MapDataSource source; final LegacyMapParser _parser;
 Future<GameMapDefinition> load(int mapId) async => _parser.parse(mapId:mapId,data:await source.loadMapBytes(mapId),environmentValues:await source.loadEnvironment(mapId),spawnPoints:await source.loadSpawnPoints(mapId)); }
```

### `D:\personal\army/lib\features\gameplay\game\map\map_world_controller.dart`
```dart
import 'package:flame/components.dart';
import 'package:mobiarmy_flutter/features/gameplay/game/map/background_component.dart';
import 'package:mobiarmy_flutter/features/gameplay/game/map/game_map_definition.dart';
import 'package:mobiarmy_flutter/features/gameplay/game/map/map_component.dart';
import 'package:mobiarmy_flutter/features/gameplay/game/map/map_debug_overlay.dart';
class MapWorldController { MapWorldController(this.world); final World world; Component? _current;
 Future<void> show(GameMapDefinition map,{bool debug=false}) async {if(_current!=null){_current!.removeFromParent();await _current!.removed;}final root=PositionComponent();await root.add(BackgroundComponent(environment:map.environment,mapSize:Vector2(map.width.toDouble(),map.height.toDouble())));await root.add(MapComponent(definition:map,tileSize:Vector2.all(16),debug:debug));if(debug)await root.add(MapDebugOverlay(definition:map));await world.add(root);_current=root;}
 Future<void> clear() async {final current=_current;if(current==null)return;current.removeFromParent();await current.removed;_current=null;} }
```

### `D:\personal\army/lib\features\gameplay\game\player\character_animation_controller.dart`
```dart
import 'package:mobiarmy_flutter/features/gameplay/domain/character/character_animation_state.dart';
import 'package:mobiarmy_flutter/features/gameplay/domain/character/character_definition.dart';

class CharacterAnimationController {
  CharacterAnimationController({required this.framesPerKind, this.secondsPerFrame = 0.12});
  final Map<CharacterAnimationKind, int> framesPerKind;
  final double secondsPerFrame;
  CharacterAnimationState update(CharacterAnimationState state, double dt) {
    final count = framesPerKind[state.kind] ?? 1;
    final elapsed = state.elapsed + dt;
    if (elapsed < secondsPerFrame) return state.copyWith(elapsed: elapsed);
    final advanced = (elapsed / secondsPerFrame).floor();
    return state.copyWith(frame: (state.frame + advanced) % count, elapsed: elapsed - advanced * secondsPerFrame);
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
    PlayerMovementState movement = const PlayerMovementState(),
  })  : _animation = animation,
        _movement = movement;

  CharacterAppearance appearance;
  final int glassId;
  final CharacterSpriteResolver resolver;
  CharacterAnimationState _animation;
  PlayerMovementState _movement;

  PlayerMovementState get movement => _movement;
  set movement(PlayerMovementState value) {
    _movement = value;
  }

  static const Map<EquipmentSlot, int> layerPriority = {
    EquipmentSlot.wing: 10,
    EquipmentSlot.gun: 20,
    EquipmentSlot.hat: 30,
    EquipmentSlot.armor: 40,
    EquipmentSlot.glasses: 50
  };

  @override Future<void> onLoad() async {
    await super.onLoad();
    for (final slot in EquipmentSlot.values) {
      final layer = EquipmentLayerComponent(priority: layerPriority[slot]!);
      _layers[slot] = layer;
      await add(layer);
    }
    _synchronizeLayers();
  }

  void setAnimation(CharacterAnimationState value) { _animation = value; _synchronizeLayers(); }
  void setAppearance(CharacterAppearance value) { appearance = value; _synchronizeLayers(); }

  void moveTo(double x, double y) {
    // Simple teleport for now, can add lerp later
    position.setValues(x, y);
  }

  void _synchronizeLayers() {
    final left = _animation.facing == CharacterFacing.left;
    for (final slot in EquipmentSlot.values) {
      final id = appearance[slot];
      final resolved = id == null ? null : resolver.resolveEquipment(glassId: glassId, slot: slot, equipmentId: id, frame: _animation.frame);
      _layers[slot]?.applyFrame(nextSprite: resolved?.sprite, offsetX: resolved?.offsetX ?? 0, offsetY: resolved?.offsetY ?? 0, facingLeft: left);
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
  const ResolvedCharacterFrame({required this.sprite, required this.offsetX, required this.offsetY});
  final Sprite sprite;
  final double offsetX, offsetY;
}

class CharacterSpriteResolver {
  CharacterSpriteResolver({required this.atlases, required Map<int, CharacterDefinition> characters, required Iterable<EquipmentDefinition> equipment}) : characters = Map.unmodifiable(characters), equipment = Map.unmodifiable({for (final item in equipment) _key(item.glassId, item.slot, item.id): item});
  final SpriteAtlasRepository atlases;
  final Map<int, CharacterDefinition> characters;
  final Map<String, EquipmentDefinition> equipment;
  static String _key(int glassId, EquipmentSlot slot, int id) => '$glassId/${slot.name}/$id';

  ResolvedCharacterFrame? resolveEquipment({required int glassId, required EquipmentSlot slot, required int equipmentId, required int frame}) {
    final definition = equipment[_key(glassId, slot, equipmentId)];
    if (definition == null) return null;
    final geometry = definition.frame(frame);
    return ResolvedCharacterFrame(sprite: atlases.frame(definition.atlasId, '${definition.id}_$frame'), offsetX: geometry.offsetX.toDouble(), offsetY: geometry.offsetY.toDouble());
  }
}
```

### `D:\personal\army/lib\features\gameplay\game\player\equipment_layer_component.dart`
```dart
import 'package:flame/components.dart';
import 'package:flame/sprite.dart';

class EquipmentLayerComponent extends SpriteComponent {
  EquipmentLayerComponent({required super.priority});
  void applyFrame({required Sprite? nextSprite, required double offsetX, required double offsetY, required bool facingLeft}) {
    sprite = nextSprite;
    position.setValues(facingLeft ? -offsetX : offsetX, offsetY);
    scale.x = facingLeft ? -1 : 1;
  }
}
```

### `D:\personal\army/lib\features\gameplay\game\projectile\bullet_simulator.dart`
```dart
import 'package:mobiarmy_flutter/core/legacy_math/fixed_point.dart';
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
  })  : bX = x,
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

  void nextXY(int mapWidth, int mapHeight, bool Function(int x, int y) isCollision) {
    frame++;
    frames.add(TrajectoryFrame(x: bX, y: bY));

    if (bX < -100 || bX > mapWidth + 100 || bY > mapHeight + 100 || bY < -999999) {
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

  List<int>? _getCollision(int x1, int y1, int x2, int y2, bool Function(int x, int y) isCollision) {
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
import 'package:flame/components.dart';
import 'package:flutter/material.dart';
import 'projectile_trajectory.dart';

class ProjectileComponent extends PositionComponent with HasGameRef {
  ProjectileComponent({
    required this.trajectory,
  }) : super(anchor: Anchor.center);

  final ProjectileTrajectory trajectory;
  int _currentFrame = 0;

  @override
  Future<void> onLoad() async {
    await super.onLoad();
    if (trajectory.frames.isNotEmpty) {
      position.setValues(
        trajectory.frames[0].x.toDouble(),
        trajectory.frames[0].y.toDouble(),
      );
    }
  }

  @override
  void update(double dt) {
    super.update(dt);
    if (_currentFrame < trajectory.frames.length) {
      final frame = trajectory.frames[_currentFrame];
      position.setValues(frame.x.toDouble(), frame.y.toDouble());
      _currentFrame++;
    } else {
      _onExplode();
      removeFromParent();
    }
  }

  void _onExplode() {
    // Notify map of explosion to make hole
    // Trigger explosion animation
  }

  @override
  void render(Canvas canvas) {
    // TODO: Use actual bullet sprite from assets
    canvas.drawCircle(Offset.zero, 3, Paint()..color = Colors.yellow);
  }
}
```

### `D:\personal\army/lib\features\gameplay\game\projectile\projectile_trajectory.dart`
```dart
import 'dart:typed_data';

class TrajectoryFrame {
  const TrajectoryFrame({
    required this.x,
    required this.y,
  });

  final int x;
  final int y;
}

class ProjectileTrajectory {
  const ProjectileTrajectory({
    required this.bulletId,
    required this.frames,
  });

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
    int by = gunY - (height ~/ 2) - ((height - 4) * LegacyTrigonometry.sin(ang) >> 10);
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

    trajectories.add(ProjectileTrajectory(
      bulletId: bulletId,
      frames: bullet.frames,
    ));

    return trajectories;
  }
}
```

### `D:\personal\army/lib\features\gameplay\game\systems\camera_system.dart`
```dart
import 'package:flame/components.dart';
import '../army_game.dart';
import '../projectile/projectile_component.dart';
import '../../domain/camera/camera_mode.dart';

class CameraSystem extends Component with HasGameReference<ArmyGame> {
  CameraMode mode = CameraMode.playerFollow;
  Component? followTarget;
  
  static const double followSpeed = 5.0; // Lerp factor

  @override
  void update(double dt) {
    super.update(dt);
    
    _updateMode();
    _applyClamping();
  }

  void _updateMode() {
    final projectiles = game.gameWorld.children.query<ProjectileComponent>();
    
    if (projectiles.isNotEmpty) {
      mode = CameraMode.bulletFollow;
      followTarget = projectiles.first;
    } else {
      mode = CameraMode.playerFollow;
      // In sandbox, follow player 0
      followTarget = game.players[0];
    }

    if (followTarget != null) {
      if (mode == CameraMode.bulletFollow) {
        // Instant follow for bullets usually
        game.camera.follow(followTarget!, maxSpeed: 1000);
      } else {
        // Smooth follow for players
        game.camera.follow(followTarget!, maxSpeed: 400);
      }
    }
  }

  void _applyClamping() {
    final terrain = game.terrain;
    if (terrain == null) return;

    // Use Flame's built-in bounds rule if not already set
    // Or manually clamp viewfinder position here if we want legacy feel
    // For Phase 7, let's ensure the viewfinder doesn't go outside terrain/2 to width-terrain/2
    
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
  
  void shake({double intensity = 5.0, double duration = 0.5}) {
    add(ScreenShakeEffect(intensity: intensity, duration: duration));
  }
}
```

### `D:\personal\army/lib\features\gameplay\game\systems\combat_system.dart`
```dart
import 'package:flame/components.dart';
import '../projectile/projectile_component.dart';
import '../map/map_component.dart';

class CombatSystem extends Component with HasGameRef {
  // Logic for managing turns, shooting, and damage
  
  void onShoot(ProjectileComponent projectile) {
    gameRef.add(projectile);
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
    
    return isSolid(left, bottom) || isSolid(right, bottom) || isSolid(x, bottom);
  }
}
```

### `D:\personal\army/lib\features\gameplay\game\systems\player_collision_system.dart`
```dart
import 'package:flame/components.dart';
import '../army_game.dart';
import 'ground_probe.dart';
import '../../domain/player/player_movement_state.dart';

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

      // Apply gravity if not on ground
      if (!movement.isOnGround) {
        final velocity = movement.velocity;
        velocity.y += gravity * dt;
        if (velocity.y > terminalVelocity) {
          velocity.y = terminalVelocity;
        }
        player.movement = movement.copyWith(velocity: velocity);
      }

      // Update position based on velocity
      final nextY = player.y + movement.velocity.y * dt;
      
      // Check collision
      if (probe.isSolid(player.x, nextY)) {
        // Snap to ground
        final groundY = probe.findGroundBelow(player.x, player.y);
        if (groundY != null) {
          player.y = groundY;
          player.movement = movement.copyWith(
            velocity: Vector2(movement.velocity.x, 0),
            isOnGround: true,
            kind: movement.velocity.x != 0 ? PlayerMovementKind.walking : PlayerMovementKind.idle,
          );
        }
      } else {
        player.y = nextY;
        if (movement.velocity.y > 0) {
          player.movement = movement.copyWith(
            isOnGround: false,
            kind: PlayerMovementKind.falling,
          );
        }
      }

      // Clamp to map boundaries
      if (player.x < 0) player.x = 0;
      if (player.x > terrain.width) player.x = terrain.width.toDouble();
      if (player.y > terrain.height + 100) {
         // Player fell into water/void
         player.movement = movement.copyWith(kind: PlayerMovementKind.dead);
      }
    }
  }
}
```

### `D:\personal\army/lib\features\gameplay\game\systems\player_movement_system.dart`
```dart
import 'package:flame/components.dart';
import '../army_game.dart';
import '../../domain/player/player_movement_state.dart';

class PlayerMovementSystem extends Component with HasGameReference<ArmyGame> {
  static const double walkSpeed = 60.0;
  static const double staminaConsumption = 20.0; // per second

  @override
  void update(double dt) {
    super.update(dt);
    final input = game.inputController.state;
    
    // For local sandbox, we assume we control the "active" player.
    // In online mode, this will be handled by packets.
    // For now, let's find the player at index 0 or similar.
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
      
      final newStamina = (movement.stamina - staminaConsumption * dt).clamp(0.0, 100.0);
      
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
        kind: movement.isOnGround ? PlayerMovementKind.idle : PlayerMovementKind.falling,
      );
    }
  }
}
```

### `D:\personal\army/lib\features\gameplay\game\systems\screen_shake_effect.dart`
```dart
import 'dart:math';
import 'package:flame/components.dart';
import 'package:flame/effects.dart';
import '../army_game.dart';

class ScreenShakeEffect extends Component with HasGameReference<ArmyGame> {
  ScreenShakeEffect({
    this.intensity = 5.0,
    this.duration = 0.5,
  });

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
          Positioned(
            bottom: 20,
            left: 20,
            child: _buildControls(),
          ),
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
import 'package:mobiarmy_flutter/shared/overlays/gameplay_hud.dart';

class GameplaySandboxScreen extends ConsumerStatefulWidget {
  const GameplaySandboxScreen({super.key});
  @override
  ConsumerState<GameplaySandboxScreen> createState() => _GameplaySandboxScreenState();
}
class _GameplaySandboxScreenState extends ConsumerState<GameplaySandboxScreen> {
  late final ArmyGame _game;
  late final AppLifecycleCoordinator _lifecycle;
  @override
  void initState() {
    super.initState();
    _game = ArmyGame();
    _lifecycle = AppLifecycleCoordinator(game: _game, connection: NoopConnectionLifecycle())..start();
    
    // Attach game to handler
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
      child: Stack(children: [
        Positioned.fill(
          child: GameWidget<ArmyGame>(
            game: _game,
            overlayBuilderMap: {
              'HUD': (context, game) => GameplayHud(game: game),
            },
            initialActiveOverlays: const ['HUD'],
          ),
        ),
        const Positioned(top: 12, left: 12, child: DecoratedBox(
          decoration: BoxDecoration(color: Color(0xAA000000), borderRadius: BorderRadius.all(Radius.circular(12))),
          child: Padding(padding: EdgeInsets.all(10), child: Text('Gameplay sandbox')),
        )),
      ]),
    ),
  );
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
  const _AimButton({
    required this.icon,
    required this.onPressed,
  });

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
import 'package:mobiarmy_flutter/features/gameplay/presentation/widgets/power_bar.dart';
import 'package:mobiarmy_flutter/features/gameplay/presentation/widgets/movement_controls.dart';
import 'package:mobiarmy_flutter/features/gameplay/presentation/widgets/aim_controls.dart';

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
            // Left bottom: Movement
            Positioned(
              left: 20,
              bottom: 20,
              child: MovementControls(game: game),
            ),

            // Right bottom: Fire and Aim
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

            // Center bottom: Power bar and Angle
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
                    child: PowerBar(power: game.inputController.state.force),
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
        // game.fire(force);
      },
      onTapCancel: () => game.inputController.stopCharging(),
      child: Container(
        width: 80,
        height: 80,
        decoration: BoxDecoration(
          color: Colors.red.withOpacity(0.7),
          shape: BoxShape.circle,
          border: Border.all(color: Colors.white, width: 3),
          boxShadow: [
            const BoxShadow(color: Colors.black26, blurRadius: 10, spreadRadius: 2),
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
    colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF38BDF8), brightness: Brightness.dark),
    scaffoldBackgroundColor: const Color(0xFF0F172A),
    useMaterial3: true,
  );
}
```

### `D:\personal\army/lib\shared\widgets\placeholder_screen.dart`
```dart
import 'package:flutter/material.dart';
class PlaceholderScreen extends StatelessWidget {
  const PlaceholderScreen({required this.title, this.message = 'Foundation placeholder', super.key});
  final String title; final String message;
  @override Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(title: Text(title)),
    body: Center(child: Column(mainAxisSize: MainAxisSize.min, children: [Text(title, style: Theme.of(context).textTheme.headlineMedium), const SizedBox(height: 8), Text(message)])),
  );
}
```

