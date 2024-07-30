import 'package:fitnessapp/controller/shop_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OffersCardIndicator extends StatelessWidget {
  OffersCardIndicator({
    super.key,
    required this.dotPageController, required this.adsList,
  });
  final dynamic adsList;
  final PageController dotPageController;
  final ShopController controller = Get.put(ShopController());
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: MediaQuery.sizeOf(context).width - 24,
        alignment: Alignment.topCenter,
        padding: const EdgeInsets.only(top: 8),
        clipBehavior: Clip.hardEdge,
        decoration: const BoxDecoration(),
        // margin: EdgeInsets.symmetric(horizontal: 12),
        child: SmoothPageIndicator(
          controller: dotPageController,
          count:
          controller.adsList.isEmpty? controller.images.length:controller.adsList.length,
          effect: CustomizableEffect(
            spacing: 8,
            dotDecoration: DotDecoration(
                width: (MediaQuery.sizeOf(context).width /
                        (controller.images.length + 1)) -
                    8,
                height: 5,
                color: Colors.white.withOpacity(0.2),
                borderRadius: BorderRadius.circular(8)),
            activeDotDecoration: DotDecoration(
                width: (MediaQuery.sizeOf(context).width /
                        (controller.images.length + 1)) -
                    8,
                height: 5,
                color: Colors.white.withOpacity(0.9),
                borderRadius: BorderRadius.circular(8)),
          ),
        ),
      ),
    );
  }
}
