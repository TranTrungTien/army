abstract interface class ConnectionLifecycle {
  void onBackground();
  void onForeground();
  Future<void> dispose();
}

class NoopConnectionLifecycle implements ConnectionLifecycle {
  @override
  void onBackground() {}
  @override
  void onForeground() {}
  @override
  Future<void> dispose() async {}
}
