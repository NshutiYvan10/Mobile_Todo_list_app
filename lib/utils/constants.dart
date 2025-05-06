class AppConstants {
  static const String appName = 'TaskMaster Pro';
  static const String appVersion = '1.0.0';

  // Storage keys
  static const String authTokenKey = 'auth_token';
  static const String userIdKey = 'user_id';
  static const String themeModeKey = 'theme_mode';

  // Animation durations
  static const Duration defaultAnimationDuration = Duration(milliseconds: 300);

  // API endpoints (if you have backend)
  static const String baseUrl = 'https://api.taskmaster.com/v1';
  static const String loginEndpoint = '/auth/login';
  static const String registerEndpoint = '/auth/register';
  static const String todosEndpoint = '/todos';
}