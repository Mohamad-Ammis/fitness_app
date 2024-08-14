import 'package:fitnessapp/controller/product_page_controller.dart';
import 'package:fitnessapp/controller/shop_controller.dart';
import 'package:fitnessapp/models/shop/product_model.dart';
import 'package:fitnessapp/views/shops/home_page/widgets/shop_category_card.dart';
import 'package:fitnessapp/views/shops/product_page/widgets/product_details_section.dart';
import 'package:fitnessapp/views/shops/product_page/widgets/product_image_section.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductPage extends StatefulWidget {
  ProductPage({super.key, required this.model});
  final ProductModel model;

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  // final ProductModel model;
  final productController = Get.put(
    ProductPageController(),
  );
  final shopController = Get.put(
    ShopController(),
  );
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await shopController.showProduct(widget.model.id);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          ProductPageImageSection(model: widget.model,isFavorite: widget.model.isFavorite,),
          ProductPageDetailsSection(model: widget.model),
        ],
      ),
    );
  }
}
