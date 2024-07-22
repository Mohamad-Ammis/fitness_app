import 'package:fitnessapp/views/shops/cart_page/widgets/cart_product_card.dart';
import 'package:flutter/material.dart';
import 'package:fitnessapp/utils/app_images.dart';

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
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: images.length,
      itemBuilder: (context,index){
      return CartProductCard(image:images[index]);
    });
  }
}
