import 'dart:convert';
import 'dart:developer';

import 'package:amazon_clone_app/models/product.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

import '../../../constants/error_handling.dart';
import '../../../constants/global_variables.dart';
import '../../../constants/utils.dart';
import '../../../provider/user_provider.dart';

class HomeServices {
  Future<List<Product>> fetchCategoryProduct({
    required BuildContext context,
    required String category,
  }) async {
    final userProvider = Provider.of<UserProvider>(context, listen: false);
    List<Product> productList = [];
    try {
      http.Response response = await http.get(
        Uri.parse("$uri/api/products?category=$category"),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          xAuthToken: userProvider.user.token,
        },
      );

      httpErrorHandler(
        response: response,
        context: context,
        onSuccess: () {
          for (int i = 0; i < jsonDecode(response.body).length; i++) {
            productList.add(
              Product.fromJson(
                jsonEncode(jsonDecode(response.body)[i]),
              ),
            );
          }
        },
      );
    } catch (e) {
      displaySnackBar(context, e.toString());
    }
    return productList;
  }

  Future<Product> fetchDealOfTheDay({required BuildContext context}) async {
    final userProvider = Provider.of<UserProvider>(context, listen: false);
    Product product = Product(
      name: '',
      description: '',
      quantity: 0,
      images: [],
      category: '',
      price: 0,
    );
    try {
      http.Response response = await http.get(
        Uri.parse("$uri/api/deal-of-day"),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          xAuthToken: userProvider.user.token,
        },
      );

      httpErrorHandler(
        response: response,
        context: context,
        onSuccess: () {
          product = Product.fromJson(response.body);
        },
      );
    } catch (e) {
      displaySnackBar(context, e.toString());
    }
    return product;
  }
}
