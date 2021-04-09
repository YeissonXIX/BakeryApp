import 'package:flutter/services.dart';
import 'package:flutter/material.dart';

final OutlineInputBorder border = OutlineInputBorder(
  borderRadius: BorderRadius.all(
    Radius.circular(5.0),
  ),
);

class MyTextFormField extends StatelessWidget {
  MyTextFormField({
    this.labelName,
    this.hintName,
    this.obscureText = false,
    this.showMessagError,
    this.lengthLimiter,
    this.controller,
    this.keyBoardType,
  });

  final TextInputType keyBoardType;
  final String labelName;
  final String showMessagError;
  final String hintName;
  final bool obscureText;
  final LengthLimitingTextInputFormatter lengthLimiter;
  final TextEditingController controller;
  @override
  Widget build(BuildContext context) {
    return TextField(
      inputFormatters: [lengthLimiter],
      keyboardType: keyBoardType,
      controller: controller,
      obscureText: obscureText,
      decoration: InputDecoration(
          border: border,
          labelText: labelName,
          hintText: hintName,
          errorText: showMessagError),
    );
  }
}
