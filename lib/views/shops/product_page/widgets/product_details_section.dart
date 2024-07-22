
import 'package:fitnessapp/constans.dart';
import 'package:fitnessapp/views/shops/product_page/widgets/color_listview.dart';
import 'package:fitnessapp/views/shops/product_page/widgets/product_page_footer.dart';
import 'package:fitnessapp/views/shops/product_page/widgets/size_listview.dart';
import 'package:flutter/material.dart';

class ProductPageDetailsSection extends StatelessWidget {
  const ProductPageDetailsSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
        color: const Color(0xFFF3F4F6),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Men's Jacjet",
                  style: TextStyle(
                      fontFamily: Constans.fontFamily,
                      fontSize: 28,
                      fontWeight: FontWeight.bold),
                ),
                Text(
                  "40\$",
                  style: TextStyle(
                      fontFamily: Constans.fontFamily,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            const Text(
              maxLines: 5,
              "unpaired black, white, and red Air Jordan shoe, Air Jordan Shoe Sneakers Nike Jordan Spizike, Air Jordan basketball shoes, white, fashion png",
              style: TextStyle(
                  fontFamily: Constans.fontFamily,
                  fontSize: 16,
                  color: Colors.black26),
            ),
            const SizedBox(
              height: 10,
            ),
            ColorsListView(),
            const SizedBox(
              height: 20,
            ),
            SizeListView(),
            const Expanded(child: SizedBox()),
            const ProductPageFooter()
          ],
        ),
      ),
    );
  }
}
