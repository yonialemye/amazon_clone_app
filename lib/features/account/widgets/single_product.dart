import 'package:flutter/material.dart';

class SingleProduct extends StatelessWidget {
  const SingleProduct({Key? key, required this.imageSrc}) : super(key: key);
  final String imageSrc;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      child: DecoratedBox(
        decoration: BoxDecoration(
          border: Border.all(color: Colors.black12, width: 1),
          boxShadow: const [
            BoxShadow(
              color: Colors.black12,
              spreadRadius: 1,
              blurRadius: 10,
              offset: Offset(0, 3),
            )
          ],
        ),
        child: Image.network(
          imageSrc,
          fit: BoxFit.fitHeight,
        ),
      ),
    );
  }
}
