

import 'package:fitnessapp/controller/workout_page_controller.dart';
import 'package:fitnessapp/views/workout_page/widgets/exercises_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ExercisesListView extends StatelessWidget {
   ExercisesListView({
    super.key,
  });

  final controller=Get.put(WorkoutPageController());

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: controller.challengesImages.length,
        physics: const NeverScrollableScrollPhysics(),
        primary: false,
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return ExcercisesCard(image: controller.challengesImages[index]);
        });
  }
}

