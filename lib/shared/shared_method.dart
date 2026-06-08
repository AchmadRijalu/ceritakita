import 'package:another_flushbar/flushbar.dart';
import 'package:ceritakita/shared/theme.dart';
import 'package:flutter/material.dart';

void showSnackBar(BuildContext context, String message) {
  Flushbar(
    message: message,
    flushbarPosition: FlushbarPosition.TOP,
    backgroundColor: redColor,
    duration: const Duration(seconds: 2),
  ).show(context);
}