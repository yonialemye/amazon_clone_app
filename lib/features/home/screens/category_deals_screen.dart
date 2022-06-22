import 'package:amazon_clone_app/commons/widgets/loader.dart';
import 'package:amazon_clone_app/features/account/widgets/single_product.dart';
import 'package:amazon_clone_app/features/home/services/home_services.dart';
import 'package:amazon_clone_app/models/product.dart';
import 'package:flutter/material.dart';

class CategoryDealsScreen extends StatefulWidget {
  static const routeName = '/category-deals';
  const CategoryDealsScreen({Key? key, required this.category}) : super(key: key);

  final String category;

  @override
  State<CategoryDealsScreen> createState() => _CategoryDealsScreenState();
}

class _CategoryDealsScreenState extends State<CategoryDealsScreen> {
  final HomeServices homeServices = HomeServices();

  List<Product>? productList;

  @override
  void initState() {
    fetchCategoryProducts();
    super.initState();
  }

  fetchCategoryProducts() async {
    productList = await homeServices.fetchCategoryProduct(
      context: context,
      category: widget.category,
    );

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF232f3f),
        centerTitle: true,
        title: Text(widget.category),
      ),
      body: productList == null
          ? const Loader()
          : Column(
              children: [
                if (productList!.isNotEmpty)
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                    alignment: Alignment.topLeft,
                    child: Text(
                      'Keep shopping for ${widget.category}',
                      style: const TextStyle(fontSize: 20),
                    ),
                  ),
                if (productList!.isEmpty)
                  Column(
                    children: [
                      const SizedBox(
                        width: double.maxFinite,
                        height: 200,
                      ),
                      Image.asset(
                        'assets/images/empty.png',
                        height: 300,
                      ),
                      const SizedBox(height: 20),
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 30),
                        child: Text(
                          "Their is no product in this category!",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                            color: Colors.grey,
                          ),
                        ),
                      ),
                    ],
                  )
                else
                  Expanded(
                    child: GridView.builder(
                      itemCount: productList!.length,
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 16,
                        mainAxisSpacing: 16,
                        childAspectRatio: 0.7,
                      ),
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        final product = productList![index];
                        return SingleProduct(
                          imageSrc: product.images[0],
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const SizedBox(width: double.maxFinite),
                              Text(
                                product.name,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: const TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              const SizedBox(height: 10),
                              Text(
                                "ETB: ${product.price.toString()}",
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              const SizedBox(height: 10),
                              Text(
                                "${product.quantity.toInt().toString()} Pieces left.",
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
              ],
            ),
    );
  }
}
