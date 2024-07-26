import 'package:fitnessapp/constans.dart';
import 'package:fitnessapp/controller/product_page_controller.dart';
import 'package:fitnessapp/models/shop/product_model.dart';
import 'package:fitnessapp/views/shops/product_page/widgets/size_option.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SizeListView extends StatelessWidget {
  SizeListView({
    super.key,
    required this.sizes,
  });
  final List<SizeModel> sizes;
  final ProductPageController productController =
      Get.put(ProductPageController());
  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProductPageController>(builder: (productController) {
      return IntrinsicHeight(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Choose a size : ",
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
                height: 40,
                child: ListView.builder(
                    itemCount: sizes.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                          onTap: () {
                            productController.selectedSize = index;
                            productController.update();
                          },
                          child: SizeOption(
                            size: sizes[index].size,
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
