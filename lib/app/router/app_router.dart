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
