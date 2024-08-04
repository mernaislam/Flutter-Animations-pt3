import 'package:flutter/material.dart';

class CustomtextField extends StatelessWidget {
  const CustomtextField({
    super.key,
    required this.hintText,
    required this.prefixIcon,
    this.suffixIcon,
    this.obscureText,
  });
  final String hintText;
  final Widget prefixIcon;
  final Widget? suffixIcon;
  final bool? obscureText;

  @override
  Widget build(BuildContext context) {
    return TextField(
      obscureText: obscureText ?? false,
      decoration: InputDecoration(
        hintText: hintText,
        fillColor: const Color.fromARGB(255, 234, 234, 234),
        filled: true,
        prefixIcon: prefixIcon,
        prefixIconColor: Colors.pink,
        suffixIcon: suffixIcon,
        contentPadding: const EdgeInsets.all(20),
        border: const OutlineInputBorder(),
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: Color.fromARGB(255, 197, 197, 197),
          ),
        ),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: Color.fromARGB(255, 223, 107, 144),
          ),
        ),
      ),
    );
  }
}
