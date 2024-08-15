import 'package:fitnessapp/constans.dart';
import 'package:fitnessapp/controller/product_page_controller.dart';
import 'package:fitnessapp/controller/shop_controller.dart';
import 'package:fitnessapp/views/shops/home_page/widgets/category_list_view.dart';
import 'package:fitnessapp/views/shops/home_page/widgets/filter_product_list.dart';
import 'package:fitnessapp/views/shops/home_page/widgets/offers_card_indicator.dart';
import 'package:fitnessapp/views/shops/home_page/widgets/offers_page_view.dart';
import 'package:fitnessapp/views/shops/home_page/widgets/trend_product_list.dart';
import 'package:fitnessapp/widgets/shimmer/shimmer_custom_container.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ShopHomePage extends StatelessWidget {
  ShopHomePage({
    super.key,
  });

  final ShopController controller = Get.put(ShopController());
  final ProductPageController contr = Get.put(ProductPageController());

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ShopController>(builder: (controller) {
      return RefreshIndicator(
        onRefresh: () async {
          await controller.getHomePageProducts();
          controller.update();
          return Future.delayed(Duration(milliseconds: 200));
        },
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  controller.adsLoading
                      ? ShimmerContainer(
                          width: MediaQuery.sizeOf(context).width,
                          height: 230,
                          circularRadius: 16,
                          margin: const EdgeInsets.symmetric(
                              vertical: 8, horizontal: 16),
                        )
                      : Container(
                          height: 230,
                          width: MediaQuery.of(context).size.width,
                          margin: const EdgeInsets.all(0),
                          clipBehavior: Clip.hardEdge,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(0)),
                          child: Stack(
                            children: [
                              OffersPageView(
                                dotPageController: controller.pageController,
                                adsList: controller.adsList,
                              ),
                              Positioned.fill(
                                  child: Align(
                                alignment: Alignment.topCenter,
                                child: OffersCardIndicator(
                                  dotPageController: controller.pageController,
                                  adsList: controller.adsList,
                                ),
                              ))
                            ],
                          ),
                        ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    child: Text(
                      'Categories',
                      style: TextStyle(
                          fontSize: 20,
                          fontFamily: Constans.fontFamily,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  CategoryListView(),
                  SizedBox(
                    height: 20,
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    child: Text(
                      'Products',
                      style: TextStyle(
                          fontSize: 20,
                          fontFamily: Constans.fontFamily,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  const FilterProductsList()
                ],
              ),
            ),
            controller.HomeLoading ? SizedBox() : TrendProductList(),
          ],
        ),
      );
    });
  }
}
