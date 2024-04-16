
import 'package:fitnessapp/controller/workout_page_controller.dart';
import 'package:fitnessapp/views/workout_page/widgets/exercises_category_item.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ExercisesCategoryListView extends StatelessWidget {
   ExercisesCategoryListView({
    super.key,
  });
  final controller = Get.put(WorkoutPageController());
  @override
  Widget build(BuildContext context) {
    return Container(
      padding:const  EdgeInsets.symmetric(horizontal: 12),
      height: 40,
      child: ListView.builder(
          itemCount: controller.exercisesCategoryItems.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return ExercisesCategoryItem(itemModel: controller.exercisesCategoryItems[index],);
          }),
    );
  }
}
