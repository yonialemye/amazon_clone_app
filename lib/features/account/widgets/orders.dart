import 'package:amazon_clone_app/constants/global_variables.dart';
import 'package:amazon_clone_app/features/account/widgets/single_product.dart';
import 'package:flutter/cupertino.dart';

class Orders extends StatefulWidget {
  const Orders({Key? key}) : super(key: key);

  @override
  State<Orders> createState() => _OrdersState();
}

class _OrdersState extends State<Orders> {
  List products = [
    GlobalVariables.carouselImages[0],
    GlobalVariables.carouselImages[1],
    GlobalVariables.carouselImages[2],
    GlobalVariables.carouselImages[3],
  ];
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: const [
            SizedBox(width: 16),
            Text(
              'Your orders',
              style: TextStyle(
                color: Color(0xFF232f3f),
                fontWeight: FontWeight.bold,
                letterSpacing: 1,
                fontSize: 18,
              ),
            ),
            Spacer(),
            Text(
              'View all',
              style: TextStyle(
                color: GlobalVariables.kSecondaryColor,
                fontWeight: FontWeight.bold,
                letterSpacing: 1,
                fontSize: 14,
              ),
            ),
            SizedBox(width: 16),
          ],
        ),
        SizedBox(
          height: 170,
          child: ListView.builder(
            itemCount: products.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return Image.network(
                products[index],
              );
            },
          ),
        ),
      ],
    );
  }
}
