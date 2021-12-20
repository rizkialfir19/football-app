class EnvConfig {
  static const BASE_PROD_URL = String.fromEnvironment(
    'https://www.football-data.org/v2/',
    defaultValue: 'https://www.football-data.org/v2/',
  );

  // Can add Staging or Dev URL here

  // static const OPEN_API_KEY = String.fromEnvironment(
  //   'c6skm0qad3ie4g2fjh40',
  //   defaultValue: 'c6skm0qad3ie4g2fjh40',
  // );
}
