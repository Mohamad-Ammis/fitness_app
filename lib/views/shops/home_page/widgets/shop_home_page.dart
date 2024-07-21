
import 'package:fitnessapp/constans.dart';
import 'package:fitnessapp/controller/shop_controller.dart';
import 'package:fitnessapp/views/shops/home_page/widgets/category_list_view.dart';
import 'package:fitnessapp/views/shops/home_page/widgets/offers_card_indicator.dart';
import 'package:fitnessapp/views/shops/home_page/widgets/offers_page_view.dart';
import 'package:fitnessapp/views/shops/home_page/widgets/trend_product_list.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ShopHomePage extends StatelessWidget {
  ShopHomePage({
    super.key,
  });

  final ShopController shopPageController = Get.put(ShopController());

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 230,
                width: MediaQuery.of(context).size.width,
                margin: const EdgeInsets.all(12),
                clipBehavior: Clip.hardEdge,
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(16)),
                child: Stack(
                  children: [
                    OffersPageView(
                        dotPageController: shopPageController.pageController),
                    OffersCardIndicator(
                        dotPageController: shopPageController.pageController)
                  ],
                ),
              ),
              CategoryListView(),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.0),
                child: Text(
                  "Trending Product",
                  style: TextStyle(
                      height: 0,
                      color: Colors.black,
                      fontSize: 24,
                      fontFamily: Constans.fontFamily,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        ),
        const TrendProductList(),
      ],
    );
  }
}

// class ShopHomePage extends StatelessWidget {
//   ShopHomePage({
//     super.key,
//   });

//   final ShopController shopPageController = Get.put(ShopController());
//   @override
//   Widget build(BuildContext context) {
//     return  }
// }
