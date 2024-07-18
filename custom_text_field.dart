import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final String labelText;
  final TextInputType keyboardType;
  final Icon? prefixIcon;
  final bool obscureText;

  CustomTextField({
    required this.controller,
    required this.labelText,
    this.keyboardType = TextInputType.text,
    this.prefixIcon,
    this.obscureText = false,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        labelText: labelText,
        prefixIcon: prefixIcon,
      ),
      keyboardType: keyboardType,
      obscureText: obscureText,
    );
  }
}
