// ignore_for_file: avoid_print, prefer_contains

import 'dart:convert';
import 'package:fitnessapp/controller/datacont.dart';
import 'package:fitnessapp/main.dart';
import '../constans.dart';
import '../models/exercises_category_item_model.dart';
import '../models/muscle.dart';
import '../services/api.dart';
import '../utils/app_images.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class WorkoutPageController extends GetxController {
  int selectedCategory = 0;
  bool shimmerLoading = false;
  var alltime = 0;
  var totalCalories = 0;
  final controller = Get.put(Datacontroller(), permanent: true);

  @override
  onInit() async {
    chestExercise = [];
    backExercise = [];
    legExercise = [];
    armExercise = [];
    absExercise = [];
    allExercise = [];
    print("wwwwwwwwwwwwwwwwwwwwwwwwwwwwwww");
    final beginnerResponse = await http.get(
      Uri.parse(
          'http://${Constans.host}:8000/api/muscle/allArea?level=beginner'),
      headers: <String, String>{
        'Content-Type': 'application/json',
        'Authorization': 'Bearer ${userInfo!.getString('token')}',
      },
    );
    print(beginnerResponse.body);
    final intermediateResponse = await http.get(
      Uri.parse(
          'http://${Constans.host}:8000/api/muscle/allArea?level=intermediate'),
      headers: <String, String>{
        'Content-Type': 'application/json',
        'Authorization': 'Bearer ${userInfo!.getString('token')}',
      },
    );
    // print(intermediateResponse.body);
    final advancedResponse = await http.get(
      Uri.parse(
          'http://${Constans.host}:8000/api/muscle/allArea?level=advanced'),
      headers: <String, String>{
        'Content-Type': 'application/json',
        'Authorization': 'Bearer ${userInfo!.getString('token')}',
      },
    );
    // print(advancedResponse.body);
    print(beginnerResponse.statusCode);
    if (beginnerResponse.statusCode == 200 &&
        intermediateResponse.statusCode == 200 &&
        advancedResponse.statusCode == 200) {
      var beginnerData = jsonDecode(beginnerResponse.body)['muscle_stats'];
      var intermediateData =
          jsonDecode(intermediateResponse.body)['muscle_stats'];
      var advancedData = jsonDecode(advancedResponse.body)['muscle_stats'];
      for (var i = 0; i < beginnerData.length; i++) {
        if (beginnerData[i]['muscle_area'].toString() == 'CHEST') {
          final model = Muscle.fromJson(beginnerData[i]);
          if (chestExercise.indexOf(model) == -1) {
            chestExercise.add(model);
          }
        } else if (beginnerData[i]['muscle_area'].toString() == 'ARM') {
          final model = Muscle.fromJson(beginnerData[i]);
          if (armExercise.indexOf(model) == -1) {
            armExercise.add(model);
          }
        } else if (beginnerData[i]['muscle_area'].toString() == 'ABS') {
          final model = Muscle.fromJson(beginnerData[i]);
          if (absExercise.indexOf(model) == -1) {
            absExercise.add(model);
          }
        } else if (beginnerData[i]['muscle_area'].toString() ==
            'SHOULDER&Back') {
          final model = Muscle.fromJson(beginnerData[i]);
          if (backExercise.indexOf(model) == -1) {
            backExercise.add(model);
          }
        } else if (beginnerData[i]['muscle_area'].toString() == 'LEG') {
          final model = Muscle.fromJson(beginnerData[i]);
          if (legExercise.indexOf(model) == -1) {
            legExercise.add(model);
          }
        }
      }
      for (var i = 0; i < intermediateData.length; i++) {
        if (intermediateData[i]['muscle_area'].toString() == 'CHEST') {
          final model = Muscle.fromJson(intermediateData[i]);
          if (chestExercise.indexOf(model) == -1) {
            chestExercise.add(model);
          }
        } else if (intermediateData[i]['muscle_area'].toString() == 'ARM') {
          final model = Muscle.fromJson(intermediateData[i]);
          if (armExercise.indexOf(model) == -1) {
            armExercise.add(model);
          }
        } else if (intermediateData[i]['muscle_area'].toString() == 'ABS') {
          final model = Muscle.fromJson(intermediateData[i]);
          if (absExercise.indexOf(model) == -1) {
            absExercise.add(model);
          }
        } else if (intermediateData[i]['muscle_area'].toString() ==
            'SHOULDER&Back') {
          final model = Muscle.fromJson(intermediateData[i]);
          if (backExercise.indexOf(model) == -1) {
            backExercise.add(model);
          }
        } else if (intermediateData[i]['muscle_area'].toString() == 'LEG') {
          final model = Muscle.fromJson(intermediateData[i]);
          if (legExercise.indexOf(model) == -1) {
            legExercise.add(model);
          }
        }
      }
      for (var i = 0; i < advancedData.length; i++) {
        if (advancedData[i]['muscle_area'].toString() == 'CHEST') {
          final model = Muscle.fromJson(advancedData[i]);
          if (chestExercise.indexOf(model) == -1) {
            chestExercise.add(model);
          }
        } else if (advancedData[i]['muscle_area'].toString() == 'ARM') {
          final model = Muscle.fromJson(advancedData[i]);
          if (armExercise.indexOf(model) == -1) {
            armExercise.add(model);
          }
        } else if (advancedData[i]['muscle_area'].toString() == 'ABS') {
          final model = Muscle.fromJson(advancedData[i]);
          if (absExercise.indexOf(model) == -1) {
            absExercise.add(model);
          }
        } else if (advancedData[i]['muscle_area'].toString() ==
            'SHOULDER&Back') {
          final model = Muscle.fromJson(advancedData[i]);
          if (backExercise.indexOf(model) == -1) {
            backExercise.add(model);
          }
        } else if (advancedData[i]['muscle_area'].toString() == 'LEG') {
          final model = Muscle.fromJson(advancedData[i]);
          if (legExercise.indexOf(model) == -1) {
            legExercise.add(model);
          }
        }
      }
      allExercise = absExercise +
          armExercise +
          chestExercise +
          backExercise +
          legExercise;
      finalList = allExercise;
      print(finalList);
      super.onInit();
    }
  }

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
    Assets.imagesMan,
    Assets.imagesWomanChest4,
  ];
  final List exercisesCategoryItems = [
    ExerciseCategoryItemModel(image: Assets.imagesFullbodyIcon, title: 'All '),
    ExerciseCategoryItemModel(image: Assets.imagesChest, title: 'Chest'),
    ExerciseCategoryItemModel(image: Assets.imagesBack, title: 'Back'),
    ExerciseCategoryItemModel(image: Assets.imagesArms, title: 'Arms'),
    ExerciseCategoryItemModel(image: Assets.imagesLegs, title: 'Legs'),
    ExerciseCategoryItemModel(image: Assets.imagesAbsIcon1, title: 'Abs '),
  ];
  List chestExercise = [];
  List backExercise = [];
  List armExercise = [];
  List legExercise = [];
  List absExercise = [];
  List allExercise = [];
  List finalList = [];

  changeFilterList(int index) {
    final filterList = [
      allExercise,
      chestExercise,
      backExercise,
      armExercise,
      legExercise,
      absExercise
    ];
    debugPrint('object:');
    finalList = filterList[index];
    update();
  }

  getChallenge(String? token, url) async {
    shimmerLoading = true;
    update();
    final data = await Api().getData(token, url);
    debugPrint('challenges  : $data');
    shimmerLoading = false;
    update();
    return data;
  }

  Future updateChallenge(id, type, timer, counter, name) async {
    final response = await http.post(
        Uri.parse('${Constans.baseUrl}challenge/updateChallenge/$id'),
        headers: <String, String>{
          'Accept': 'application/json',
          'Authorization': 'Bearer ${userInfo!.getString('token')}',
        },
        body: type == 'timer'
            ? {
                'type': type,
                'timer': timer,
                'challenge_name': name,
              }
            : {
                'type': type,
                'counter': counter,
                'challenge_name': name,
              });
    var data = jsonDecode(response.body);
    if (response.statusCode == 200) {
      debugPrint('updated success $data');
    } else {
      debugPrint('error when update challenge $data');
    }
  }
}
