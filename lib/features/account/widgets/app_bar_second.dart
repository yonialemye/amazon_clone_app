import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../constants/global_variables.dart';
import '../../../provider/user_provider.dart';

class AppBarSecond extends StatelessWidget {
  const AppBarSecond({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserProvider>(context).user;
    return Container(
      height: kToolbarHeight,
      width: double.maxFinite,
      color: const Color(0xFF232f3f),
      child: Row(
        children: [
          const SizedBox(width: 28),
          Text(
            'Hello, ${user.name}',
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
          const Spacer(),
          const Text(
            'User',
            style: TextStyle(
              color: GlobalVariables.kSecondaryColor,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(width: 15),
        ],
      ),
    );
  }
}
