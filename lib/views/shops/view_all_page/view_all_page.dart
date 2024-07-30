import 'package:fitnessapp/controller/shop_controller.dart';
import 'package:fitnessapp/models/shop/product_model.dart';
import 'package:fitnessapp/views/shops/home_page/widgets/trend_product_card.dart';
import 'package:fitnessapp/views/shops/product_page/product_page.dart';
import 'package:fitnessapp/views/shops/view_all_page/widgets/custom_search_bar.dart';
import 'package:fitnessapp/widgets/shimmer/shimmer_custom_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';

class ViewAllPage extends StatefulWidget {
  const ViewAllPage({
    super.key,
  });
  @override
  State<ViewAllPage> createState() => _ViewAllPageState();
}

class _ViewAllPageState extends State<ViewAllPage> {
  final controller = Get.put(ShopController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xFFF3F4F6),
        appBar: AppBar(
          title: const Text("All Products"),
          centerTitle: true,
          backgroundColor: const Color(0xFFF3F4F6),
          scrolledUnderElevation: 0,
        ),
        body: GetBuilder<ShopController>(builder: (controller) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const CustomSearchBar(),
              controller.viewAllProducts.isEmpty
                  ? Text('No Products to show')
                  : Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child:
                            GetBuilder<ShopController>(builder: (controller) {
                          return ViewAllPageProductsList(
                            products: controller.viewAllProducts,
                          );
                        }),
                      ),
                    )
            ],
          );
        }));
  }
}

class ViewAllPageProductsList extends StatelessWidget {
  const ViewAllPageProductsList({
    super.key,
    required this.products,
  });
  final List products;
  @override
  Widget build(BuildContext context) {
    return GetBuilder<ShopController>(builder: (controller) {
      return GridView.custom(
        gridDelegate: SliverWovenGridDelegate.count(
          crossAxisCount: 2,
          mainAxisSpacing: 0,
          crossAxisSpacing: 8,
          pattern: [
            const WovenGridTile(.68),
            const WovenGridTile(
              5 / 8.5,
              crossAxisRatio: 1,
              alignment: AlignmentDirectional.center,
            ),
          ],
        ),
        childrenDelegate: SliverChildBuilderDelegate(
          (context, index) => GestureDetector(
            onTap: () {},
            child: controller.viewAllProductsLoading || controller.searchLoading
                ? const ShimmerContainer(
                    width: 200, height: 200, circularRadius: 16)
                : GestureDetector(
                    onTap: () {
                      Get.to(() => ProductPage(
                          model: ProductModel.fromJson(products[index])));
                    },
                    child: TrendProductCard(
                      model: ProductModel.fromJson(products[index]),
                    ),
                  ),
          ),
          childCount: controller.viewAllProductsLoading ? 4 : products.length,
        ),
      );
    });
  }
}
