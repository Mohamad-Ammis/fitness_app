
import 'package:fitnessapp/constans.dart';
import 'package:fitnessapp/views/shops/product_page/widgets/appbar_icon.dart';
import 'package:flutter/material.dart';

class ProductPageImageSection extends StatelessWidget {
  const ProductPageImageSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        decoration: const BoxDecoration(
          color: Color(0xFFF3F4F6),
        ),
        child: Stack(
          children: [
            Container(
              width: double.infinity,
              margin: const EdgeInsets.only(top: 80),
              child: Image.asset(
                "assets/images/pngegg.png",
                // width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            Positioned(
                top: 60,
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  margin: const EdgeInsets.all(0),
                  width: MediaQuery.sizeOf(context).width,
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      AppbarIcon(
                        icon: Icons.arrow_back_ios_new_outlined,
                      ),
                      Text(
                        "Men's Jacjet",
                        style: TextStyle(
                            fontFamily: Constans.fontFamily,
                            fontSize: 24),
                      ),
                      Row(
                        children: [
                          // AppbarIcon(
                          //   icon: Icons.favorite_outline_outlined,
                          // ),
                          SizedBox(
                            width: 10,
                          ),
                          AppbarIcon(
                            icon: Icons.shopping_cart_outlined,
                          )
                        ],
                      )
                    ],
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
