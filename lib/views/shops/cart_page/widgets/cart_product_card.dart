import 'package:cached_network_image/cached_network_image.dart';
import 'package:fitnessapp/constans.dart';
import 'package:fitnessapp/controller/shop_controller.dart';
import 'package:fitnessapp/models/shop/product_model.dart';
import 'package:fitnessapp/views/shops/cart_page/widgets/product_counter.dart';
import 'package:fitnessapp/views/shops/cart_page/widgets/product_info.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CartProductCard extends StatelessWidget {
  CartProductCard({
    super.key,
    required this.model,
  });
  final ProductModel model;
  final controller = Get.put(ShopController());
  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.hardEdge,
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
      decoration: BoxDecoration(
          color: Colors.white.withOpacity(.9),
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
                blurRadius: 8,
                spreadRadius: 2,
                color: Colors.black.withOpacity(.1))
          ]),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: CachedNetworkImage(
              height: 130,
              imageUrl: "http://${Constans.host}:8000/Uploads/${model.image}",
              imageBuilder: (context, imageProvider) => Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: imageProvider,
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              placeholder: (context, url) => const CircularProgressIndicator(),
              errorWidget: (context, url, error) => const Icon(Icons.error),
            ),
          ),
          Expanded(
              flex: 2,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ProductInfo(model: model),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CartProductCounter(model: model),
                        GestureDetector(
                          onTap: () {
                            int index = controller.cartProducts.indexOf(model);
                            controller.cartSubTotal -= (double.parse(
                                    controller.cartProducts[index].price) *
                                controller.cartProducts[index].count);
                            controller.cartProducts.remove(model);
                            controller.update();
                            debugPrint(
                                'controller.CartSubTotal: ${controller.cartSubTotal}');
                          },
                          child: const Icon(
                            Icons.delete_forever,
                            color: Constans.shopColor,
                            size: 32,
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ))
        ],
      ),
    );
  }
}
