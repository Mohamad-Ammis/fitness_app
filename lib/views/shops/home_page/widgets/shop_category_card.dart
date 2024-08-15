import 'package:fitnessapp/constans.dart';
import 'package:fitnessapp/controller/shop_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ShopCategoryCard extends StatelessWidget {
  ShopCategoryCard({
    super.key,
    required this.index,
  });
  final int index;
  final ShopController controller = Get.put(ShopController());
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 68,
          height: 68,
          margin: const EdgeInsets.all(4),
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
              color: Constans.shopColor,
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                    offset: const Offset(0, 3),
                    blurRadius: 8,
                    color: Colors.black.withOpacity(0.3))
              ]),
          child: Image(
            image: AssetImage(
              controller.categoryImages[index],
            ),
            color: Colors.white,
          ),
        ),
        Text(
          controller.categoryNames[index],
          style: const TextStyle(
              height: 0,
              color: Colors.black,
              fontSize: 14,
              fontFamily: Constans.fontFamily,
              fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}
