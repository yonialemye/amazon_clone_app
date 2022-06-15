import 'package:amazon_clone_app/constants/global_variables.dart';
import 'package:amazon_clone_app/features/auth/screens/signin_screen.dart';
import 'package:amazon_clone_app/features/auth/services/auth_services.dart';
import 'package:amazon_clone_app/provider/user_provider.dart';
import 'package:amazon_clone_app/routes.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => UserProvider()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final AuthService authService = AuthService();
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Amazon Clone',
      theme: ThemeData(
        scaffoldBackgroundColor: GlobalVariables.kBackgroundColor,
        appBarTheme: const AppBarTheme(
          elevation: 0,
        ),
        colorScheme: const ColorScheme.light(
          primary: GlobalVariables.kSecondaryColor,
        ),
      ),
      onGenerateRoute: (settings) => generateRoute(settings),
      home: const SigninScreen(),
    );
  }
}
