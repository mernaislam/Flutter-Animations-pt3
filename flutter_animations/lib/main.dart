import 'package:flutter/material.dart';
import 'package:flutter_animations/screens/home_screen.dart';

void main() {
  runApp(const AnimationsApp());
}

class AnimationsApp extends StatelessWidget {
  const AnimationsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Animations',
      home: HomeScreen(),
    );
  }
}
