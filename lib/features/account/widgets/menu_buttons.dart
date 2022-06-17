import 'package:amazon_clone_app/features/account/widgets/acount_button.dart';
import 'package:flutter/material.dart';

class MenuButtons extends StatefulWidget {
  const MenuButtons({Key? key}) : super(key: key);

  @override
  State<MenuButtons> createState() => _MenuButtonsState();
}

class _MenuButtonsState extends State<MenuButtons> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
            boxShadow: const [
              BoxShadow(
                color: Colors.black12,
                spreadRadius: 1,
                blurRadius: 10,
                offset: Offset(0, 0),
              )
            ]),
        child: Column(
          children: [
            const Text(
              'Menu',
              style: TextStyle(
                color: Color(0xFF232f3f),
                fontWeight: FontWeight.bold,
                letterSpacing: 1,
                fontSize: 18,
              ),
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                AccountButton(
                  text: 'Your orders',
                  onTap: () {},
                ),
                AccountButton(
                  text: 'Turn seller',
                  onTap: () {},
                ),
              ],
            ),
            const SizedBox(height: 15),
            Row(
              children: [
                AccountButton(
                  text: 'Wishlist',
                  onTap: () {},
                ),
                AccountButton(
                  text: 'Logout',
                  onTap: () {},
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
