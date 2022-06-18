import 'dart:io';

import 'package:amazon_clone_app/constants/utils.dart';
import 'package:amazon_clone_app/models/product.dart';
import 'package:cloudinary_public/cloudinary_public.dart';
import 'package:flutter/material.dart';

void sellProduct({
  required BuildContext context,
  required String name,
  required String description,
  required double price,
  required double quantity,
  required String category,
  required List<File> images,
}) async {
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
  } catch (e) {
    displaySnackBar(context, e.toString());
  }
}
