import 'package:fitnessapp/views/shops/home_page/widgets/trend_product_card.dart';
import 'package:fitnessapp/views/shops/view_all_page/widgets/custom_search_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class ViewAllPage extends StatefulWidget {
  const ViewAllPage({super.key});

  @override
  State<ViewAllPage> createState() => _ViewAllPageState();
}

class _ViewAllPageState extends State<ViewAllPage> {
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
        body: Column(
          children: [
            const CustomSearchBar(),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: ViewAllPageProductsList(),
              ),
            )
          ],
        ));
  }
}

class ViewAllPageProductsList extends StatelessWidget {
  const ViewAllPageProductsList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
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
          child: Container(),
        ),
        childCount: 10,
      ),
    );
  }
}
