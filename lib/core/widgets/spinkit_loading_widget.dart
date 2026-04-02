import 'package:flutter/material.dart';

class SpinKitLoadingWidget extends StatefulWidget {
  final Color? color;
  final double? size;
  final Duration duration;

  const SpinKitLoadingWidget({
    super.key,
    this.color,
    this.size,
    this.duration = const Duration(milliseconds: 1200),
  });

  @override
  State<SpinKitLoadingWidget> createState() => _SpinKitLoadingWidgetState();
}

class _SpinKitLoadingWidgetState extends State<SpinKitLoadingWidget>
    with TickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation1;
  late Animation<double> _animation2;
  late Animation<double> _animation3;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: widget.duration,
      vsync: this,
    );

    _animation1 = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.0, 0.8, curve: Curves.ease),
      ),
    );

    _animation2 = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.1, 0.9, curve: Curves.ease),
      ),
    );

    _animation3 = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.2, 1.0, curve: Curves.ease),
      ),
    );

    _controller.repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final color = widget.color ?? Theme.of(context).colorScheme.primary;
    final size = widget.size ?? 20.0;

    return SizedBox(
      width: size * 3,
      height: size,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _buildDot(_animation1, color, size),
          _buildDot(_animation2, color, size),
          _buildDot(_animation3, color, size),
        ],
      ),
    );
  }

  Widget _buildDot(Animation<double> animation, Color color, double size) {
    return AnimatedBuilder(
      animation: animation,
      builder: (context, child) {
        return Transform.scale(
          scale: animation.value,
          child: Container(
            width: size * 0.3,
            height: size * 0.3,
            decoration: BoxDecoration(
              color: color.withValues(alpha: animation.value),
              shape: BoxShape.circle,
            ),
          ),
        );
      },
    );
  }
}