import 'package:amazon_clone_app/features/admin/screens/products_screen.dart';
import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:flutter/material.dart';

import '../../../constants/global_variables.dart';

class AdminScreen extends StatefulWidget {
  const AdminScreen({Key? key}) : super(key: key);

  @override
  State<AdminScreen> createState() => _AdminScreenState();
}

class _AdminScreenState extends State<AdminScreen> {
  int _currentIndex = 0;

  List<Widget> pages = [
    const ProductScreen(),
    const Center(child: Text('Analytics page')),
    const Center(child: Text('Cart page')),
  ];

  void changePage(pageIndex) {
    setState(() => _currentIndex = pageIndex);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF232f3f),
        toolbarHeight: kToolbarHeight,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Image.asset(
              'assets/images/amazon_in.png',
              height: 45,
              color: Colors.white,
            ),
            const Text(
              'Admin',
              style: TextStyle(
                color: GlobalVariables.kSecondaryColor,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        actions: const [],
      ),
      body: pages[_currentIndex],
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            boxShadow: const [
              BoxShadow(
                color: Colors.black12,
                blurRadius: 4,
                spreadRadius: 1,
                offset: Offset(0, 3),
              ),
            ],
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: BottomNavyBar(
              onItemSelected: changePage,
              selectedIndex: _currentIndex,
              showElevation: false,
              backgroundColor: Colors.white,
              items: [
                _bottonNavyBarItem(iconData: Icons.home_outlined, text: 'Products'),
                _bottonNavyBarItem(iconData: Icons.analytics_outlined, text: 'Anlaytics'),
                _bottonNavyBarItem(iconData: Icons.all_inbox_outlined, text: 'Cart'),
              ],
            ),
          ),
        ),
      ),
    );
  }

  BottomNavyBarItem _bottonNavyBarItem({required IconData iconData, required String text}) {
    return BottomNavyBarItem(
      activeColor: GlobalVariables.kSecondaryColor,
      textAlign: TextAlign.center,
      inactiveColor: Colors.grey[600],
      icon: Padding(
        padding: const EdgeInsets.only(left: 8.0),
        child: Icon(iconData),
        // child: Icon(iconData),
      ),
      title: Text(text),
    );
  }
}
