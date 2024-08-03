import 'package:flutter/material.dart';
import 'package:flutter_animations/widgets/home_screen_body.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: const HomeScreenBody(),
    );
  }
}
