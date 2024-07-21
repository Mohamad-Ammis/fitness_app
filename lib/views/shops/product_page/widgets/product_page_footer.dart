
import 'package:fitnessapp/constans.dart';
import 'package:flutter/material.dart';

class ProductPageFooter extends StatelessWidget {
  const ProductPageFooter({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
            width: 60,
            height: 60,
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(16)),
            child: const Center(
                child: Icon(
              Icons.favorite,
              color: Colors.white,
            ))),
        const SizedBox(
          width: 20,
        ),
        Expanded(
          child: Container(
              width: 200,
              height: 60,
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(16)),
              child: const Center(
                child: Text(
                  "Add To Cart",
                  style: TextStyle(
                      color: Colors.white,
                      fontFamily: Constans.fontFamily,
                      fontSize: 24,
                      fontWeight: FontWeight.bold),
                ),
              )),
        ),
      ],
    );
  }
}
