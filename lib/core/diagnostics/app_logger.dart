import 'package:logging/logging.dart';

void configureLogging({required bool debug}) {
  hierarchicalLoggingEnabled = true;
  Logger.root.level = debug ? Level.ALL : Level.INFO;
  Logger.root.onRecord.listen((record) {
    // Replace with an injected log sink before production telemetry is added.
  });
}
