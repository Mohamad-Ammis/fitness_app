import 'package:fitnessapp/constans.dart';
import 'package:fitnessapp/controller/workout_page_controller.dart';
import 'package:fitnessapp/models/exercises_category_item_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class ExercisesCategoryItem extends StatelessWidget {
  ExercisesCategoryItem({
    super.key,
    required this.itemModel,
  });
  final controller = Get.put(WorkoutPageController());
  final ExerciseCategoryItemModel itemModel;
  bool selected = false;
  @override
  Widget build(BuildContext context) {
    return GetBuilder<WorkoutPageController>(builder: (controller) {
      return Padding(
        padding: const EdgeInsets.only(right: 8),
        child: GestureDetector(
            onTap: () {
              selected = !(selected);
              controller.update();
            },
            child: Container(
              padding: const EdgeInsets.all(6),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(
                      width: 0.4, color: Colors.black.withOpacity(0.3)),
                  color: selected ? Colors.black : null),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircleAvatar(
                    backgroundColor: Colors.transparent,
                    child: Image.asset(
                      itemModel.image,
                      color: selected ? Colors.white : null,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Text(
                    itemModel.title,
                    style: TextStyle(
                        fontSize: 15,
                        fontFamily: Constans.fontFamily,
                        fontWeight: FontWeight.w500,
                        color: selected ? Colors.white : null),
                  )
                ],
              ),
            )),
      );
    });
  }
}
