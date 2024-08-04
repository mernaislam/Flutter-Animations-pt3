import 'package:flutter/material.dart';
import 'package:flutter_animations/constants.dart';
import 'package:flutter_animations/widgets/login_form.dart';
import 'package:flutter_animations/widgets/logo_animation.dart';

class HomeScreenBody extends StatefulWidget {
  const HomeScreenBody({super.key});

  @override
  State<HomeScreenBody> createState() => HomeScreenBodyState();
}

class HomeScreenBodyState extends State<HomeScreenBody>
    with TickerProviderStateMixin {
  @override
  void initState() {
    super.initState();

    afterLoadingController = AnimationController(
      vsync: this,
      duration: duration1Sec,
    );
  }

  @override
  void dispose() {
    afterLoadingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topCenter,
      child: SingleChildScrollView(
        child: Column(
          children: [
            const LogoAnimationWithProgressBar(),
            LoginForm(
              key: loginFormKey,
            )
          ],
        ),
      ),
    );
  }
}
