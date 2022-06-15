import 'package:flutter/material.dart';

class SocialIconButton extends StatelessWidget {
  const SocialIconButton({
    Key? key,
    required this.iconData,
    required this.onPressed,
    this.iconColor,
    this.backgroundColor,
  }) : super(key: key);

  final IconData iconData;
  final VoidCallback onPressed;
  final Color? iconColor;
  final Color? backgroundColor;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(30),
      child: Material(
        color: backgroundColor ?? Colors.grey[200],
        child: IconButton(
          onPressed: onPressed,
          splashColor: Colors.transparent,
          padding: const EdgeInsets.all(15),
          icon: Icon(
            iconData,
            color: iconColor ?? Colors.black,
            size: 26,
          ),
        ),
      ),
    );
  }
}
