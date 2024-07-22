
import 'package:fitnessapp/constans.dart';
import 'package:fitnessapp/controller/product_page_controller.dart';
import 'package:fitnessapp/views/shops/product_page/widgets/color_option.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ColorsListView extends StatelessWidget {
  ColorsListView({
    super.key,
  });
  final ProductPageController productController =
      Get.put(ProductPageController());
  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProductPageController>(
        init: ProductPageController(),
        builder: (productController) {
          return Row(
            children: [
              const Text(
                "Choose a color : ",
                style: TextStyle(
                    fontFamily: Constans.fontFamily,
                    fontSize: 16,
                    color: Colors.black),
              ),
              Expanded(
                flex: 1,
                child: SizedBox(
                  height: 35,
                  child: ListView.builder(
                      itemCount: productController.productColors.length,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                            onTap: () {
                              productController.selectedColor = index;
                              productController.update();
                            },
                            child: ColorOption(
                              color: productController.productColors[index],
                              index: index,
                            ));
                      }),
                ),
              )
            ],
          );
        });
  }
}