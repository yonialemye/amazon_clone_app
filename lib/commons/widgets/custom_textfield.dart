import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    Key? key,
    required this.controller,
    required this.hintText,
    required this.errorMessage,
    this.isPassword = false,
    this.maxLines = 1,
  }) : super(key: key);

  final TextEditingController controller;
  final String hintText;
  final String errorMessage;
  final bool isPassword;
  final int maxLines;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      validator: (value) {
        if (value == null || value.isEmpty) return errorMessage;
        return null;
      },
      maxLines: maxLines,
      obscureText: isPassword,
      enableSuggestions: isPassword,
      autocorrect: isPassword,
      keyboardType: isPassword ? TextInputType.visiblePassword : TextInputType.emailAddress,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.all(15),
        hintText: hintText,
        hintStyle: TextStyle(
          color: Colors.grey.withOpacity(0.7),
        ),
        isDense: true,
        fillColor: Colors.grey[200],
        filled: true,
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.grey[400]!),
          borderRadius: BorderRadius.circular(30),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.grey[300]!),
          borderRadius: BorderRadius.circular(30),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.red[300]!),
          borderRadius: BorderRadius.circular(30),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.red[300]!),
          borderRadius: BorderRadius.circular(30),
        ),
      ),
    );
  }
}
