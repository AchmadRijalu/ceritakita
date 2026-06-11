import 'package:ceritakita/shared/theme.dart';
import 'package:ceritakita/views/widgets/widgets.dart';
import 'package:flutter/material.dart';

class ErrorItem extends StatelessWidget {
  final VoidCallback? onRetry;
  final String? title;
  final String? message;

  const ErrorItem({
    super.key,
    this.onRetry,
    this.title,
    this.message,
  });

  static String friendlyMessage(String? error) {
    if (error == null || error.isEmpty) {
      return 'Something went wrong. Please try again.';
    }

    final lowered = error.toLowerCase();

    if (lowered.contains('socketexception') ||
        lowered.contains('failed host lookup') ||
        lowered.contains('network is unreachable') ||
        lowered.contains('connection refused') ||
        lowered.contains('connection timed out') ||
        lowered.contains('no address associated with hostname')) {
      return 'No internet connection. Please check your network and try again.';
    }

    return 'Something went wrong. Please try again.';
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 72,
              height: 72,
              decoration: BoxDecoration(
                color: redColor.withValues(alpha: 0.1),
                shape: BoxShape.circle,
              ),
              child: Icon(
                Icons.wifi_off_rounded,
                color: redColor,
                size: 36,
              ),
            ),
            const SizedBox(height: 20),
            Text(
              title ?? 'Oops!',
              style: blackTextStyle.copyWith(
                fontSize: 20,
                fontWeight: semiBold,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 8),
            Text(
              message ?? 'Something went wrong. Please try again.',
              style: greyTextStyle.copyWith(fontSize: 14),
              textAlign: TextAlign.center,
            ),
            if (onRetry != null) ...[
              const SizedBox(height: 24),
              CustomFilledButton(
                title: 'Retry',
                width: 160,
                onPressed: onRetry,
              ),
            ],
          ],
        ),
      ),
    );
  }
}
