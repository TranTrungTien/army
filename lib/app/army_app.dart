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
