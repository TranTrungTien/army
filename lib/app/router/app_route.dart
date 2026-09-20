enum AppRoute {
  bootstrap('/'),
  serverSelection('/servers'),
  login('/login'),
  lobby('/lobby'),
  room('/room'),
  game('/game'),
  demo('/demo'),
  inventory('/inventory'),
  shop('/shop'),
  friends('/friends'),
  clan('/clan'),
  missions('/missions'),
  luckyGame('/lucky-game'),
  ranking('/ranking'),
  formulas('/formulas'),
  profile('/profile'),
  offlineSetup('/offline-setup'),
  gameplaySandbox('/gameplay-sandbox');

  const AppRoute(this.path);
  final String path;
}