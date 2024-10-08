
import 'package:fitnessapp/models/exersice.dart';
import 'package:fitnessapp/views/exercises_playing_page/widgets/bottom_tap_bar.dart';
import 'package:fitnessapp/views/exercises_playing_page/widgets/custom_exercise_timer.dart';
import 'package:fitnessapp/views/exercises_playing_page/widgets/ready_exercise_page.dart';
import 'package:flutter/material.dart';

class BottomPageView extends StatelessWidget {
  const BottomPageView({
    super.key,
    required this.innerPageController,
    required this.outerPageController, required this.index, required this.lastIndex, required this.model, required this.isCoachExercise,
  });
  final int index;
  final int lastIndex;
  final PageController innerPageController;
  final PageController outerPageController;
  final ExerciseModel model;
  final bool isCoachExercise;
  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: MediaQuery.sizeOf(context).height * 2 / 3 - 40,
      child: Container(
        clipBehavior: Clip.hardEdge,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(40), topRight: Radius.circular(40)),
          boxShadow: [
            BoxShadow(
                offset: const Offset(0, 0),
                blurRadius: 5,
                spreadRadius: 10,
                color: Colors.black.withOpacity(0.1))
          ],
        ),
        width: MediaQuery.sizeOf(context).width,
        height: MediaQuery.sizeOf(context).height / 3 + 40,
        child: PageView(
          physics: const NeverScrollableScrollPhysics(),
          controller: innerPageController,
          children: [
            ReadyExercisePage(
              pageController: innerPageController, model: model,
            ),
            Stack(
              children: [
                CustomExerciseTimer(
                  isCoachExercise: isCoachExercise,
                  outerPageController: outerPageController, index: index, lastIndex: lastIndex, model: model,
                ),
                BottomTapBar(index: index, lastIndex: lastIndex, outerPageController: outerPageController,)
              ],
            ),
          ],
        ),
      ),
    );
  }
}
