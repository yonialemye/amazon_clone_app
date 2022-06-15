import 'package:flutter/material.dart';

class CustomTextButton extends StatelessWidget {
  const CustomTextButton({
    Key? key,
    required this.onPressed,
    required this.text,
    required this.buttonColor,
  }) : super(key: key);
  final VoidCallback onPressed;
  final String text;
  final Color buttonColor;
  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      child: Text(
        text,
        style: TextStyle(
          color: buttonColor,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
