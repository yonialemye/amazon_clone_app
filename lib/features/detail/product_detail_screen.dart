import 'package:amazon_clone_app/commons/widgets/custom_button.dart';
import 'package:amazon_clone_app/commons/widgets/stars.dart';
import 'package:amazon_clone_app/constants/global_variables.dart';
import 'package:amazon_clone_app/features/detail/services/product_detail_services.dart';
import 'package:amazon_clone_app/provider/user_provider.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:provider/provider.dart';
import 'package:readmore/readmore.dart';

import '../../models/product.dart';

class ProductDetailScreen extends StatefulWidget {
  static const String routeName = '/product-detail';
  final Product product;
  const ProductDetailScreen({Key? key, required this.product}) : super(key: key);

  @override
  State<ProductDetailScreen> createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  final ProductDetailServices productDetailServices = ProductDetailServices();

  double averageRating = 0;
  double myRating = 0;

  @override
  void initState() {
    double totalRating = 0;

    for (int i = 0; i < widget.product.ratings!.length; i++) {
      totalRating += widget.product.ratings![i].rating;
      if (widget.product.ratings![i].userId ==
          Provider.of<UserProvider>(context, listen: false).user.sId) {
        myRating = widget.product.ratings![i].rating;
      }
    }

    if (totalRating != 0) {
      averageRating = totalRating / widget.product.ratings!.length;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 0,
        backgroundColor: Colors.grey[200],
      ),
      body: Column(
        children: [
          Stack(
            children: [
              Container(
                width: double.maxFinite,
                height: 280,
                padding: const EdgeInsets.only(top: 50, bottom: 20),
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(30),
                    bottomRight: Radius.circular(30),
                  ),
                ),
                child: CarouselSlider(
                  items: widget.product.images
                      .map(
                        (e) => Builder(
                          builder: (context) => ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image.network(e),
                          ),
                        ),
                      )
                      .toList(),
                  options: CarouselOptions(
                    padEnds: true,
                    autoPlay: true,
                    enlargeCenterPage: true,
                    autoPlayCurve: Curves.decelerate,
                    viewportFraction: 1,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Row(
                  children: [
                    const SizedBox(width: 20),
                    const BackButton(),
                    const Spacer(),
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.favorite_outline),
                    ),
                    const SizedBox(width: 20),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          Expanded(
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            widget.product.name,
                            maxLines: 2,
                            style: const TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Stars(rating: averageRating)
                        ],
                      ),
                      const SizedBox(height: 10),
                      Row(
                        children: [
                          Text(
                            'price: ',
                            maxLines: 2,
                            style: TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.w500,
                              color: Colors.grey[700],
                            ),
                          ),
                          Text(
                            "ETB: ${widget.product.price}",
                            maxLines: 2,
                            style: const TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const Spacer(),
                          Text(
                            "${widget.product.quantity.toInt()} pieces left.",
                            style: TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.w500,
                              color: Colors.grey[700],
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),
                      const Text(
                        'Description',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 10),
                      ReadMoreText(
                        "${widget.product.description} ooo" * 45,
                        trimLength: 520,
                        style: const TextStyle(fontSize: 15),
                        moreStyle: const TextStyle(
                          color: GlobalVariables.kSecondaryColor,
                          fontSize: 18,
                        ),
                        lessStyle: const TextStyle(
                          color: GlobalVariables.kSecondaryColor,
                          fontSize: 18,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    'Rate The Product',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 10),
                  RatingBar.builder(
                    initialRating: myRating,
                    minRating: 1,
                    glow: true,
                    glowColor: GlobalVariables.kSecondaryColor,
                    unratedColor: Colors.grey[300],
                    itemPadding: const EdgeInsets.symmetric(horizontal: 5),
                    glowRadius: 1,
                    allowHalfRating: true,
                    itemBuilder: (context, _) => const Icon(
                      Icons.star,
                      color: GlobalVariables.kSecondaryColor,
                    ),
                    onRatingUpdate: (rating) {
                      productDetailServices.rateProduct(
                        context: context,
                        product: widget.product,
                        rating: rating,
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: Row(
              children: [
                Expanded(
                  child: CustomButton(
                    text: 'Buy now',
                    onPressed: () {},
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: CustomButton(
                    text: 'Add to cart',
                    color: Colors.orange[900],
                    onPressed: () {},
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
