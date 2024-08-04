import 'package:flutter/material.dart';
import 'package:flutter_animations/constants.dart';
import 'dart:math' as math;

import 'package:flutter_animations/widgets/custom_text_field.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => LoginFormState();
}

class LoginFormState extends State<LoginForm>
    with SingleTickerProviderStateMixin {
  bool _obscureText = true;
  IconData _passwordIcon = Icons.visibility_off;
  bool _isVisible = false;
  late Animation<Offset> _formSlideAnimation;

  @override
  void initState() {
    super.initState();
    _formSlideAnimation = Tween<Offset>(
      begin: const Offset(0, 1),
      end: const Offset(0, 0),
    ).animate(
      afterLoadingController,
    );
  }

  void startAnimation() {
    _isVisible = true;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: _isVisible,
      child: SlideTransition(
        position: _formSlideAnimation,
        child: Padding(
          padding: const EdgeInsets.only(bottom: 20) +
              const EdgeInsets.symmetric(
                horizontal: 20,
              ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const CustomtextField(
                hintText: 'Email Adress',
                prefixIcon: Icon(Icons.person_outline_outlined),
              ),
              const SizedBox(height: 20),
              CustomtextField(
                hintText: 'Password',
                prefixIcon: Transform.rotate(
                  angle: 150 * math.pi / 180,
                  child: const Icon(
                    Icons.key_outlined,
                  ),
                ),
                obscureText: _obscureText,
                suffixIcon: IconButton(
                  icon: Icon(_passwordIcon),
                  onPressed: () {
                    setState(() {
                      _obscureText = !_obscureText;
                      _passwordIcon = _obscureText
                          ? Icons.visibility_off
                          : Icons.visibility;
                    });
                  },
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 55, 30, 156),
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(
                      vertical: 15,
                    ),
                    shape: const BeveledRectangleBorder(),
                  ),
                  child: const Text(
                    'Login',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              TextButton(
                onPressed: () {},
                child: const Text(
                  'Forgot Password',
                  style: TextStyle(
                    color: Colors.pink,
                    decoration: TextDecoration.underline,
                  ),
                ),
              ),
              const SizedBox(
                height: 100,
              ),
              TextButton(
                onPressed: () {},
                child: const Text(
                  'You don\'t have an account?',
                  style: TextStyle(
                    color: Colors.black54,
                  ),
                ),
              ),
              SizedBox(
                width: double.infinity,
                child: OutlinedButton(
                  onPressed: () {},
                  style: OutlinedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(
                      vertical: 15,
                    ),
                    foregroundColor: Colors.pink,
                    side: const BorderSide(
                      color: Color.fromARGB(255, 250, 149, 183),
                    ),
                    shape: const BeveledRectangleBorder(),
                  ),
                  child: const Text(
                    'Create New Account',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 80,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
