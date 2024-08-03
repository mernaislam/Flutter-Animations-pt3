import 'package:flutter/material.dart';
import 'package:flutter_animations/constants.dart';

class SkipAnimation extends StatefulWidget {
  const SkipAnimation({super.key});

  @override
  State<SkipAnimation> createState() => SkipAnimationState();
}

class SkipAnimationState extends State<SkipAnimation>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<Offset> _slideAnimation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: duration1Sec,
    );
    _slideAnimation = Tween<Offset>(
      begin: const Offset(1, 0),
      end: const Offset(0, 0),
    ).animate(_animationController);
  }

  void startAnimation(){
    _animationController.forward();
  }

  @override
  Widget build(BuildContext context) {
    return SlideTransition(
      position: _slideAnimation,
      child: const Row(
        children: [
          Text(
            'Skip',
            style: TextStyle(
              fontSize: 17,
            ),
          ),
          SizedBox(
            width: 10,
          ),
          Icon(
            Icons.arrow_forward,
            color: Colors.pink,
            size: 20,
          ),
          SizedBox(
            width: 20,
          ),
        ],
      ),
    );
  }
}
