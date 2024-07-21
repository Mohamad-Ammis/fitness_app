import 'package:fitnessapp/constans.dart';
import 'package:fitnessapp/controller/shop_controller.dart';
import 'package:fitnessapp/views/shops/cart_page/cart_page.dart';
import 'package:fitnessapp/views/shops/favorite_page/favorite_page.dart';
import 'package:fitnessapp/views/shops/home_page/widgets/category_list_view.dart';
import 'package:fitnessapp/views/shops/home_page/widgets/offers_card_indicator.dart';
import 'package:fitnessapp/views/shops/home_page/widgets/offers_page_view.dart';
import 'package:fitnessapp/views/shops/home_page/widgets/shop_home_page.dart';
import 'package:fitnessapp/views/shops/home_page/widgets/trend_product_list.dart';
import 'package:fitnessapp/views/shops/order_page/order_page.dart';
import 'package:fitnessapp/views/shops/widgets/bottom_navbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class Shop extends StatelessWidget {
  Shop({super.key});
  final ShopController shopPageController = Get.put(ShopController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xFFF3F4F6),
        appBar: AppBar(
          backgroundColor: const Color(0xFFF3F4F6),
          leading: IconButton(
              onPressed: () => ZoomDrawer.of(context)!.toggle(),
              icon: const Icon(Icons.menu)),
          title: const Text(
            "Shop",
            style: TextStyle(fontFamily: Constans.fontFamily, fontSize: 24),
          ),
          centerTitle: true,
          actions: [
            IconButton(
                onPressed: () {
                  Get.to(() => const CartPage());
                },
                icon: const Icon(Icons.shopping_cart_outlined)),
            IconButton(
                onPressed: () {
                  Get.to(() => const FavoritePage());
                },
                icon: const Icon(Icons.favorite)),
            IconButton(
                onPressed: () {
                  Get.to(() => const OrderPage());
                },
                icon: const Icon(FontAwesomeIcons.boxOpen)),
          ],
        ),
        body: ShopHomePage());
  }
}
