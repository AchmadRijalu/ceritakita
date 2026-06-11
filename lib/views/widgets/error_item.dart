import 'package:ceritakita/l10n/app_localizations.dart';
import 'package:ceritakita/shared/theme.dart';
import 'package:ceritakita/views/widgets/widgets.dart';
import 'package:flutter/material.dart';

class ErrorItem extends StatelessWidget {
  final VoidCallback? onRetry;
  final String? title;
  final String? message;

  const ErrorItem({super.key, this.onRetry, this.title, this.message});

  static String friendlyMessage(BuildContext context, String? error) {
    final l10n = AppLocalizations.of(context)!;

    if (error == null || error.isEmpty) {
      return l10n.somethingWentWrong;
    }

    final lowered = error.toLowerCase();

    if (lowered.contains('socketexception') ||
        lowered.contains('failed host lookup') ||
        lowered.contains('network is unreachable') ||
        lowered.contains('connection refused') ||
        lowered.contains('connection timed out') ||
        lowered.contains('no address associated with hostname')) {
      return l10n.noInternetConnection;
    }

    return l10n.somethingWentWrong;
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

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
              child: Icon(Icons.wifi_off_rounded, color: redColor, size: 36),
            ),
            const SizedBox(height: 20),
            Text(
              title ?? l10n.oops,
              style: blackTextStyle.copyWith(
                fontSize: 20,
                fontWeight: semiBold,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 8),
            Text(
              message ?? l10n.somethingWentWrong,
              style: greyTextStyle.copyWith(fontSize: 14),
              textAlign: TextAlign.center,
            ),
            if (onRetry != null) ...[
              const SizedBox(height: 24),
              CustomFilledButton(
                title: l10n.retry,
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
