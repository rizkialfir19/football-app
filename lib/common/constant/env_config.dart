class EnvConfig {
  static const BASE_PROD_URL = String.fromEnvironment(
    'https://api.football-data.org/v2/',
    defaultValue: 'https://api.football-data.org/v2/',
  );

  // Can add Staging or Dev URL here

  static const API_TOKEN = String.fromEnvironment(
    'd6d27d2abb1e4a37be3c34aa3842782f',
    defaultValue: 'd6d27d2abb1e4a37be3c34aa3842782f',
  );
}
