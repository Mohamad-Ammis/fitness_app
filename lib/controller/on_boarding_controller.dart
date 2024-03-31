import 'package:fitnessapp/models/on_boarding_model.dart';
import 'package:fitnessapp/utils/app_images.dart';
import 'package:fitnessapp/views/on_boarding/on_boarding.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OnBoardingController extends GetxController{
    final pages = [
    OnBoardingModel(
        title: "Welcome To",
        subTitle: 'Your personal fitness Assistant',
        uniqueTitle: "Fitness App",
        haveUniqueTitle: true,
        buttonText: 'Next',
        onTap: () {
          pageController.animateToPage(1, duration: const Duration(seconds: 1),curve: Curves.decelerate);
        },
        image: Assets.imagesAthleteMan),
    OnBoardingModel(
        title: " Personalized\nFitness Plans",
        subTitle: 'Create Your Fitness Journey With us',
        uniqueTitle: "Fitness App",
        haveUniqueTitle: false,
        buttonText: 'Next',
        onTap: () {
          pageController.animateToPage(2, duration:const  Duration(seconds: 1),curve: Curves.decelerate);
        },
        image: Assets.imagesBoxingGirl),
    OnBoardingModel(
        title: " Health Metrics\nFitness Analytic",
        subTitle: 'Monitor your health profile with ease',
        uniqueTitle: "Fitness App",
        haveUniqueTitle: false,
        buttonText: 'Next',
        onTap: () {
          pageController.animateToPage(3, duration:const  Duration(seconds: 1),curve: Curves.decelerate);
        },
        image: Assets.imagesAthleteMan2),
    OnBoardingModel(
        title: "  Nutrition &\nDiet Guidance",
        subTitle: 'Lose weight and get fit with sandow! ',
        uniqueTitle: "Fitness App",
        haveUniqueTitle: false,
        buttonText: 'Get Started',
        onTap: () {
          Get.offAllNamed('/login');
        },
        image: Assets.imagesFruits)
  ];
}