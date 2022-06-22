import 'package:amazon_clone_app/commons/widgets/loader.dart';
import 'package:amazon_clone_app/features/detail/product_detail_screen.dart';
import 'package:amazon_clone_app/features/home/widgets/address_box.dart';
import 'package:amazon_clone_app/features/search/services/search_services.dart';
import 'package:amazon_clone_app/features/search/widgets/searched_product.dart';
import 'package:amazon_clone_app/models/product.dart';
import 'package:flutter/material.dart';

import '../../../constants/global_variables.dart';

class SearchScreen extends StatefulWidget {
  static const String routeName = '/search-screen';
  final String searchQuery;
  const SearchScreen({Key? key, required this.searchQuery}) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  SearchServices searchServices = SearchServices();
  List<Product>? product;

  @override
  void initState() {
    fetchSearchedProducts();
    super.initState();
  }

  fetchSearchedProducts() async {
    product = await searchServices.fetchSearchedProduct(
      context: context,
      searchQuery: widget.searchQuery,
    );
    setState(() {});
  }

  navigateToSearchScreen(String query) {
    Navigator.of(context).pushNamed(SearchScreen.routeName, arguments: query);
  }

  navigateToProductDetailScreen(Product product) {
    Navigator.of(context).pushNamed(ProductDetailScreen.routeName, arguments: product);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF232f3f),
        toolbarHeight: kToolbarHeight,
        centerTitle: true,
        title: Column(
          children: [
            const SizedBox(height: 15),
            Image.asset(
              'assets/images/amazon_in.png',
              height: 45,
              color: Colors.white,
            ),
          ],
        ),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(55.0),
          child: Container(
            height: 48,
            margin: const EdgeInsets.only(left: 20, right: 20, bottom: 10, top: 10),
            child: TextFormField(
              onFieldSubmitted: navigateToSearchScreen,
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.all(2),
                border: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(20),
                  ),
                ),
                focusedBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: GlobalVariables.kSecondaryColor),
                  borderRadius: BorderRadius.all(
                    Radius.circular(20),
                  ),
                ),
                fillColor: Colors.white,
                filled: true,
                hintText: 'What are you looking for?',
                isDense: true,
                prefixIcon: const Icon(Icons.search),
                suffixIcon: Container(
                  margin: const EdgeInsets.only(left: 0, right: 10, top: 5, bottom: 5),
                  decoration: BoxDecoration(
                    color: GlobalVariables.kSecondaryColor,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: IconButton(
                    onPressed: () {},
                    constraints: const BoxConstraints(),
                    icon: const Icon(
                      Icons.keyboard_voice_outlined,
                      color: Colors.white,
                      size: 16,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
      body: product == null
          ? const Loader()
          : Column(
              children: [
                const AddressBox(),
                const SizedBox(height: 10),
                Expanded(
                  child: ListView.builder(
                    itemCount: product!.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () => navigateToProductDetailScreen(product![index]),
                        child: SearchedProduct(
                          product: product![index],
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
