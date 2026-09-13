enum AppRoute {
  bootstrap('/'),
  serverSelection('/servers'),
  login('/login'),
  lobby('/lobby'),
  room('/room'),
  inventory('/inventory'),
  gameplaySandbox('/gameplay-sandbox');

  const AppRoute(this.path);
  final String path;
}
