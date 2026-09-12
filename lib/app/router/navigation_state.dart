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
