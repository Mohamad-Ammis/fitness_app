
import 'package:fitnessapp/constans.dart';
import 'package:flutter/material.dart';

class ProductInfo extends StatelessWidget {
  const ProductInfo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Men Jacket's",
          style: TextStyle(
              fontFamily: Constans.fontFamily,
              fontWeight: FontWeight.bold,
              fontSize: 22),
        ),
        const SizedBox(
          height: 8,
        ),
        Container(
          width: MediaQuery.sizeOf(context).width / 2,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Color:Blue",
                style: TextStyle(
                    color: Colors.black.withOpacity(.5),
                    fontFamily: Constans.fontFamily,
                    fontSize: 13),
              ),
              Text(
                "Size:Xl",
                style: TextStyle(
                    color: Colors.black.withOpacity(.5),
                    fontFamily: Constans.fontFamily,
                    fontSize: 13),
              ),
              Text(
                "Price:\$510",
                style: TextStyle(
                    color: Colors.black.withOpacity(.5),
                    fontFamily: Constans.fontFamily,
                    fontSize: 13),
              ),
            ],
          ),
        )
      ],
    );
  }
}
