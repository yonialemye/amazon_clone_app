import 'dart:developer';

import 'package:amazon_clone_app/commons/widgets/loader.dart';
import 'package:amazon_clone_app/features/account/widgets/single_product.dart';
import 'package:amazon_clone_app/features/admin/screens/add_product_screen.dart';
import 'package:amazon_clone_app/features/admin/services/admin_services.dart';
import 'package:flutter/material.dart';

import '../../../constants/global_variables.dart';
import '../../../models/product.dart';

class ProductScreen extends StatefulWidget {
  const ProductScreen({Key? key}) : super(key: key);

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  final AdminServices adminServices = AdminServices();

  List<Product>? productList;

  fetchAllData() async {
    productList = await adminServices.fetchAllProduct(context);
    setState(() {});
  }

  void gotoAddProductScreen(BuildContext context) {
    Navigator.pushNamed(context, AddProductScreen.routeName);
  }

  void deleteProduct(Product product, int index) {
    adminServices.deleteProduct(
      context: context,
      product: product,
      onSuccess: () {
        productList!.removeAt(index);
        setState(() {});
      },
    );
  }

  @override
  void initState() {
    fetchAllData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return productList == null
        ? const Loader()
        : Scaffold(
            body: GridView.builder(
              itemCount: productList!.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
              itemBuilder: (context, index) {
                final singleProduct = productList![index];
                return Column(
                  children: [
                    SizedBox(
                      height: 140,
                      child: SingleProduct(
                        imageSrc: singleProduct.images[0],
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Expanded(
                          child: Text(
                            singleProduct.name,
                            overflow: TextOverflow.ellipsis,
                            maxLines: 2,
                          ),
                        ),
                        IconButton(
                          onPressed: () => deleteProduct(singleProduct, index),
                          icon: const Icon(Icons.delete_outline),
                        ),
                      ],
                    ),
                  ],
                );
              },
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
