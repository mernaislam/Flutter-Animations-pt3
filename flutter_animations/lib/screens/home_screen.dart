import 'package:flutter/material.dart';
import 'package:flutter_animations/constants.dart';
import 'package:flutter_animations/widgets/logo_animation.dart';
import 'package:flutter_animations/widgets/progress_bar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  late AnimationController _animationController;
  late AnimationController _progressBarController;
  late AnimationController _startScreenController;
  late Animation<AlignmentGeometry> _alignmentAnimation;
  late Animation<AlignmentGeometry> _newAlignmentAnimation;
  late Animation<double> _opacityAnimation;
  late Animation<double> _progressBarAnimation;
  late Animation<double> _sizeAnimation;
  late Animation<Offset> _slideAnimation;

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
      begin: const Offset(0, 0),
      end: const Offset(0, -20),
    ).animate(
      _animationController,
    );

    _newAlignmentAnimation = Tween<AlignmentGeometry>(
      begin: Alignment.bottomCenter,
      end: Alignment.topCenter,
    ).animate(
      _startScreenController,
    );
  }

  @override
  void initState() {
    // TODO: implement initState
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
    return Scaffold(
      body: Align(
        alignment: Alignment.bottomCenter,
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
           children: [
              LogoAnimation(
                alignmentAnimation: _alignmentAnimation,
                opacityAnimation: _opacityAnimation,
              ),
              const SizedBox(
                height: 150,
              ),
              ProgressBar(
                progressBarAnimation: _progressBarAnimation,
                sizeAnimation: _sizeAnimation,
                slideAnimation: _slideAnimation,
                animationController: _startScreenController,
              ),
              const SizedBox(
                height: 150,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
