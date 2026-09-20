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
