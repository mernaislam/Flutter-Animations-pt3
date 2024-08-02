import 'package:flutter/material.dart';

class ProgressBar extends StatefulWidget {
  const ProgressBar({
    super.key,
    required this.progressBarAnimation,
    required this.sizeAnimation,
    required this.slideAnimation,
    required this.animationController,
  });
  final Animation<double> progressBarAnimation;
  final Animation<double> sizeAnimation;
  final Animation<Offset> slideAnimation;
  final AnimationController animationController;

  @override
  State<ProgressBar> createState() => _ProgressBarState();
}

class _ProgressBarState extends State<ProgressBar>
    with TickerProviderStateMixin {
  bool _isVisible = true;
  late Animation<double> _opacityAnimation;
  late Animation<Offset> _slideAnimation;
  late Animation<Offset> _newSlideAnimation;

  @override
  void initState() {
    super.initState();
    widget.progressBarAnimation.addListener(_checkVisibility);
    
    _opacityAnimation = Tween<double>(
      begin: 1,
      end: 0,
    ).animate(
      widget.animationController,
    );
    _newSlideAnimation = Tween<Offset>(
      begin: const Offset(0, -20),
      end: const Offset(0, 30),
    ).animate(
      widget.animationController,
    );
    _slideAnimation = widget.slideAnimation;
  }

  @override
  void dispose() {
    widget.progressBarAnimation.removeListener(_checkVisibility);
    super.dispose();
  }

  void _checkVisibility() {
    if (widget.progressBarAnimation.value >= 200 && _isVisible) {
      setState(() {
        _isVisible = false;
        _slideAnimation = _newSlideAnimation;
        widget.animationController.forward();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SlideTransition(
        position: _slideAnimation,
        child: FadeTransition(
          opacity: _opacityAnimation,
          child: Stack(
            children: [
              AnimatedBuilder(
                animation: widget.sizeAnimation,
                builder: (context, child) {
                  return Container(
                    height: 3,
                    width: widget.sizeAnimation.value,
                    color: Colors.grey,
                  );
                },
              ),
              AnimatedBuilder(
                animation: widget.progressBarAnimation,
                builder: (context, child) {
                  return Container(
                    height: 3,
                    width: widget.progressBarAnimation.value,
                    color: Colors.pink,
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
