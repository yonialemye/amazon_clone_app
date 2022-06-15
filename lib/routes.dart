import 'package:amazon_clone_app/features/auth/screens/signup_screen.dart';
import 'package:amazon_clone_app/features/auth/screens/signin_screen.dart';
import 'package:amazon_clone_app/features/home/screens/home_screen.dart';
import 'package:flutter/material.dart';

Route<dynamic> generateRoute(RouteSettings routeSettings) {
  switch (routeSettings.name) {
    case SigninScreen.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const SigninScreen(),
      );
    case SignupScreen.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const SignupScreen(),
      );
    case HomeScreen.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const HomeScreen(),
      );
    default:
      return MaterialPageRoute(
        builder: (_) => const Scaffold(
          body: Center(
            child: Text('Screen does not exist'),
          ),
        ),
      );
  }
}
