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
