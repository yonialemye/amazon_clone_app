import 'package:flutter/material.dart';

enum ProductLayout { horizontal, vertical }

class SingleProduct extends StatelessWidget {
  const SingleProduct({
    Key? key,
    required this.imageSrc,
    this.child,
    this.layout = ProductLayout.vertical,
  }) : super(key: key);
  final String imageSrc;
  final Widget? child;
  final Enum? layout;

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
      child: layout == ProductLayout.vertical
          ? Column(
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
            )
          : Row(
              children: [
                Container(
                  height: 120,
                  width: 140,
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
