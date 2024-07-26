import 'package:fitnessapp/controller/product_page_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ColorOption extends StatelessWidget {
  ColorOption({super.key, required this.color, required this.index});
  final Color color;
  final int index;
  final ProductPageController controller = Get.put(ProductPageController());
  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProductPageController>(builder: (controller) {
      return Container(
        width: 40,
        height: 40,
        margin: const EdgeInsets.symmetric(horizontal: 8.0),
        padding: const EdgeInsets.all(2.0),
        decoration: BoxDecoration(
            color: color,
            shape: BoxShape.circle,
            border: Border.all(color: Colors.white, width: 2)),
        child: controller.selectedColor == index
            ? Center(
                child: Icon(Icons.circle,
                    color: controller.selectedColor == index
                        ? color == Colors.white
                            ? Colors.black
                            : Colors.white
                        : Colors.transparent),
              )
            : null,
      );
    });
  }
}
