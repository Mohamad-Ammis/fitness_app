import 'package:fitnessapp/models/exercises_category_item_model.dart';
import 'package:fitnessapp/utils/app_images.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class WorkoutPageController extends GetxController {
  List<DateTime>? disabledDates() {
    List<DateTime> days = [];
    int daysInMonth = DateTimeRange(
            start: DateTime(2024, DateTime.now().month),
            end: DateTime(DateTime.now().year, DateTime.now().month + 1))
        .duration
        .inDays;
    for (var i = 1; i <= daysInMonth; i++) {
      if (DateTime.now().day != i) {
        days.add(DateTime(2024, DateTime.now().month, i));
      }
    }
      debugPrint('daysInMonth: $daysInMonth');

    
    return days;
  }

  List<String> months = [
    'January',
    'February',
    'March',
    'April',
    'May',
    'June',
    'July',
    'August',
    'September',
    'October',
    'November',
    'December'
  ];
  bool categorySelected = false;
  final List challengesImages = const [
    Assets.imagesAthleteMan,
    Assets.imagesRegisterMan,
    Assets.imagesAthleteMan2,
    Assets.imagesBoxingGirl,
    Assets.imagesPlank,
  ];
  final List exercisesCategoryItems = [
    ExerciseCategoryItemModel(image: Assets.imagesChest, title: 'Chest'),
    ExerciseCategoryItemModel(image: Assets.imagesBack, title: 'Back'),
    ExerciseCategoryItemModel(image: Assets.imagesArms, title: 'Arms'),
    ExerciseCategoryItemModel(image: Assets.imagesLegs, title: 'Legs'),
    ExerciseCategoryItemModel(image: Assets.imagesGluteus, title: 'Gluteus'),
  ];
}
