import 'package:fitnessapp/controller/product_page_controller.dart';
import 'package:fitnessapp/views/shops/product_page/widgets/product_details_section.dart';
import 'package:fitnessapp/views/shops/product_page/widgets/product_image_section.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductPage extends StatelessWidget {
  ProductPage({super.key});
  final productController = Get.lazyPut(
    () => ProductPageController(),
  );
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          ProductPageImageSection(),
          ProductPageDetailsSection(),
        ],
      ),
    );
  }
}
