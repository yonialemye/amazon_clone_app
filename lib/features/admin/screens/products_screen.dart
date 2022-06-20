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
    Navigator.pushNamed(context, AddProductScreen.routeName).whenComplete(() => {
          fetchAllData(),
        });
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
  void didChangeDependencies() {
    fetchAllData();
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return productList == null
        ? const Loader()
        : Scaffold(
            body: GridView.builder(
              itemCount: productList!.length,
              shrinkWrap: true,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
              itemBuilder: (context, index) {
                final singleProduct = productList![index];
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
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
                        const SizedBox(width: 25),
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
                        const SizedBox(width: 15),
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
