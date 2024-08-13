import 'package:cached_network_image/cached_network_image.dart';
import 'package:fitnessapp/constans.dart';
import 'package:fitnessapp/controller/shop_controller.dart';
import 'package:fitnessapp/models/shop/product_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FavoritePageCard extends StatelessWidget {
  FavoritePageCard({
    super.key,
    required this.model,
    required this.index,
  });
  final ProductModel model;
  final int index;
  final controller = Get.put(ShopController());
  @override
  Widget build(BuildContext context) {
    return GetBuilder<ShopController>(builder: (controller) {
      return Stack(
        children: [
          Container(
            clipBehavior: Clip.hardEdge,
            margin: const EdgeInsets.all(16),
            decoration: BoxDecoration(boxShadow: [
              BoxShadow(blurRadius: 10, color: Colors.black.withOpacity(.3))
            ], color: Colors.white, borderRadius: BorderRadius.circular(16)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Container(
                    color: Constans.shopLightColor,
                    child: CachedNetworkImage(
                        height: 150,
                        imageUrl:
                            "http://${Constans.host}:8000/Uploads/${model.image}",
                        imageBuilder: (context, imageProvider) => Container(
                                decoration: BoxDecoration(
                              image: DecorationImage(
                                image: imageProvider,
                                fit: BoxFit.cover,
                              ),
                            ))),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(right: 16.0),
                          child: Text(
                            model.name,
                            overflow: TextOverflow.ellipsis,
                            maxLines: 2,
                            style: const TextStyle(
                                fontFamily: Constans.fontFamily,
                                fontSize: 24,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        const SizedBox(
                          height: 4,
                        ),
                        Text(
                          model.desc,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                          style: TextStyle(
                              fontFamily: Constans.fontFamily,
                              fontSize: 14,
                              color: Colors.black.withOpacity(.5),
                              fontWeight: FontWeight.normal),
                        ),
                        Text(
                          "Stock = ${model.stock}",
                          overflow: TextOverflow.ellipsis,
                          maxLines: 4,
                          style: TextStyle(
                              fontFamily: Constans.fontFamily,
                              fontSize: 14,
                              color: Colors.black.withOpacity(.5),
                              fontWeight: FontWeight.normal),
                        ),
                        Text(
                          "views= ${model.viewCount}",
                          overflow: TextOverflow.ellipsis,
                          maxLines: 4,
                          style: TextStyle(
                              fontFamily: Constans.fontFamily,
                              fontSize: 14,
                              color: Colors.black.withOpacity(.5),
                              fontWeight: FontWeight.normal),
                        ),
                        Text(
                          "price = \$${model.price}",
                          overflow: TextOverflow.ellipsis,
                          maxLines: 4,
                          style: TextStyle(
                              fontFamily: Constans.fontFamily,
                              fontSize: 14,
                              color: Colors.black.withOpacity(.5),
                              fontWeight: FontWeight.normal),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
          Positioned.fill(
              child: Align(
            alignment: Alignment.topRight,
            child: GestureDetector(
              onTap: () async {
                var status =
                    await controller.checkIfIsFavorites(model.id, context);
                debugPrint('status: $status');
                if (status) {
                  bool deleted =
                      // ignore: use_build_context_synchronously
                      await controller.deleteFromFavorites(model.id, context);
                  if (deleted) {
                    controller.favoriteProducts.removeAt(index);
                    controller.allProducts = await controller.getAllProduct();
                    await controller.getCommonProduct();
                    await controller.getMostSalesProduct();
                  }
                }
                controller.update();
              },
              child: Container(
                decoration: const BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(16),
                        bottomLeft: Radius.circular(16))),
                margin: const EdgeInsets.all(16),
                padding: const EdgeInsets.all(8),
                child: const Icon(
                  color: Colors.white,
                  Icons.remove,
                ),
              ),
            ),
          ))
        ],
      );
    });
  }
}
