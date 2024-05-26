import 'package:fitnessapp/views/exercise_page/widgets/exercise_page_body.dart';
import 'package:fitnessapp/views/exercises_playing_page/widgets/bottom_page_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PlayingExercisePage extends StatelessWidget {
  const PlayingExercisePage({
    super.key,
    required this.innerPageController,
    required this.outerPageController, required this.index, required this.lastIndex,required this.gif
  });
  final int index;
  final int lastIndex;
  final PageController innerPageController;
  final PageController outerPageController;
  final String gif;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: MediaQuery.sizeOf(context).width,
          height: MediaQuery.sizeOf(context).height / 3 * 2,
          decoration: const BoxDecoration(
              border: Border(bottom: BorderSide(width: 0.1))),
          child: Image.asset(
            gif,
            fit: BoxFit.fill,
          ),
        ),
        Positioned(
            top: 40,
            right: 10,
            child: IconButton(
                onPressed: () {
                  Get.bottomSheet(
                      enterBottomSheetDuration: Duration(milliseconds: 700),
                      exitBottomSheetDuration: Duration(milliseconds: 700),
                      isScrollControlled: true,
                      SizedBox(
                          height: MediaQuery.sizeOf(context).height - 50,
                          child: ExercisePageBody()));
                },
                icon: Icon(
                  Icons.info_outline,
                  size: 30,
                  color: Colors.grey,
                ))),
        BottomPageView(innerPageController: innerPageController, outerPageController: outerPageController, index: index, lastIndex: lastIndex,),
      ],
    );
  }
}

