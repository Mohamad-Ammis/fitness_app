import 'package:fitnessapp/controller/shop_controller.dart';
import 'package:fitnessapp/views/shops/home_page/widgets/shop_category_card.dart';
import 'package:fitnessapp/views/shops/view_all_page/view_all_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CategoryListView extends StatelessWidget {
  CategoryListView({
    super.key,
  });
  final ShopController controller = Get.put(ShopController());
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: SizedBox(
        height: 120,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ShopCategoryCard(index: 0),
            ShopCategoryCard(index: 1),
            ShopCategoryCard(index: 2)
          ],
        ),
        // ListView.builder(
        //     itemCount: controller.categoryImages.length,
        //     scrollDirection: Axis.horizontal,
        //     itemBuilder: (context, index) {
        //       return Padding(
        //         padding: const EdgeInsets.all(0),
        //         child: GestureDetector(
        //           onTap: () {
        //             Get.to(ViewAllPage());
        //           },
        //           child: ShopCategoryCard(
        //             index: index,
        //           ),
        //         ),
        //       );
        //     }),
      ),
    );
  }
}
