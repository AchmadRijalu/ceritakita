import 'package:flutter/material.dart';

enum AppImage {
  logo('assets/images/image_cerita_kita.png');

  const AppImage(this.path);

  final String path;
}

extension AppImageX on AppImage {
  Image image({
    double? width,
    double? height,
    BoxFit fit = BoxFit.contain,
    Color? color,
  }) {
    return Image.asset(
      path,
      width: width,
      height: height,
      fit: fit,
      color: color,
    );
  }
}
