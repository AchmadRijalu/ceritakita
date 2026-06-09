import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:samseer/samseer.dart';

bool _supportsShakeDetection() {
  if (kIsWeb) return false;

  return defaultTargetPlatform == TargetPlatform.android ||
      defaultTargetPlatform == TargetPlatform.iOS;
}

class NetworkLogger {
  NetworkLogger._();

  static final NetworkLogger instance = NetworkLogger._();

  Samseer? _samseer;
  bool _shakeEnabled = false;

  Samseer? get samseer => _samseer;

  GlobalKey<NavigatorState>? get navigatorKey => _samseer?.navigatorKey;

  bool get shakeEnabled => _shakeEnabled;

  bool get showFloatingBubble =>
      _samseer?.configuration.showFloatingBubble ?? false;

  void init() {
    if (!kDebugMode || _samseer != null) return;

    _shakeEnabled = _supportsShakeDetection();

    _samseer = Samseer(
      configuration: SamseerConfiguration(
        showInspectorOnShake: _shakeEnabled,
        showFloatingBubble: true,
        maxCallsCount: 1000,
      ),
    );
  }

  http.Client createClient() {
    final samseer = _samseer;
    if (samseer != null) {
      return samseer.httpClient();
    }
    return http.Client();
  }

  Widget overlay({required Widget child}) {
    final samseer = _samseer;
    if (samseer != null) {
      return samseer.overlay(child: child);
    }
    return child;
  }

  Future<void> showInspector() => _samseer?.showInspector() ?? Future.value();
}
