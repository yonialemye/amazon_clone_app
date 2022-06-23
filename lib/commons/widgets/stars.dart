import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import '../../constants/global_variables.dart';

class Stars extends StatelessWidget {
  final double rating;
  const Stars({
    Key? key,
    required this.rating,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RatingBarIndicator(
      rating: rating,
      unratedColor: Colors.grey[300],
      itemSize: 20,
      itemBuilder: (context, _) => const Icon(
        Icons.star,
        color: GlobalVariables.kSecondaryColor,
      ),
    );
  }
}
