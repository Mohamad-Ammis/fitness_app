
import 'package:fitnessapp/controller/shop_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OffersCardIndicator extends StatelessWidget {
  OffersCardIndicator({
    super.key,
    required this.dotPageController,
  });

  final PageController dotPageController;
  final ShopController controller = Get.put(ShopController());
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.topCenter,
      padding: const EdgeInsets.only(top: 5),
      child: SmoothPageIndicator(
        controller: dotPageController,
        count: controller.images.length,
        effect: CustomizableEffect(
          dotDecoration: DotDecoration(
              width: MediaQuery.of(context).size.width / 5,
              height: 5,
              color: Colors.white.withOpacity(0.2),
              borderRadius: BorderRadius.circular(8)),
          activeDotDecoration: DotDecoration(
              width: MediaQuery.of(context).size.width / 5,
              height: 5,
              color: Colors.white.withOpacity(0.9),
              borderRadius: BorderRadius.circular(8)),
        ),
      ),
    );
  }
}
