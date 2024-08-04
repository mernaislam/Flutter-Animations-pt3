import 'package:flutter/material.dart';
import 'package:flutter_animations/widgets/home_screen_body.dart';
import 'package:flutter_animations/widgets/skip_animation.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: const [
          SkipAnimation(),
        ],
      ),
      body: const HomeScreenBody(),
    );
  }
}
