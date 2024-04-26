import 'package:fitnessapp/models/on_boarding_model.dart';
import 'package:fitnessapp/views/on_boarding/on_boarding.dart';
import 'package:fitnessapp/views/on_boarding/widgets/on_boarding_page_info.dart';
import 'package:flutter/material.dart';

class OnBoardingPageBody extends StatelessWidget {
  const OnBoardingPageBody({
    super.key,
    required this.pageInfo,
    required this.index,
  });
  final OnBoardingModel pageInfo;
  final int index;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        index != 3
            ? Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 45, right: 20),
                    child: GestureDetector(
                      onTap: () {
                        handelSkipButton();
                      },
                      child:const  Text(
                        'Skip',
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ],
              )
            : Container(),
        const Expanded(
          child: SizedBox(),
        ),
        OnBoardingPageInfo(
          model: pageInfo,
        ),
        const SizedBox(
          height: 40,
        )
      ],
    );
  }

  void handelSkipButton() {
    if (index == 0) {
      pageController.animateToPage(3,
          duration: const Duration(milliseconds: 1500),
          curve: Curves.decelerate);
    } else if (index == 1) {
      pageController.animateToPage(3,
          duration: const Duration(milliseconds: 1100),
          curve: Curves.decelerate);
    } else if (index == 2) {
      pageController.animateToPage(3,
          duration: const Duration(milliseconds: 500),
          curve: Curves.decelerate);
    } else {}
  }
}
