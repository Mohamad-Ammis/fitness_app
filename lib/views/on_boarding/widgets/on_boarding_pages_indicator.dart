
import 'package:fitnessapp/constans.dart';
import 'package:fitnessapp/controller/on_boarding_controller.dart';
import 'package:fitnessapp/views/on_boarding/on_boarding.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBoardingPagesIndicator extends StatelessWidget {
  const OnBoardingPagesIndicator({
    super.key,
    required this.onBoardingController,
  });

  final OnBoardingController onBoardingController;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 50),
      child: SmoothPageIndicator(
        controller: pageController,
        count: onBoardingController.pages.length,
        effect:  ExpandingDotsEffect(
          dotWidth: 10,
            activeDotColor: Constans.secondryColor
            ,dotColor: Colors.grey.withOpacity(0.7),
            ),
      ),
    );
  }
}
