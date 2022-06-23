import 'package:amazon_clone_app/models/user.dart';
import 'package:amazon_clone_app/provider/user_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

class CartSubTotal extends StatelessWidget {
  const CartSubTotal({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final User user = context.watch<UserProvider>().user;

    num sum = 0;

    user.cart
        .map(
          (e) => sum += e['quantity'] * e['product']['price'].toInt(),
        )
        .toList();
    return Container(
      margin: const EdgeInsets.all(20),
      child: Row(
        children: [
          const Text(
            'Cart subtotal: ',
            style: TextStyle(
              fontSize: 18,
            ),
          ),
          Text(
            "\$$sum",
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          )
        ],
      ),
    );
  }
}
