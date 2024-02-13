import 'package:flutter/material.dart';

class CustomFadingLoadingAnimation extends StatefulWidget {
  const CustomFadingLoadingAnimation({super.key, required this.widget});

  final Widget widget;

  @override
  State<CustomFadingLoadingAnimation> createState() =>
      _CustomFadingLoadingAnimationState();
}

class _CustomFadingLoadingAnimationState
    extends State<CustomFadingLoadingAnimation>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> opacity;

  @override
  void initState() {
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 400),
    );
    opacity = Tween(begin: .4, end: 1.0).animate(_controller);
    _controller
      ..forward()
      ..repeat(reverse: true);
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      builder: (context, child) {
        return Opacity(
          opacity: opacity.value,
          child: widget.widget,
        );
      },
      animation: _controller,
    );
  }
}
