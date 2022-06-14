import 'dart:convert';

import 'package:amazon_clone_app/constants/utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

void httpErrorHandler({
  required http.Response response,
  required BuildContext context,
  required VoidCallback onSuccess,
}) {
  switch (response.statusCode) {
    case 200:
      onSuccess();
      break;
    case 400:
      displaySnackBar(
        context,
        jsonDecode(response.body)['msg'],
      );
      break;
    case 500:
      displaySnackBar(
        context,
        jsonDecode(response.body)['error'],
      );
      break;
    default:
      displaySnackBar(
        context,
        jsonDecode(response.body),
      );
  }
}
