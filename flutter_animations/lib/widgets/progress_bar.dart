import 'package:flutter/material.dart';
import 'package:flutter_animations/constants.dart';

class ProgressBar extends StatefulWidget {
  const ProgressBar({
    super.key,
    required this.loadingController,
    required this.animationController,
  });
  final AnimationController loadingController;
  final AnimationController animationController;

  @override
  State<ProgressBar> createState() => _ProgressBarState();
}

class _ProgressBarState extends State<ProgressBar>
    with SingleTickerProviderStateMixin {

  // animations
  late Animation<double> _opacityAnimation;
  late Animation<double> _loadingAnimation;
  late Animation<double> _sizeAnimation;
  late Animation<Offset> _upSlideAnimation;
  late Animation<Offset> _downSlideAnimation;
  // controllers
  late AnimationController _startScreenController;

  void initializeControllers(){
    _startScreenController = AnimationController(
      vsync: this,
      duration: duration1Sec,
    );
  }

  void initializeAnimations(){
    _loadingAnimation = Tween<double>(
      begin: 0,
      end: 200,
    ).animate(
      widget.loadingController,
    );

    _sizeAnimation = Tween<double>(
      begin: 0,
      end: 200,
    ).animate(
      widget.animationController,
    );

    _upSlideAnimation = Tween<Offset>(
      begin: const Offset(0, 100),
      end: const Offset(0, 90),
    ).animate(
      widget.animationController,
    );

    _opacityAnimation = Tween<double>(
      begin: 1,
      end: 0,
    ).animate(
      _startScreenController,
    );

    _downSlideAnimation = Tween<Offset>(
      begin: const Offset(0, 90),
      end: const Offset(0, 130),
    ).animate(
      _startScreenController,
    );
  }

  @override
  void initState() {
    super.initState();
    initializeControllers();
    initializeAnimations();
    _loadingAnimation.addListener(_checkVisibility);
  }

  @override
  void dispose() {
    _loadingAnimation.removeListener(_checkVisibility);
    super.dispose();
  }

  void _checkVisibility() {
    if (_loadingAnimation.status == AnimationStatus.completed) {
      loginFormKey.currentState?.startAnimation();
      skipAnimationKey.currentState?.startAnimation();
      setState(() {
        _upSlideAnimation = _downSlideAnimation;
        _startScreenController.forward();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SlideTransition(
        position: _upSlideAnimation,
        child: FadeTransition(
          opacity: _opacityAnimation,
          child: Stack(
            children: [
              AnimatedBuilder(
                animation: _sizeAnimation,
                builder: (context, child) {
                  return Container(
                    height: 3,
                    width: _sizeAnimation.value,
                    color: Colors.grey,
                  );
                },
              ),
              AnimatedBuilder(
                animation: _loadingAnimation,
                builder: (context, child) {
                  return Container(
                    height: 3,
                    width: _loadingAnimation.value,
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
