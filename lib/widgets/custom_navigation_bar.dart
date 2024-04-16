import 'package:fitnessapp/controller/navigation_controller.dart';
import 'package:fitnessapp/widgets/nav_bar_item.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomNavigationBar extends StatelessWidget {
  CustomNavigationBar({
    super.key,
  });
  final controller = Get.put(NavigationController());
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 90,
      clipBehavior: Clip.hardEdge,
      width: MediaQuery.sizeOf(context).width,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(32), topRight: Radius.circular(32)),
      ),
      child: NavigationBar(
        backgroundColor: Colors.black,
        height: 90,
        elevation: 0,
        selectedIndex: controller.selectedIndex,
        destinations: [
          NavBarItem(
            index: 0,
            icon: Icons.home_outlined,
          ),
          NavBarItem(index: 1, icon: Icons.dashboard_outlined),
          NavBarItem(index: 2, icon: Icons.shopping_bag_outlined),
          NavBarItem(index: 3, icon: Icons.menu),
        ],
      ),
    );
  }
}
