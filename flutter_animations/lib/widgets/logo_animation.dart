import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_animations/constants.dart';
import 'package:flutter_animations/widgets/progress_bar.dart';

class LogoAnimationWithProgressBar extends StatefulWidget {
  const LogoAnimationWithProgressBar({
    super.key,
    required this.animationController,
  });

  final AnimationController animationController;
  @override
  State<LogoAnimationWithProgressBar> createState() =>
      _LogoAnimationWithProgressBarState();
}

class _LogoAnimationWithProgressBarState
    extends State<LogoAnimationWithProgressBar> with TickerProviderStateMixin {
  late AnimationController _animationController;
  late AnimationController _progressBarController;
  late AnimationController _startScreenController;
  late Animation<AlignmentGeometry> _alignmentAnimation;
  late Animation<double> _opacityAnimation;
  late Animation<double> _progressBarAnimation;
  late Animation<double> _sizeAnimation;
  late Animation<Offset> _slideAnimation;
  late Animation<Offset> _newSlideAnimation;

  void initializeControllers() {
    _animationController = AnimationController(
      vsync: this,
      duration: duration1Sec,
    );

    _progressBarController = AnimationController(
      vsync: this,
      duration: duration1Sec,
    );

    _startScreenController = AnimationController(
      vsync: this,
      duration: duration1Sec,
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    _progressBarController.dispose();
    _startScreenController.dispose();
    super.dispose();
  }

  void initializeAnimations() {
    _alignmentAnimation = Tween<AlignmentGeometry>(
      begin: Alignment.bottomCenter,
      end: Alignment.center,
    ).animate(
      _animationController,
    );

    _opacityAnimation = Tween<double>(
      begin: 0,
      end: 1,
    ).animate(
      _animationController,
    );

    _progressBarAnimation = Tween<double>(
      begin: 0,
      end: 200,
    ).animate(
      _progressBarController,
    );

    _sizeAnimation = Tween<double>(
      begin: 0,
      end: 200,
    ).animate(
      _animationController,
    );

    _slideAnimation = Tween<Offset>(
      begin: const Offset(0, 100),
      end: const Offset(0, 90),
    ).animate(
      _animationController,
    );

    _newSlideAnimation = Tween<Offset>(
      begin: const Offset(0, 1),
      end: const Offset(0, 0),
    ).animate(
      widget.animationController,
    );
  }

  @override
  void initState() {
    super.initState();
    initializeControllers();
    initializeAnimations();
    _startAnimation();
  }

  void _startAnimation() async {
    _animationController.forward();
    await Future.delayed(
      const Duration(
        seconds: 2,
      ),
    );
    _progressBarController.forward();
  }

  @override
  Widget build(BuildContext context) {
    return SlideTransition(
      position: _newSlideAnimation,
      child: AnimatedBuilder(
        animation: _alignmentAnimation,
        builder: (context, child) {
          return Stack(
            alignment: _alignmentAnimation.value,
            children: [
              Image.asset(
                'assets/background.png',
                height: 250,
                width: double.infinity,
                fit: BoxFit.fitWidth
              ),
              AnimatedOpacity(
                duration: duration1Sec,
                opacity: _opacityAnimation.value,
                child: Image.asset(
                  'assets/logo.png',
                ),
              ),
              ProgressBar(
                progressBarAnimation: _progressBarAnimation,
                sizeAnimation: _sizeAnimation,
                slideAnimation: _slideAnimation,
                animationController: _startScreenController,
              ),
            ],
          );
        },
      ),
    );
  }
}
