import 'dart:convert';

import 'package:amazon_clone_app/models/product.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../constants/error_handling.dart';
import '../../../constants/global_variables.dart';
import '../../../constants/utils.dart';
import '../../../provider/user_provider.dart';
import 'package:http/http.dart' as http;

class ProductDetailServices {
  void rateProduct({
    required BuildContext context,
    required Product product,
    required double rating,
  }) async {
    final userProvider = Provider.of<UserProvider>(context, listen: false);
    try {
      var response = await http.post(
        Uri.parse('$uri/api/rate-product'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          xAuthToken: userProvider.user.token,
        },
        body: jsonEncode({
          "id": product.id!,
          "rating": rating,
        }),
      );
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
