class ApiConstants {
  static const bool isReleaseMode = bool.fromEnvironment('dart.vm.product');
  static const bool isProfileMode = bool.fromEnvironment('dart.vm.profile');
  static const bool isDebugMode = !isReleaseMode && !isProfileMode;

  static String baseUrl = !isDebugMode
      ? 'url' // release mode
      : 'url';

  static String example = "/example";
}