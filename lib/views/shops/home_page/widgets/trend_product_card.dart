import 'package:cached_network_image/cached_network_image.dart';
import 'package:fitnessapp/constans.dart';
import 'package:fitnessapp/controller/shop_controller.dart';
import 'package:fitnessapp/models/shop/product_model.dart';
import 'package:fitnessapp/utils/app_images.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TrendProductCard extends StatefulWidget {
  TrendProductCard({
    super.key,
    required this.model,
  });
  final ProductModel model;

  @override
  State<TrendProductCard> createState() => _TrendProductCardState();
}

class _TrendProductCardState extends State<TrendProductCard> {
  late bool isFavorite;
  final controller = Get.put(ShopController());
  @override
  void initState() {
    super.initState();
    isFavorite = widget.model.isFavorite;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        clipBehavior: Clip.hardEdge,
        decoration: BoxDecoration(
            color: Colors.black, borderRadius: BorderRadius.circular(28)),
        child: Stack(
          children: [
            CachedNetworkImage(
                imageUrl:
                    "http://${Constans.host}:8000/Uploads/${widget.model.image}",
                imageBuilder: (context, imageProvider) => Container(
                        decoration: BoxDecoration(
                      image: DecorationImage(
                          image: imageProvider,
                          fit: BoxFit.cover,
                          colorFilter: const ColorFilter.mode(
                              Color.fromARGB(255, 10, 0, 0),
                              BlendMode.lighten)),
                    ))),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                          width: 40,
                          height: 40,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(999),
                              color: Colors.black.withOpacity(0.15)),
                          child: IconButton(
                              onPressed: () async {
                                try {
                                  var status =
                                      await controller.checkIfIsFavorites(
                                          widget.model.id, context);
                                  print(status);
                                  if (status) {
                                    await controller.deleteFromFavorites(
                                        widget.model.id, context);
                                    setState(() {
                                      isFavorite = false;
                                    });
                                  } else {
                                    await controller.addToFavorites(
                                        widget.model.id, context);
                                    setState(() {
                                      isFavorite = true;
                                    });
                                  }
                                } catch (e) {
                                  debugPrint(e.toString());
                                }
                              },
                              icon: Icon(
                                Icons.favorite,
                                color: isFavorite
                                    ? Colors.red
                                    : Colors.white.withOpacity(.9),
                              )))
                    ],
                  ),
                ),
                const SizedBox(),
              ],
            ),
            Positioned.fill(
                child: Align(
              alignment: Alignment.bottomRight,
              child: Container(
                  decoration: BoxDecoration(
                      color: Colors.black.withOpacity(.3),
                      borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(16))),
                  padding: const EdgeInsets.all(8),
                  child: GestureDetector(
                    onTap: () {
                      if (!controller.cartProducts.contains(widget.model)) {
                        debugPrint('askdhkjsgdadsash');
                        controller.orderCartProducs.add(
                            {'product_id': widget.model.id, "quantity": '1'});
                      }
                      controller.cartProducts.indexOf(widget.model) == -1
                          ? controller.cartProducts.add(widget.model)
                          : debugPrint('Already exists');

                      debugPrint(
                          'controller.orderCartProducs: ${controller.orderCartProducs}');
                    },
                    child: const Icon(
                      Icons.add,
                      color: Colors.white,
                    ),
                  )),
            ))
          ],
        ));
  }
}
