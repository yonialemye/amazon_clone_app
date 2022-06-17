import 'package:amazon_clone_app/constants/global_variables.dart';
import 'package:flutter/material.dart';

class DealOfTheDay extends StatelessWidget {
  const DealOfTheDay({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 10),
        const Padding(
          padding: EdgeInsets.only(left: 16),
          child: Text(
            'Deal of the day',
            style: TextStyle(
              color: Color(0xFF232f3f),
              fontWeight: FontWeight.bold,
              letterSpacing: 1,
              fontSize: 18,
            ),
          ),
        ),
        const SizedBox(height: 10),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Image.network(
            GlobalVariables.carouselImages[2],
            height: 160,
            fit: BoxFit.fitHeight,
          ),
        ),
        const SizedBox(height: 10),
        Row(
          children: [
            const SizedBox(width: 24),
            const Expanded(
              flex: 3,
              child: Text(
                'This is a sample discription about the product and am im fucking loving it',
                maxLines: 2,
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Text(
                    'Price:',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey,
                    ),
                  ),
                  SizedBox(height: 5),
                  Text(
                    '\$287.99',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 24),
          ],
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              Image.network(
                GlobalVariables.carouselImages[0],
                width: 200,
                fit: BoxFit.fitWidth,
              ),
              SizedBox(width: 10),
              Image.network(
                GlobalVariables.carouselImages[0],
                width: 200,
                fit: BoxFit.fitWidth,
              ),
              SizedBox(width: 10),
              Image.network(
                GlobalVariables.carouselImages[0],
                width: 200,
                fit: BoxFit.fitWidth,
              ),
              SizedBox(width: 10),
              Image.network(
                GlobalVariables.carouselImages[0],
                width: 200,
                fit: BoxFit.fitWidth,
              ),
            ],
          ),
        )
      ],
    );
  }
}
