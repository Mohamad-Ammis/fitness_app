


import 'package:fitnessapp/constans.dart';
import 'package:fitnessapp/models/on_boarding_model.dart';
import 'package:flutter/material.dart';

class OnBoardingCustomButton extends StatelessWidget {
  const OnBoardingCustomButton({
    super.key, required this.model, 
  });
  final OnBoardingModel model;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: model.onTap,
      child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            color: Constans.secondryColor,
          ),
          margin: const EdgeInsets.symmetric(horizontal: 40),
          padding: const EdgeInsets.all(16.0),
          child:  Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                model.buttonText,
                style:const  TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontFamily: 'Work Sans',
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              const Icon(Icons.arrow_forward_rounded)
            ],
          )),
    );
  }
}
