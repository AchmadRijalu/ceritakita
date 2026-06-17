import 'dart:math' as math;

import 'package:ceritakita/shared/theme.dart';
import 'package:flutter/material.dart';


class CeritaLoadingAnimation extends StatefulWidget {
  const CeritaLoadingAnimation({
    super.key,
    this.message,
    this.size = 180,
  });

  const CeritaLoadingAnimation.compact({super.key, this.message})
    : size = 72;

  final String? message;
  final double size;

  @override
  State<CeritaLoadingAnimation> createState() => _CeritaLoadingAnimationState();
}

class _CeritaLoadingAnimationState extends State<CeritaLoadingAnimation>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _motion;
  bool _showMessage = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 2800),
    )..repeat(reverse: true);

    _motion = CurvedAnimation(parent: _controller, curve: Curves.easeInOut);

    if (widget.message != null) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (!mounted) return;
        setState(() => _showMessage = true);
      });
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final message = widget.message;

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(
          height: widget.size,
          width: widget.size,
          child: AnimatedBuilder(
            animation: _motion,
            builder: (context, child) {
              return CustomPaint(
                painter: _StoryBookPainter(progress: _motion.value),
                child: const SizedBox.expand(),
              );
            },
          ),
        ),
        if (message != null) ...[
          SizedBox(height: widget.size >= 120 ? 20 : 8),
          AnimatedOpacity(
            opacity: _showMessage ? 1 : 0,
            duration: const Duration(milliseconds: 500),
            curve: Curves.easeOut,
            child: AnimatedSlide(
              offset: _showMessage ? Offset.zero : const Offset(0, 0.1),
              duration: const Duration(milliseconds: 500),
              curve: Curves.easeOutCubic,
              child: Text(
                message,
                textAlign: TextAlign.center,
                style: (widget.size >= 120 ? blackTextStyle : greyTextStyle)
                    .copyWith(
                      fontSize: widget.size >= 120 ? 15 : 13,
                      fontWeight: widget.size >= 120 ? medium : regular,
                    ),
              ),
            ),
          ),
        ],
      ],
    );
  }
}

class _StoryBookPainter extends CustomPainter {
  _StoryBookPainter({required this.progress});

  final double progress;

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2 + size.height * 0.04);
    final floatOffset = math.sin(progress * math.pi) * size.height * 0.045;
    final scale = size.width / 180;

    canvas.save();
    canvas.translate(0, floatOffset);
    canvas.scale(scale);

    final scaledCenter = Offset(center.dx / scale, center.dy / scale);
    final scaledSize = Size(size.width / scale, size.height / scale);

    _drawGlow(canvas, scaledCenter);
    _drawBook(canvas, scaledCenter);
    _drawSparkles(canvas, scaledSize);

    canvas.restore();
  }

  void _drawGlow(Canvas canvas, Offset center) {
    final glowPaint = Paint()
      ..shader = RadialGradient(
        colors: [
          primaryColor.withValues(alpha: 0.18),
          primaryColor.withValues(alpha: 0),
        ],
      ).createShader(Rect.fromCircle(center: center, radius: 90));

    canvas.drawCircle(center, 90, glowPaint);
  }

  void _drawBook(Canvas canvas, Offset center) {
    const bookWidth = 120.0;
    const bookHeight = 88.0;
    final left = center.dx - bookWidth / 2;
    final top = center.dy - bookHeight / 2;
    final bookRect = RRect.fromRectAndRadius(
      Rect.fromLTWH(left, top, bookWidth, bookHeight),
      const Radius.circular(14),
    );

    final coverPaint = Paint()..color = primaryColor;
    final pagePaint = Paint()..color = whiteColor;
    final linePaint = Paint()
      ..color = primaryColor.withValues(alpha: 0.25)
      ..strokeWidth = 2
      ..strokeCap = StrokeCap.round;

    canvas.drawRRect(bookRect, coverPaint);

    final spineX = center.dx;
    canvas.drawLine(
      Offset(spineX, top + 8),
      Offset(spineX, top + bookHeight - 8),
      Paint()
        ..color = primaryDarkColor
        ..strokeWidth = 3,
    );

    final pageTurn = progress * 0.35;
    final leftPagePath = Path()
      ..moveTo(spineX, top + 10)
      ..lineTo(left + 14 + pageTurn * 26, top + 12)
      ..lineTo(left + 14 + pageTurn * 18, top + bookHeight - 12)
      ..lineTo(spineX, top + bookHeight - 10)
      ..close();
    canvas.drawPath(leftPagePath, pagePaint);

    final rightPagePath = Path()
      ..moveTo(spineX, top + 10)
      ..lineTo(left + bookWidth - 14 - pageTurn * 18, top + 12)
      ..lineTo(left + bookWidth - 14 - pageTurn * 26, top + bookHeight - 12)
      ..lineTo(spineX, top + bookHeight - 10)
      ..close();
    canvas.drawPath(rightPagePath, pagePaint);

    for (var i = 0; i < 3; i++) {
      final y = top + 28 + (i * 16);
      canvas.drawLine(
        Offset(spineX + 10, y),
        Offset(left + bookWidth - 18, y),
        linePaint,
      );
    }

    final bookmarkHeight = 28 + progress * 8;
    final bookmarkPath = Path()
      ..moveTo(spineX + 24, top + 6)
      ..lineTo(spineX + 36, top + 6)
      ..lineTo(spineX + 30, top + 6 + bookmarkHeight)
      ..close();
    canvas.drawPath(bookmarkPath, Paint()..color = greenColor);
  }

  void _drawSparkles(Canvas canvas, Size size) {
    final sparklePaint = Paint()..color = primaryColor;
    final points = [
      Offset(size.width * 0.18, size.height * 0.22),
      Offset(size.width * 0.82, size.height * 0.28),
      Offset(size.width * 0.24, size.height * 0.78),
      Offset(size.width * 0.78, size.height * 0.72),
    ];

    for (var i = 0; i < points.length; i++) {
      final phase = progress + (i * 0.2);
      final scale = 0.6 + (math.sin(phase * math.pi * 2) * 0.2 + 0.2);
      final point = points[i];
      canvas.drawCircle(point, 3.5 * scale, sparklePaint);
      canvas.drawCircle(
        point,
        7 * scale,
        Paint()..color = primaryColor.withValues(alpha: 0.18),
      );
    }
  }

  @override
  bool shouldRepaint(covariant _StoryBookPainter oldDelegate) {
    return oldDelegate.progress != progress;
  }
}
