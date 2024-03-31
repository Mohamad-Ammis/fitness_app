import 'package:fitnessapp/controller/on_boarding_controller.dart';
import 'package:fitnessapp/views/on_boarding/widgets/on_boarding_page.dart';
import 'package:fitnessapp/views/on_boarding/widgets/on_boarding_pages_indicator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

var pageController = PageController();

class OnBoarding extends StatelessWidget {
  OnBoarding({super.key});
  final onBoardingController = Get.put(OnBoardingController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.topCenter,
        children: [
          PageView(
            controller: pageController,
            children: [
              OnBoardingPage(page: onBoardingController.pages[0], index: 0,),
              OnBoardingPage(page: onBoardingController.pages[1], index: 1,),
              OnBoardingPage(page: onBoardingController.pages[2], index: 2,),
              OnBoardingPage(page: onBoardingController.pages[3], index: 3,),
            ],
          ),
          OnBoardingPagesIndicator(onBoardingController: onBoardingController),
          
        ],
      ),
    );
  }
}
