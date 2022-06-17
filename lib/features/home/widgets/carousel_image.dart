import 'package:amazon_clone_app/constants/global_variables.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class CarouselImage extends StatelessWidget {
  const CarouselImage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      items: GlobalVariables.carouselImages
          .map((e) => Builder(
                builder: (context) => ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.network(
                    e,
                    height: 190,
                    fit: BoxFit.cover,
                  ),
                ),
              ))
          .toList(),
      options: CarouselOptions(
        viewportFraction: 0.80,
        height: 190,
        padEnds: true,
        autoPlay: true,
        enlargeCenterPage: true,
        autoPlayCurve: Curves.decelerate,
      ),
    );
  }
}
