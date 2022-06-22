import 'package:flutter/material.dart';

class SingleProduct extends StatelessWidget {
  const SingleProduct({Key? key, required this.imageSrc, this.child}) : super(key: key);
  final String imageSrc;
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            spreadRadius: 0.2,
            blurRadius: 8,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        children: [
          Container(
            height: 120,
            width: double.maxFinite,
            padding: const EdgeInsets.all(5),
            decoration: BoxDecoration(
              color: Colors.grey[200],
              borderRadius: BorderRadius.circular(10),
            ),
            child: Image.network(imageSrc),
          ),
          if (child != null)
            Expanded(
              child: Container(
                padding: const EdgeInsets.all(10),
                child: child,
              ),
            ),
        ],
      ),
    );
  }
}
