abstract final class AppConfig {
  /// Override with: flutter run --dart-define=API_BASE_URL=https://api.example.com
  static const apiBaseUrl = String.fromEnvironment(
    'API_BASE_URL',
    defaultValue: 'http://10.0.2.2:8000', // Android emulator -> host localhost
  );

  static String get apiV1 => '$apiBaseUrl/api/v1';
}
