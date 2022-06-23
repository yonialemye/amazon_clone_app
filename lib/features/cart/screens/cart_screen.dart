import 'package:amazon_clone_app/commons/widgets/custom_button.dart';
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
          SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                const CartSubTotal(),
                CustomButton(
                  text: "Click to buy (${user.cart.length} products)",
                  onPressed: () {},
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
