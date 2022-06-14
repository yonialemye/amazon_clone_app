import 'dart:convert';

import 'package:amazon_clone_app/constants/error_handling.dart';
import 'package:amazon_clone_app/constants/global_variables.dart';
import 'package:amazon_clone_app/constants/utils.dart';
import 'package:amazon_clone_app/models/user.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

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
      );
      http.Response response = await http.post(
        Uri.parse("$uri/api/signup"),
        body: jsonEncode(user),
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
      print(response.body);

      httpErrorHandler(
        response: response,
        context: context,
        onSuccess: () {},
      );
    } catch (e) {
      displaySnackBar(context, e.toString());
    }
  }
}
