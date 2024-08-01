import 'package:fitnessapp/constans.dart';
import 'package:fitnessapp/controller/shop_controller.dart';
import 'package:fitnessapp/models/shop/product_model.dart';
import 'package:fitnessapp/views/shops/favorite_page/widgets/favorite_page_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class FavoritePage extends StatelessWidget {
  FavoritePage({super.key});
  final controller = Get.put(ShopController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF3F4F6),
      appBar: AppBar(
        backgroundColor: const Color(0xFFF3F4F6),
        title: const Text('Favorites'),
        centerTitle: true,
      ),
      body: FutureBuilder(
          future: controller.getFavoritesProduct(),
          builder: (context, snapshot) {
            controller.favoriteProducts = snapshot.data ?? [];
            return SizedBox(
              height: MediaQuery.sizeOf(context).height,
              child: GetBuilder<ShopController>(builder: (controller) {
                return controller.favoriteProducts.isNotEmpty
                    ? ListView.builder(
                        itemCount: controller.favoriteProducts.length,
                        itemBuilder: (context, index) => FavoritePageCard(
                          model: ProductModel.fromJson(
                              controller.favoriteProducts[index]),
                          index: index,
                        ),
                      )
                    : Column(
                        children: [
                          Lottie.asset('assets/lottie/emptyorder.json'),
                          const Text(
                            "You dont have any favorite products yet\nlet's add one",
                            style: TextStyle(fontFamily: Constans.fontFamily),
                          )
                        ],
                      );
              }),
            );
          }),
    );
  }
}
