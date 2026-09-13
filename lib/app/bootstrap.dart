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
