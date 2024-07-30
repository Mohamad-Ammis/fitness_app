import 'package:fitnessapp/constans.dart';
import 'package:fitnessapp/models/shop/product_model.dart';
import 'package:flutter/material.dart';

class ProductInfo extends StatelessWidget {
  const ProductInfo({
    super.key, required this.model,
  });
  final ProductModel model;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
         Text(
          model.name,
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
                "Price:\$${model.price}",
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
