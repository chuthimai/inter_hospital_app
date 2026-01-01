class AppConfig {
  static const baseUrl = String.fromEnvironment(
      'BASE_URL',
      // defaultValue: 'http://192.168.0.103:3333',
      defaultValue: 'https://3.25.246.68/hie'
  );
}
