import 'package:flutter/foundation.dart';

abstract final class AppConfig {
  static const String appName = 'CeritaKita';

  static bool get isDebug => kDebugMode;
  static bool get isRelease => kReleaseMode;
  static bool get enableNetworkLogger => kDebugMode;
}
