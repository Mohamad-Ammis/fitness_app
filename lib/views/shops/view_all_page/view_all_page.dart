import 'package:fitnessapp/views/shops/home_page/widgets/trend_product_card.dart';
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
                child: GridView.custom(
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
                      child: const TrendProductCard(),
                    ),
                    childCount: 10,
                  ),
                ),
              ),
            )
          ],
        ));
  }
}

class CustomSearchBar extends StatefulWidget {
  const CustomSearchBar({super.key});

  @override
  State<CustomSearchBar> createState() => _CustomSearchBarState();
}

class _CustomSearchBarState extends State<CustomSearchBar> {
  int counter = 0;
  bool showFilter = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      decoration: const BoxDecoration(color: Colors.transparent),
      margin: const EdgeInsets.only(left: 10, right: 40, top: 10, bottom: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: Container(
                  padding: const EdgeInsets.only(top: 4),
                  margin: const EdgeInsets.only(left: 30, top: 10, right: 10),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: [
                        BoxShadow(
                            blurRadius: 10, color: Colors.black.withOpacity(.1))
                      ]
                      // border: Border.all(color: Colors.grey, width: 0
                      // )
                      ),
                    child: TextField(
                      onChanged: (data) {},
                      cursorColor: Colors.black,
                      decoration: InputDecoration(
                        hintText: "Search here...",
                        hintStyle:
                            TextStyle(color: Colors.black.withOpacity(0.2)),
                        prefixIcon: const Icon(Icons.search),
                        border: InputBorder.none,
                      ),
                    ),
                ),
              ),
              Container(
                  margin: const EdgeInsets.only(top: 10),
                  decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(10)),
                  child: IconButton(
                      onPressed: () {
                        setState(() {
                          if (counter.isEven) {
                            showFilter = true;
                          } else {
                            showFilter = false;
                          }
                          counter++;
                        });
                      },
                      icon: const Icon(
                        Icons.filter_list,
                        color: Colors.white,
                      )))
            ],
          ),
          showFilter
              ? Center(
                  child: Container(
                    alignment: Alignment.center,
                    height: 70,
                    child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: 4,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: ChoiceChip(
                              labelStyle: const TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                              backgroundColor: Colors.black,
                              selectedColor: Colors.black,
                              checkmarkColor: Colors.white,
                              label: const Text('as'),
                              onSelected: (value) {},
                              selected: false,
                            ),
                          );
                        }),
                  ),
                )
              : Container()
        ],
      ),
    );
  }
}
