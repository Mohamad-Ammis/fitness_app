import 'package:fitnessapp/constans.dart';
import 'package:fitnessapp/controller/shop_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FilterProductsList extends StatelessWidget {
  const FilterProductsList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Item(
          index: 0,
          title: 'All Product',
        ),
        Item(
          index: 1,
          title: 'Most Sales',
        ),
        Item(
          index: 2,
          title: 'Common',
        ),
      ],
    );
  }
}

class Item extends StatelessWidget {
  const Item({
    super.key,
    required this.index,
    required this.title,
  });
  final int index;
  final String title;
  @override
  Widget build(BuildContext context) {
    return GetBuilder<ShopController>(
        init: ShopController(),
        builder: (controller) {
          return GestureDetector(
            onTap: () {
              if (index == 0) {
                controller.showedList = controller.allProducts;
              }
              if (index == 1) {
                controller.showedList = controller.mostSalesProducts;
              }
              if (index == 2) {
                controller.showedList = controller.commonProducts;
              }
              controller.filterProductSelectedIndex = index;
              controller.update();
            },
            child: Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                  border: controller.filterProductSelectedIndex == index
                      ? null
                      : Border.all(color: Constans.shopColor, width: .4),
                  color: controller.filterProductSelectedIndex == index
                      ? Constans.shopColor
                      : Colors.transparent,
                  borderRadius: BorderRadius.circular(999)),
              child: Text(
                title,
                style: TextStyle(
                    height: 0,
                    color: controller.filterProductSelectedIndex == index
                        ? Colors.white
                        : Colors.black,
                    fontSize: 16,
                    fontFamily: Constans.fontFamily,
                    fontWeight: FontWeight.bold),
              ),
            ),
          );
        });
  }
}
