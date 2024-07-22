import 'dart:async';

import 'package:fitnessapp/constans.dart';
import 'package:fitnessapp/controller/shop_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OffersPageView extends StatefulWidget {
  const OffersPageView({
    super.key,
    required this.dotPageController,
  });
  final PageController dotPageController;

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
      controller.pageController.animateToPage(
        currentIndex,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeIn,
      );
    });
  }

  // @override
  // void dispose() {
  //   // TODO: implement dispose
  //   super.dispose();
  //   pageController.dispose();
  //   widget.dotPageController.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
        controller: widget.dotPageController,
        itemCount: controller.images.length,
        itemBuilder: (context, index) {
          return Stack(
            children: [
              Image.asset(
                width: double.infinity,
                controller.images[index],
                fit: BoxFit.cover,
              ),
            ],
          );
        });
  }
}
