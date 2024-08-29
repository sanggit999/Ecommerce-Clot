import 'package:flutter/material.dart';

class BasicTextFormField extends StatelessWidget {
  const BasicTextFormField({
    super.key,
    required this.hintText,
    required this.controller,
    this.validator,
    required this.keyboardKey,
    this.obscureText = false,
  });

  final TextEditingController controller;
  final String hintText;
  final TextInputType keyboardKey;
  final FormFieldValidator<String>? validator;
  final bool obscureText;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(hintText: hintText),
      keyboardType: keyboardKey,
      obscureText:obscureText,
      validator: validator,
      // TU DONG LAM MOI VALIDATE KHI NHAP
      autovalidateMode: AutovalidateMode.onUserInteraction,
    );
  }
}
