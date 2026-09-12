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
