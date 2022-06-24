import 'package:amazon_clone_app/commons/widgets/custom_button.dart';
import 'package:amazon_clone_app/features/cart/widgets/cart_product.dart';
import 'package:amazon_clone_app/features/cart/widgets/cart_subtotal.dart';
import 'package:amazon_clone_app/features/home/widgets/address_box.dart';
import 'package:amazon_clone_app/models/user.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../provider/user_provider.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    final User user = context.watch<UserProvider>().user;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF232f3f),
        centerTitle: true,
        title: const Text('Cart'),
      ),
      body: Column(
        children: [
          const AddressBox(),
          Expanded(
            child: Column(
              children: [
                const CartSubTotal(),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: CustomButton(
                    text: "Click to buy (${user.cart.length} products)",
                    onPressed: () {},
                  ),
                ),
                const SizedBox(height: 10),
                Expanded(
                  child: ListView.builder(
                    shrinkWrap: true,
                    physics: const BouncingScrollPhysics(),
                    itemCount: user.cart.length,
                    itemBuilder: (context, index) {
                      return CartProduct(index: index);
                    },
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
