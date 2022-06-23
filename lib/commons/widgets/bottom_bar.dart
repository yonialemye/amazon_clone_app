import 'package:amazon_clone_app/constants/global_variables.dart';
import 'package:amazon_clone_app/features/account/screens/account_screen.dart';
import 'package:amazon_clone_app/features/home/screens/home_screen.dart';
import 'package:amazon_clone_app/provider/user_provider.dart';
import 'package:badges/badges.dart';
import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BottomBar extends StatefulWidget {
  static const String routeName = '/actual-home';
  const BottomBar({Key? key}) : super(key: key);

  @override
  State<BottomBar> createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  int _currentIndex = 0;

  List<Widget> pages = [
    const HomeScreen(),
    const Center(child: Text('Cart page')),
    const AccountScreen(),
  ];

  void changePage(pageIndex) {
    setState(() => _currentIndex = pageIndex);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                _bottonNavyBarItem(iconData: Icons.home_outlined, text: 'Home'),
                _bottonNavyBarItem(
                  iconData: Icons.shopping_cart_outlined,
                  text: 'Cart',
                  haveBadges: true,
                ),
                _bottonNavyBarItem(iconData: Icons.person_outline, text: 'Profile'),
              ],
            ),
          ),
        ),
      ),
    );
  }

  BottomNavyBarItem _bottonNavyBarItem({
    required IconData iconData,
    required String text,
    bool haveBadges = false,
  }) {
    final userCartLength = context.watch<UserProvider>().user.cart.length;
    return BottomNavyBarItem(
      activeColor: GlobalVariables.kSecondaryColor,
      textAlign: TextAlign.center,
      inactiveColor: Colors.grey[600],
      icon: Padding(
        padding: const EdgeInsets.only(left: 8.0),
        child: haveBadges
            ? Badge(
                elevation: 0,
                animationType: BadgeAnimationType.scale,
                badgeColor: Colors.red.shade400,
                badgeContent: Text(
                  userCartLength.toString(),
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 10,
                  ),
                ),
                child: Icon(iconData),
              )
            : Icon(iconData),
        // child: Icon(iconData),
      ),
      title: Text(text),
    );
  }
}
