import 'package:cached_network_image/cached_network_image.dart';
import 'package:fitnessapp/constans.dart';
import 'package:fitnessapp/controller/shop_controller.dart';
import 'package:fitnessapp/models/shop/product_model.dart';
import 'package:fitnessapp/views/shops/product_page/widgets/appbar_icon.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class ProductPageImageSection extends StatefulWidget {
  ProductPageImageSection({
    super.key,
    required this.model,
    required this.isFavorite,
  });
  final ProductModel model;
  final bool isFavorite;

  @override
  State<ProductPageImageSection> createState() =>
      _ProductPageImageSectionState();
}

class _ProductPageImageSectionState extends State<ProductPageImageSection> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  final controller = Get.put(ShopController());
  @override
  Widget build(BuildContext context) {
    return GetBuilder<ShopController>(builder: (controller) {
      // WidgetsBinding.instance.addPostFrameCallback((_) async {
      //   controller.isProductFavorite = widget.model.isFavorite;
      // });
      return Expanded(
        child: Container(
          decoration: const BoxDecoration(
            color: Color(0xFFF3F4F6),
          ),
          child: Stack(
            children: [
              Container(
                width: double.infinity,
                margin: const EdgeInsets.only(top: 100),
                child: CachedNetworkImage(
                    imageUrl:
                        "${Constans.mainbaseUrlimage}Uploads/${widget.model.image}",
                    imageBuilder: (context, imageProvider) => Container(
                            decoration: BoxDecoration(
                          image: DecorationImage(
                            image: imageProvider,
                            fit: BoxFit.contain,
                          ),
                        ))),
              ),
              Positioned(
                  top: 60,
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    margin: const EdgeInsets.all(0),
                    width: MediaQuery.sizeOf(context).width,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        AppbarIcon(
                          icon: Icons.arrow_back_ios_new_outlined,
                        ),
                        Text(
                          "Men's Jacjet",
                          style: TextStyle(
                              fontFamily: Constans.fontFamily, fontSize: 24),
                        ),
                        Row(
                          children: [
                            // AppbarIcon(
                            //   icon: Icons.favorite_outline_outlined,
                            // ),
                            SizedBox(
                              width: 10,
                            ),
                            // GestureDetector(
                            //   onTap: () async {
                            //     try {
                            //       var status =
                            //           await controller.checkIfIsFavorites(
                            //               widget.model.id, context);
                            //       debugPrint('status: $status');
                            //       if (status) {
                            //         await controller.deleteFromFavorites(
                            //             widget.model.id, context);
                            //         controller.isProductFavorite = false;
                            //         controller.update();
                            //       } else {
                            //         await controller.addToFavorites(
                            //             widget.model.id, context);
                            //         controller.isProductFavorite = true;
                            //         controller.update();
                            //       }
                            //     } catch (e) {
                            //       debugPrint(e.toString());
                            //     }
                            //   },
                            //   child: Container(
                            //     padding: EdgeInsets.all(6),
                            //     decoration: BoxDecoration(
                            //         color: Colors.transparent,
                            //         borderRadius: BorderRadius.circular(8)),
                            //     child: Icon(
                            //         controller.isProductFavorite
                            //             ? Icons.favorite
                            //             : Icons.favorite_border_outlined,
                            //         color: controller.isProductFavorite
                            //             ? Colors.red
                            //             : Colors.black),
                            //   ),
                            // )
                          ],
                        )
                      ],
                    ),
                  ))
            ],
          ),
        ),
      );
    });
  }
}
