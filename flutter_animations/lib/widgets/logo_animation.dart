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
  // controllers
  late AnimationController _animationController;
  late AnimationController _loadingController;
  // animations
  late Animation<AlignmentGeometry> _alignmentAnimation;
  late Animation<double> _opacityAnimation;
  late Animation<Offset> _lastUpSlideAnimation;

  @override
  void initState() {
    super.initState();
    initializeControllers();
    initializeAnimations();
    _startAnimation();
  }

  void initializeControllers() {
    _animationController = AnimationController(
      vsync: this,
      duration: duration1Sec,
    );

    _loadingController = AnimationController(
      vsync: this,
      duration: duration1Sec,
    );
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

    _lastUpSlideAnimation = Tween<Offset>(
      begin: const Offset(0, 1),
      end: const Offset(0, 0),
    ).animate(
      widget.animationController,
    );
  }

  void _startAnimation() async {
    _animationController.forward();
    await Future.delayed(
      const Duration(
        seconds: 2,
      ),
    );
    _loadingController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    _loadingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SlideTransition(
      position: _lastUpSlideAnimation,
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
                fit: BoxFit.fitWidth,
              ),
              AnimatedOpacity(
                duration: duration1Sec,
                opacity: _opacityAnimation.value,
                child: Image.asset(
                  'assets/logo.png',
                ),
              ),
              ProgressBar(
                loadingController: _loadingController,
                animationController: _animationController,
              ),
            ],
          );
        },
      ),
    );
  }
}
