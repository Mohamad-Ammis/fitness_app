import 'package:fitnessapp/controller/shop_controller.dart';
import 'package:fitnessapp/views/shops/cart_page/widgets/cart_product_card.dart';
import 'package:flutter/material.dart';
import 'package:fitnessapp/utils/app_images.dart';
import 'package:get/get.dart';

class ProductListView extends StatelessWidget {
  ProductListView({
    super.key,
  });
  List images= const[
    Assets.imagesClothes1,
    Assets.imagesClothes2,
    Assets.imagesClothes1,
    Assets.imagesClothes2,
  ];
  final controller= Get.put(ShopController());
  @override
  Widget build(BuildContext context) {
    return GetBuilder<ShopController>(
      builder: (controller) {
        return ListView.builder(
          itemCount:controller.cartProducts.length ,
          itemBuilder: (context,index){
          return CartProductCard(model:controller.cartProducts[index]);
        });
      }
    );
  }
}
