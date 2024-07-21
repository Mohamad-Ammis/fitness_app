import 'package:fitnessapp/constans.dart';
import 'package:flutter/material.dart';

class CartProductCounter extends StatelessWidget {
  const CartProductCounter({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
            padding: const EdgeInsets.all(2),
            decoration: BoxDecoration(
                color: Colors.black.withOpacity(.05),
                borderRadius: BorderRadius.circular(6)),
            child: const Icon(
              Icons.remove,
              color: Constans.shopColor,
            )),
        const SizedBox(
          width: 15,
        ),
        const Text(
          "1",
          style: TextStyle(
              fontFamily: Constans.fontFamily,
              fontWeight: FontWeight.bold,
              fontSize: 22),
        ),
        const SizedBox(
          width: 15,
        ),
        Container(
            padding: const EdgeInsets.all(2),
            decoration: BoxDecoration(
                color: Colors.black.withOpacity(.05),
                borderRadius: BorderRadius.circular(6)),
            child: const Icon(
              Icons.add,
              color: Constans.shopColor,
            )),
      ],
    );
  }
}
