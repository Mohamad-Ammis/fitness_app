import 'package:fitnessapp/constans.dart';
import 'package:fitnessapp/controller/navigation_controller.dart';
import 'package:fitnessapp/widgets/custom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class WorkoutPage extends StatelessWidget {
  WorkoutPage({super.key});
  final navigationController = Get.put(NavigationController());
  @override
  Widget build(BuildContext context) {
    return GetBuilder<NavigationController>(builder: (navigationController) {
      return Scaffold(
          backgroundColor: const Color(0xFFF3F4F6),
          appBar: navigationController.selectedIndex > 0 &&
                  navigationController.selectedIndex != 3 &&
                  navigationController.selectedIndex !=2
              ? AppBar(
                  title: const Text(
                    "Home Workout",
                    style: TextStyle(
                        fontFamily: Constans.fontFamily,
                        fontSize: 22,
                        fontWeight: FontWeight.bold),
                  ),
                  backgroundColor: Colors.transparent,
                  elevation: 0,
                  scrolledUnderElevation: 0,
                )
              : null,
          bottomNavigationBar: CustomNavigationBar(),
          body:
              navigationController.screens[navigationController.selectedIndex]);
    });
  }
}
