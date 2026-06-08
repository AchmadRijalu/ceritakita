part of 'widgets.dart';

class CustomFilledButton extends StatefulWidget {
  final String title;
  final double? width;
  final double? height;
  final Color? color;
  final bool isDisabled;
  final bool isLoading;
  final VoidCallback? onPressed;

  const CustomFilledButton({
    super.key,
    required this.title,
    this.width = double.infinity,
    this.height = 50,
    this.color,
    this.isDisabled = false,
    this.isLoading = false,
    this.onPressed,
  });

  @override
  State<CustomFilledButton> createState() => _CustomFilledButtonState();
}

class _CustomFilledButtonState extends State<CustomFilledButton>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 600),
    );

    _scaleAnimation = Tween<double>(begin: 1.0, end: 1.0).animate(_controller);
  }

  void _onTapDown(TapDownDetails _) {
    if (widget.isDisabled || widget.isLoading) return;

    _scaleAnimation = TweenSequence([
      TweenSequenceItem(tween: Tween(begin: 1.0, end: 0.92), weight: 15),
      TweenSequenceItem(tween: Tween(begin: 0.92, end: 1.08), weight: 25),
      TweenSequenceItem(tween: Tween(begin: 1.08, end: 0.96), weight: 20),
      TweenSequenceItem(tween: Tween(begin: 0.96, end: 1.03), weight: 20),
      TweenSequenceItem(tween: Tween(begin: 1.03, end: 1.0), weight: 20),
    ]).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));

    _controller.forward(from: 0);
  }

  void _onTapUp(TapUpDetails _) {}
  void _onTapCancel() {}

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Color get _buttonColor {
    if (widget.isDisabled) return greyColor;
    return widget.color ?? primaryColor;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: _onTapDown,
      onTapUp: _onTapUp,
      onTapCancel: _onTapCancel,
      onTap: (widget.isDisabled || widget.isLoading) ? null : widget.onPressed,
      child: AnimatedBuilder(
        animation: _scaleAnimation,
        builder: (context, child) =>
            Transform.scale(scale: _scaleAnimation.value, child: child),
        child: AnimatedOpacity(
          duration: const Duration(milliseconds: 200),
          opacity: widget.isDisabled ? 0.6 : 1.0,
          child: SizedBox(
            width: widget.width,
            height: widget.height,
            child: Material(
              color: _buttonColor,
              borderRadius: BorderRadius.circular(50),
              child: InkWell(
                borderRadius: BorderRadius.circular(50),
                splashColor: Colors.white.withValues(alpha: 0.2),
                highlightColor: Colors.white.withValues(alpha: 0.1),
                onTap: (widget.isDisabled || widget.isLoading)
                    ? null
                    : widget.onPressed,
                child: Center(
                  child: AnimatedSwitcher(
                    duration: const Duration(milliseconds: 200),
                    child: widget.isLoading
                        ? const SizedBox(
                            width: 22,
                            height: 22,
                            child: CircularProgressIndicator(
                              strokeWidth: 2.5,
                              valueColor: AlwaysStoppedAnimation<Color>(
                                Colors.white,
                              ),
                            ),
                          )
                        : Text(
                            widget.title,
                            key: ValueKey(widget.title),
                            style: Theme.of(context).textTheme.labelLarge
                                ?.copyWith(color: Colors.white, fontSize: 16),
                          ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class CustomTextButton extends StatelessWidget {
  final String? title;
  final double? width;
  final double? height;
  final double? fontSize;

  final VoidCallback? onPressed;
  const CustomTextButton({
    super.key,
    required this.title,
    this.width,
    this.height = 24,
    this.onPressed,
    this.fontSize,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: TextButton(
        style: TextButton.styleFrom(padding: EdgeInsets.zero),
        onPressed: onPressed,
        child: Text(
          title!,
          style: primaryDarkTextStyle.copyWith(fontSize: fontSize ?? 16),
        ),
      ),
    );
  }
}
