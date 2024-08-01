import 'package:fitnessapp/constans.dart';
import 'package:fitnessapp/controller/shop_controller.dart';
import 'package:fitnessapp/views/shops/cart_page/widgets/cart_product_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class ProductListView extends StatelessWidget {
  ProductListView({
    super.key,
  });
  final controller = Get.put(ShopController());
  @override
  Widget build(BuildContext context) {
    return GetBuilder<ShopController>(builder: (controller) {
      return controller.cartProducts.isEmpty
          ? Column(
              children: [
                Lottie.asset('assets/lottie/emptycasrt.json'),
                const Text(
                  "Your cart is empty\nlet's shopping",
                  style: TextStyle(fontFamily: Constans.fontFamily),
                )
              ],
            )
          : ListView.builder(
              itemCount: controller.cartProducts.length,
              itemBuilder: (context, index) {
                return CartProductCard(model: controller.cartProducts[index]);
              });
    });
  }
}
