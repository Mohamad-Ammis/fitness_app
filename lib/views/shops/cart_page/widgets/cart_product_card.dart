
import 'package:fitnessapp/constans.dart';
import 'package:fitnessapp/views/shops/cart_page/widgets/product_counter.dart';
import 'package:fitnessapp/views/shops/cart_page/widgets/product_info.dart';
import 'package:flutter/material.dart';

class CartProductCard extends StatelessWidget {
  const CartProductCard({
    super.key, required this.image,
  });
  final String image;
  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.hardEdge,
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
      decoration: BoxDecoration(
          color: Colors.white.withOpacity(.9),
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
                blurRadius: 8,
                spreadRadius: 2,
                color: Colors.black.withOpacity(.1))
          ]),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
              child: Image.asset(
            image,
            fit: BoxFit.cover,
          )),
          const Expanded(
              flex: 2,
              child: Padding(
                padding: EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ProductInfo(),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CartProductCounter(),
                        Icon(
                          Icons.delete_forever,
                          color: Constans.shopColor,
                          size: 32,
                        )
                      ],
                    ),
                  ],
                ),
              ))
        ],
      ),
    );
  }
}
