
import 'package:fitnessapp/constans.dart';
import 'package:fitnessapp/controller/navigation_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NavBarItem extends StatelessWidget {
  NavBarItem({
    super.key, required this.index, required this.icon,
  });
  final controller=Get.put(NavigationController());
  final int index;
  final IconData icon;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        controller.selectedIndex = index;
        controller.update();
      },
      child: CircleAvatar(
        radius: 28,
        backgroundColor: controller.selectedIndex == index
            ? Constans.test
            : Colors.transparent,
        child: Icon(icon,color: controller.selectedIndex==index?Colors.white:Colors.white,),
      ),
    );
  }
}
