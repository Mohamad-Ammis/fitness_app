import 'package:fitnessapp/controller/exercontrol.dart';
import 'package:fitnessapp/views/exercises_playing_page/widgets/playing_exercise_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PlayingExercises extends StatefulWidget {
  const PlayingExercises({super.key,required this.isCoachExercise});
  final bool isCoachExercise;
  @override
  State<PlayingExercises> createState() => _PlayingExercisesState();
}

class _PlayingExercisesState extends State<PlayingExercises> {
  final PageController innerPageController = PageController();
  final outerPageController = PageController();
  final controller=Get.put(Exercontroller());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: PageView.builder(
          physics: const NeverScrollableScrollPhysics(),
            itemCount: controller.all_exer.length,
            controller: outerPageController,
            itemBuilder: (context, index) {
              return PlayingExercisePage(
                isCoachExercise:widget.isCoachExercise,
                innerPageController: innerPageController,
                outerPageController: outerPageController,
                index: index,
                lastIndex: controller.all_exer.length, model:controller.all_exer[index] ,
              );
            }));
  }
}
