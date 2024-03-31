
import 'package:fitnessapp/constans.dart';
import 'package:fitnessapp/models/on_boarding_model.dart';
import 'package:fitnessapp/views/on_boarding/widgets/on_boarding_button.dart';
import 'package:flutter/material.dart';

class OnBoardingPageInfo extends StatelessWidget {
  const OnBoardingPageInfo({
    super.key, required this.model,
  });
  final OnBoardingModel model;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
         Center(
           child: Text(
            model.title,
            style:const  TextStyle(
                color: Constans.primaryColor,
                fontSize: 36,
                fontFamily: 'Work Sans',
                fontWeight: FontWeight.bold,
                height: 1),
                   ),
         ),
        model.haveUniqueTitle? Text(model.uniqueTitle!,
            style:const TextStyle(
                color: Constans.secondryColor,
                fontSize: 48,
                fontFamily: 'Work Sans',
                fontWeight: FontWeight.bold)):const SizedBox(height: 20,),
        Text(model.subTitle,
            style: TextStyle(
                color: Constans.subTitleColor,
                fontSize: 14,
                fontFamily: 'Work Sans',
                fontWeight: FontWeight.normal)),
        const SizedBox(
          height: 10,
        ),
        OnBoardingCustomButton(model: model,)
      ],
    );
  }
}
