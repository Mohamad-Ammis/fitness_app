import 'package:fitnessapp/controller/shop_controller.dart';
import 'package:fitnessapp/models/shop/product_model.dart';
import 'package:fitnessapp/views/shops/home_page/widgets/trend_product_card.dart';
import 'package:fitnessapp/views/shops/product_page/product_page.dart';
import 'package:fitnessapp/widgets/shimmer/shimmer_custom_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';

class TrendProductList extends StatelessWidget {
  TrendProductList({
    super.key,
  });
  final controller = Get.put(ShopController());
  @override
  Widget build(BuildContext context) {
    return GetBuilder<ShopController>(builder: (controller) {
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
                onTap: () => Get.to(
                      () => ProductPage(
                        model:
                            ProductModel.fromJson(controller.showedList[index]),
                      ),
                      duration: const Duration(seconds: 1),
                    ),
                child: controller.homeLoading
                    ? ShimmerContainer(
                        width: 100, height: 100, circularRadius: 16)
                    : TrendProductCard(
                        model:
                            ProductModel.fromJson(controller.showedList[index]),
                      )),
            childCount: controller.showedList.length,
          ),
        ),
      );
    });
  }
}
