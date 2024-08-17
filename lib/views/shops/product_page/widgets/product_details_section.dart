import 'package:fitnessapp/constans.dart';
import 'package:fitnessapp/models/shop/product_model.dart';
import 'package:fitnessapp/views/shops/product_page/widgets/color_listview.dart';
import 'package:fitnessapp/views/shops/product_page/widgets/product_page_footer.dart';
import 'package:fitnessapp/views/shops/product_page/widgets/size_listview.dart';
import 'package:flutter/material.dart';

class ProductPageDetailsSection extends StatelessWidget {
  const ProductPageDetailsSection({
    super.key,
    required this.model,
  });
  final ProductModel model;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
        color: const Color(0xFFF3F4F6),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: MediaQuery.sizeOf(context).width * 0.75,
                  child: Text(
                    model.name,
                    maxLines: 2,
                    style: TextStyle(
                        overflow: TextOverflow.ellipsis,
                        fontFamily: Constans.fontFamily,
                        fontSize: 24,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Text(
                  "\$${model.price}",
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
            Text(
              maxLines: 3,
              model.desc,
              style: TextStyle(
                  fontFamily: Constans.fontFamily,
                  fontSize: 16,
                  color: Colors.black26),
            ),
            const SizedBox(
              height: 10,
            ),
            model.colors.isNotEmpty
                ? ColorsListView(colors: model.colors)
                : SizedBox(),
            const SizedBox(
              height: 20,
            ),
            model.sizes.isNotEmpty
                ? SizeListView(
                    sizes: model.sizes,
                  )
                : SizedBox(),
            const Expanded(child: SizedBox()),
            ProductPageFooter(
              model: model,
            )
          ],
        ),
      ),
    );
  }
}
