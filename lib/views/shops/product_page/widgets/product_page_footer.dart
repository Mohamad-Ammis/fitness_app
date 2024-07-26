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
                color: Colors.transparent,
                border: Border.all(color: Colors.black),
                borderRadius: BorderRadius.circular(999)),
            child: const Center(
                child: Icon(
              Icons.add,
              color: Colors.black,
              size: 32,
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
                  color: Colors.black, borderRadius: BorderRadius.circular(16)),
              child: const Center(
                child: Text(
                  "Buy now",
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
