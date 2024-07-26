import 'package:fitnessapp/constans.dart';
import 'package:fitnessapp/controller/product_page_controller.dart';
import 'package:fitnessapp/models/shop/product_model.dart';
import 'package:fitnessapp/views/shops/product_page/widgets/color_option.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ColorsListView extends StatelessWidget {
  ColorsListView({
    super.key,
    required this.colors,
  });
  final List<ColorsModel> colors;
  // final ProductModel model;
  final ProductPageController productController =
      Get.put(ProductPageController());
  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProductPageController>(
        init: ProductPageController(),
        builder: (productController) {
          return IntrinsicHeight(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Choose a color : ",
                  style: TextStyle(
                      fontFamily: Constans.fontFamily,
                      fontSize: 16,
                      color: Colors.black),
                ),
                SizedBox(
                  height: 10,
                ),
                Expanded(
                  flex: 1,
                  child: SizedBox(
                    height: 35,
                    child: ListView.builder(
                        itemCount: colors.length,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          return GestureDetector(
                              onTap: () {
                                productController.selectedColor = index;
                                productController.update();
                              },
                              child: ColorOption(
                                color: handle(colors[index].color),
                                index: index,
                              ));
                        }),
                  ),
                )
              ],
            ),
          );
        });
  }
}

handle(String color) {
  switch (color) {
    case "white":
      return Colors.white;

    case "black":
      return Colors.black;

    case "red":
      return Colors.red;

    case "green":
      return Colors.green;

    case "pink":
      return Colors.pink;

    case "blue":
      return Colors.blue;

    case "brown":
      return Colors.brown;

    case "yellow":
      return Colors.yellow;
  }
}
