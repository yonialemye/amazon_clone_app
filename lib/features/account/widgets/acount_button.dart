import 'package:flutter/material.dart';

class AccountButton extends StatelessWidget {
  const AccountButton({Key? key, required this.text, required this.onTap}) : super(key: key);

  final String text;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 10),
        child: Material(
          borderRadius: BorderRadius.circular(30),
          elevation: 2,
          child: InkWell(
            splashColor: Colors.transparent,
            onTap: onTap,
            borderRadius: BorderRadius.circular(30),
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Center(
                child: Text(
                  text,
                  style: const TextStyle(color: Color(0xFF232f3f)),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
