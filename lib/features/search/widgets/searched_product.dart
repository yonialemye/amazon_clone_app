import 'package:amazon_clone_app/models/product.dart';
import 'package:flutter/cupertino.dart';

class SearchedProduct extends StatelessWidget {
  final Product product;
  const SearchedProduct({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 10),
          child: Row(
            children: [
              Image.network(
                product.images[0],
                fit: BoxFit.fitHeight,
                height: 135,
                width: 135,
              ),
              Expanded(
                child: Column(
                  children: [
                    Container(
                      width: 235,
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Text(
                        product.name,
                        maxLines: 2,
                        style: const TextStyle(fontSize: 16),
                      ),
                    ),
                    Container(
                      width: 235,
                      padding: const EdgeInsets.only(left: 10, top: 5),
                      child: Text(
                        product.name,
                        maxLines: 2,
                        style: const TextStyle(fontSize: 16),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
