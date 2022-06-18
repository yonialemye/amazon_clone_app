import 'package:amazon_clone_app/features/admin/screens/add_product_screen.dart';
import 'package:flutter/material.dart';

import '../../../constants/global_variables.dart';

class ProductScreen extends StatelessWidget {
  const ProductScreen({Key? key}) : super(key: key);

  void gotoAddProductScreen(BuildContext context) {
    Navigator.pushNamed(context, AddProductScreen.routeName);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const Center(
        child: Text('Products'),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: GlobalVariables.kSecondaryColor,
        onPressed: () => gotoAddProductScreen(context),
        tooltip: 'Add a product',
        child: const Icon(Icons.add),
      ),
    );
  }
}
