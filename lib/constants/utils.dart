import 'package:flutter/material.dart';

void displaySnackBar(BuildContext context, String snackMessage) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(content: Text(snackMessage)),
  );
}
