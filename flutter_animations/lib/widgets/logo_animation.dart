import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_animations/constants.dart';
import 'package:flutter_svg/svg.dart';

class LogoAnimation extends StatelessWidget {
  const LogoAnimation({
    super.key,
    required this.alignmentAnimation,
    required this.opacityAnimation,
  });
  final Animation<AlignmentGeometry> alignmentAnimation;
  final Animation<double> opacityAnimation;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: alignmentAnimation,
      builder: (context, child) {
        return Stack(
          alignment: alignmentAnimation.value,
          children: [
            Image.asset(
              'assets/background.png',
            ),
            AnimatedOpacity(
              duration: duration1Sec,
              opacity: opacityAnimation.value,
              child: SvgPicture.asset(
                'assets/logo.svg',
              ),
            ),
          ],
        );
      },
    );
  }
}
