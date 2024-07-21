
import 'package:fitnessapp/views/shops/home_page/widgets/trend_product_card.dart';
import 'package:fitnessapp/views/shops/product_page/product_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';

class TrendProductList extends StatelessWidget {
  const TrendProductList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: const EdgeInsets.all(16.0),
      sliver: SliverGrid(
        gridDelegate: SliverWovenGridDelegate.count(
          crossAxisCount: 2,
          mainAxisSpacing: 0,
          crossAxisSpacing: 8,
          pattern: [
            const WovenGridTile(.68),
            const WovenGridTile(
              5 / 8.5,
              crossAxisRatio: 1,
              alignment: AlignmentDirectional.center,
            ),
          ],
        ),
        delegate: SliverChildBuilderDelegate(
          (context, index) => GestureDetector(
            onTap: () => Get.to(ProductPage(),duration: const Duration(seconds: 1),),
            child: const TrendProductCard()),
          childCount: 10, 
        ),
      ),
    );
  }
}
