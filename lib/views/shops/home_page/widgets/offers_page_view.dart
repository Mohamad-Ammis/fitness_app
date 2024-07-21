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
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "u can\nsee me !".toUpperCase(),
                      style: const TextStyle(
                          height: 0,
                          color: Colors.white,
                          fontSize: 32,
                          fontFamily: Constans.fontFamily,
                          fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      width: 140,
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: Colors.white.withOpacity(1)),
                      child: const Center(
                        child: Text('Try it',
                            style: TextStyle(
                                height: 0,
                                color: Colors.black,
                                fontSize: 20,
                                fontFamily: Constans.fontFamily,
                                fontWeight: FontWeight.bold)),
                      ),
                    ),
                  ],
                ),
              )
            ],
          );
        });
  }
}
