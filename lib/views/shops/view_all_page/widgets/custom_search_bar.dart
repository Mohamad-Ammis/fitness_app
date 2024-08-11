import 'package:fitnessapp/controller/shop_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomSearchBar extends StatefulWidget {
  const CustomSearchBar({super.key, required this.index});
  final int index;
  @override
  State<CustomSearchBar> createState() => _CustomSearchBarState();
}

class _CustomSearchBarState extends State<CustomSearchBar> {
  int counter = 0;
  bool showFilter = false;
  final controller = Get.put(ShopController());
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
                    onSubmitted: (data) async {
                      if (data.isNotEmpty) {
                        controller.viewAllProducts =
                            await controller.productsSearch(
                                data,
                                widget.index == 0
                                    ? 'Clothes'
                                    : widget.index == 1
                                        ? 'Sports_equipment'
                                        : 'Food_Supplements');
                        controller.update();
                      } else {
                        controller.viewAllProducts =
                            controller.tempViewAllProducts;
                        controller.update();
                      }
                    },
                    maxLines: 1,
                    cursorColor: Colors.black,
                    decoration: InputDecoration(
                      hintText: "Search here...",
                      hintStyle: TextStyle(
                          height: 2, color: Colors.black.withOpacity(0.2)),
                      prefixIcon: const Icon(Icons.search),
                      border: InputBorder.none,
                    ),
                  ),
                ),
              ),
              widget.index == 0
                  ? Container(
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
                  : Container()
            ],
          ),
          showFilter
              ? GetBuilder<ShopController>(builder: (controller) {
                  return Center(
                    child: Container(
                      alignment: Alignment.center,
                      height: 70,
                      child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: controller.categoryNames.length,
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
                                label: Text(controller.categoryNames[index]),
                                onSelected: (value) async {
                                  if (controller.selectedIndex == index) {
                                    controller.selectedIndex = -1;
                                    controller.update();
                                  } else {
                                    controller.selectedIndex = index;
                                    controller.update();
                                  }
                                  controller.viewAllProducts =
                                      await controller.productsCategorySearch();
                                  controller.update();
                                },
                                selected: controller.selectedIndex == index
                                    ? true
                                    : false,
                              ),
                            );
                          }),
                    ),
                  );
                })
              : Container()
        ],
      ),
    );
  }
}
