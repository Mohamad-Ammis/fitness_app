import 'package:fitnessapp/controller/product_page_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SizeOption extends StatelessWidget {
  final String size;
  SizeOption({required this.size, required this.index, super.key});
  final int index;
  final ProductPageController controller = Get.put(ProductPageController());
  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProductPageController>(
        init: ProductPageController(),
        builder: (controller) {
          return Container(
            margin:const  EdgeInsets.symmetric(horizontal: 8.0),
            padding:const  EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            decoration: BoxDecoration(
              color: controller.selectedSize == index
                  ? Colors.black
                  : Colors.white.withOpacity(0.9),
              borderRadius: BorderRadius.circular(8.0),
            ),
            child: Text(
              size,
              style: TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold,
                  color: controller.selectedSize != index
                      ? Colors.black
                      : Colors.white),
            ),
          );
        });
  }
}
