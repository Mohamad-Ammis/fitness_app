import 'dart:async';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:fitnessapp/constans.dart';
import 'package:fitnessapp/controller/shop_controller.dart';
import 'package:fitnessapp/widgets/shimmer/shimmer_custom_container.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OffersPageView extends StatefulWidget {
  const OffersPageView({
    super.key,
    required this.dotPageController,
    required this.adsList,
  });
  final PageController dotPageController;
  final dynamic adsList;
  @override
  State<OffersPageView> createState() => _OffersPageViewState();
}

class _OffersPageViewState extends State<OffersPageView> {
  int currentIndex = 0;
  final ShopController controller = Get.put(ShopController());

  @override
  void initState() {
    super.initState();

    Timer.periodic(const Duration(seconds: 4), (Timer timer) {
      if (currentIndex < controller.images.length - 1) {
        currentIndex++;
      } else {
        currentIndex = 0;
      }
      if (controller.pageController.hasClients) {
        controller.pageController.animateToPage(
          currentIndex,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeIn,
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.hardEdge,
      margin: const EdgeInsets.symmetric(horizontal: 10),
      decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(12), topRight: Radius.circular(12))),
      child: PageView.builder(
          controller: widget.dotPageController,
          itemCount: controller.adsList.isEmpty
              ? controller.images.length
              : controller.adsList.length,
          itemBuilder: (context, index) {
            return Stack(
              children: [
                controller.adsLoading || controller.adsList.isEmpty
                    ? ShimmerContainer(
                        width: MediaQuery.sizeOf(context).width,
                        height: 200,
                        circularRadius: 16)
                    : CachedNetworkImage(
                        imageUrl:
                            "http://${Constans.host}:8000/Uploads/${controller.adsList[index].image}",
                        imageBuilder: (context, imageProvider) => Container(
                                decoration: BoxDecoration(
                              image: DecorationImage(
                                image: imageProvider,
                                fit: BoxFit.fill,
                              ),
                            ))),
              ],
            );
          }),
    );
  }
}
