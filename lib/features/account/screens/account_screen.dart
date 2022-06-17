import 'package:amazon_clone_app/constants/global_variables.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../provider/user_provider.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserProvider>(context).user;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF232f3f),
        toolbarHeight: kToolbarHeight,
        title: Column(
          children: [
            SizedBox(height: 15),
            Image.asset(
              'assets/images/amazon_in.png',
              height: 45,
              color: Colors.white,
            ),
          ],
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.notifications_outlined),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.search_outlined),
          ),
        ],
      ),
      body: Column(
        children: [
          Container(
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
                  'Admin',
                  style: TextStyle(
                    color: GlobalVariables.kSecondaryColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(width: 15),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
