import 'dart:io';

import 'package:amazon_clone_app/constants/error_handling.dart';
import 'package:amazon_clone_app/constants/utils.dart';
import 'package:amazon_clone_app/models/product.dart';
import 'package:amazon_clone_app/provider/user_provider.dart';
import 'package:cloudinary_public/cloudinary_public.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

import '../../../constants/global_variables.dart';

class AdminServices {
  void sellProduct({
    required BuildContext context,
    required String name,
    required String description,
    required double price,
    required double quantity,
    required String category,
    required List<File> images,
  }) async {
    final userProvider = Provider.of<UserProvider>(context, listen: false);
    try {
      final cloudinary = CloudinaryPublic('yonasalem', 'zewyifmo');
      List<String> imageUrl = [];
      for (int i = 0; i < images.length; i++) {
        var res = await cloudinary.uploadFile(
          CloudinaryFile.fromFile(images[i].path, folder: name),
        );
        imageUrl.add(res.secureUrl);
      }

      Product product = Product(
        name: name,
        description: description,
        quantity: quantity,
        images: imageUrl,
        category: category,
        price: price,
      );

      var response = await http.post(
        Uri.parse('$uri/admin/add-product'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          xAuthToken: userProvider.user.token,
        },
        body: product.toJson(),
      );

      httpErrorHandler(
        response: response,
        context: context,
        onSuccess: () {
          displaySnackBar(context, "Product added successfully!");
          Navigator.pop(context);
        },
      );
    } catch (e) {
      displaySnackBar(context, e.toString());
    }
  }
}
