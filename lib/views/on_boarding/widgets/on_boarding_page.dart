import 'package:fitnessapp/models/on_boarding_model.dart';
import 'package:fitnessapp/views/on_boarding/widgets/on_boarding_page_body.dart';
import 'package:flutter/material.dart';

class OnBoardingPage extends StatelessWidget {
  const OnBoardingPage({
    super.key,
    required this.page,
    required this.index,
  });

  final OnBoardingModel page;

  final int index;
  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(page.image,),
            fit: BoxFit.cover,
          ),
        ),
        child: OnBoardingPageBody(
          pageInfo: page,
          index: index,
        ));
  }
}
