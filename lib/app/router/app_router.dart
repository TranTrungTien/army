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
import 'package:mobiarmy_flutter/features/gameplay/application/gameplay_controller.dart';
import 'package:mobiarmy_flutter/features/gameplay/presentation/gameplay_sandbox_screen.dart';
import 'package:mobiarmy_flutter/features/gameplay/presentation/lobby_screen.dart';
import 'package:mobiarmy_flutter/features/gameplay/presentation/offline_demo_screen.dart';
import 'package:mobiarmy_flutter/features/gameplay/presentation/online_game_screen.dart';
import 'package:mobiarmy_flutter/features/gameplay/presentation/room_screen.dart';
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

        // Gameplay transition
        if (gameplay != null && location != AppRoute.gameplaySandbox.path) {
          return AppRoute.gameplaySandbox.path;
        }

        // Lobby -> Room transition
        if (lobby.status == LobbyStatus.joined && location != AppRoute.room.path) {
          return AppRoute.room.path;
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