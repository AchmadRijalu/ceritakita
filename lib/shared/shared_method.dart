import 'package:another_flushbar/flushbar.dart';
import 'package:ceritakita/shared/theme.dart';
import 'package:flutter/material.dart';

Future<void> showSnackBar(
  BuildContext context,
  String message, {
  Color? backgroundColor,
}) {
  return Flushbar(
    message: message,
    flushbarPosition: FlushbarPosition.TOP,
    backgroundColor: backgroundColor ?? redColor,
    duration: const Duration(seconds: 2),
  ).show(context);
}
