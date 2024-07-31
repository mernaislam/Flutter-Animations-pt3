import 'package:flutter/material.dart';

class ProgressBar extends StatelessWidget {
  const ProgressBar({
    super.key,
    required this.progressBarAnimation,
    required this.sizeAnimation,
    required this.slideAnimation
  });
  final Animation<double> progressBarAnimation;
  final Animation<double> sizeAnimation;
  final Animation<Offset> slideAnimation;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SlideTransition(
        position: slideAnimation,
        child: Stack(
          children: [
            AnimatedBuilder(
              animation: sizeAnimation,
              builder: (context, child) {
                if (progressBarAnimation.value < 200) {
                  return Container(
                    height: 3,
                    width: sizeAnimation.value,
                    color: Colors.grey,
                  );
                } else {
                  return const SizedBox();
                }
              },
            ),
            AnimatedBuilder(
              animation: progressBarAnimation,
              builder: (context, child) {
                if (progressBarAnimation.value < 200) {
                  return Container(
                    height: 3,
                    width: progressBarAnimation.value,
                    color: Colors.pink,
                  );
                } else {
                  return const SizedBox();
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
