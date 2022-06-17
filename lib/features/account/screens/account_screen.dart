import 'package:amazon_clone_app/features/account/widgets/menu_buttons.dart';
import 'package:amazon_clone_app/features/account/widgets/orders.dart';
import 'package:flutter/material.dart';

import '../widgets/app_bar_second.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF232f3f),
        toolbarHeight: kToolbarHeight,
        title: Column(
          children: [
            const SizedBox(height: 15),
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
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          AppBarSecond(),
          MenuButtons(),
          Orders(),
        ],
      ),
    );
  }
}
