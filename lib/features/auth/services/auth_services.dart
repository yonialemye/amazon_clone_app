import 'dart:convert';
import 'dart:developer';

import 'package:amazon_clone_app/constants/error_handling.dart';
import 'package:amazon_clone_app/constants/global_variables.dart';
import 'package:amazon_clone_app/constants/utils.dart';
import 'package:amazon_clone_app/features/home/screens/home_screen.dart';
import 'package:amazon_clone_app/models/user.dart';
import 'package:amazon_clone_app/provider/user_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthService {
  // register user
  Future<void> registerUser({
    required BuildContext context,
    required String name,
    required String email,
    required String password,
  }) async {
    try {
      User user = User(
        sId: '',
        name: name,
        email: email,
        password: password,
        address: '',
        type: '',
        token: '',
      );
      http.Response response = await http.post(
        Uri.parse("$uri/api/signup"),
        body: user.toJson(),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
      );

      httpErrorHandler(
        response: response,
        context: context,
        onSuccess: () {
          displaySnackBar(
            context,
            'Account created! Login with this credential.',
          );
        },
      );
    } catch (e) {
      displaySnackBar(context, e.toString());
    }
  }

  // login user
  Future<void> loginUser({
    required BuildContext context,
    required bool mounted,
    required String email,
    required String password,
  }) async {
    try {
      http.Response response = await http.post(
        Uri.parse("$uri/api/signin"),
        body: jsonEncode({
          "email": email,
          "password": password,
        }),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
      );
      httpErrorHandler(
        response: response,
        context: context,
        onSuccess: () async {
          SharedPreferences pref = await SharedPreferences.getInstance();
          if (!mounted) return;
          Provider.of<UserProvider>(context, listen: false).setUser(response.body);
          await pref.setString(xAuthToken, jsonDecode(response.body)['token']);
          if (!mounted) return;
          Navigator.pushNamedAndRemoveUntil(
            context,
            HomeScreen.routeName,
            (route) => false,
          );
        },
      );
    } catch (e) {
      displaySnackBar(context, e.toString());
    }
  }

  // getUserData
  Future<void> getUserData(BuildContext context, bool mounted) async {
    try {
      SharedPreferences preferences = await SharedPreferences.getInstance();
      String? token = preferences.getString(xAuthToken);

      if (token == null) {
        preferences.setString(xAuthToken, '');
      }
      var tokenResult = await http.post(
        Uri.parse('$uri/isTokenValid'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          xAuthToken: token!,
        },
      );

      var response = jsonDecode(tokenResult.body);

      if (response == true) {
        http.Response userResponse = await http.get(
          Uri.parse('$uri/'),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
            xAuthToken: token,
          },
        );
        if (!mounted) return;
        var userProvider = Provider.of<UserProvider>(context, listen: false);
        userProvider.setUser(userResponse.body);
      }
    } catch (e) {
      displaySnackBar(context, e.toString());
    }
  }
}
