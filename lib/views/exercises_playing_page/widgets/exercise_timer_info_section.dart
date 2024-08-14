import 'package:custom_timer/custom_timer.dart';
import 'package:fitnessapp/constans.dart';
import 'package:fitnessapp/controller/exercise_page_controller.dart';
import 'package:fitnessapp/controller/exercontrol.dart';
import 'package:fitnessapp/controller/playing_controller.dart';
import 'package:fitnessapp/controller/spec_day_controller.dart';
import 'package:fitnessapp/controller/workout_page_controller.dart';
import 'package:fitnessapp/models/exersice.dart';
import 'package:fitnessapp/views/exercise_page/widgets/exercise_page_body.dart';
import 'package:fitnessapp/views/exercises_playing_page/widgets/custom_timer_button.dart';
import 'package:fitnessapp/views/exercises_playing_page/widgets/finish_exercise_bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class InfoSection extends StatelessWidget {
  InfoSection({
    super.key,
    required CustomTimerController controller,
    required this.outerPageController,
    required this.index,
    required this.lastIndex,
    required this.model, required this.isCoachExercise,
  }) : _controller = controller;
  final int index;
  final int lastIndex;
  final ExerciseModel model;
  final CustomTimerController _controller;
  final PageController outerPageController;
  final bool isCoachExercise;
  final workoutPageController = Get.put(WorkoutPageController());
  final exerController = Get.put(Exercontroller());
  final specController = Get.put(SpecDay(),permanent: true);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<PlayingController>(
        init: PlayingController(),
        builder: (controller) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: () => Get.bottomSheet(

                    enterBottomSheetDuration: const Duration(milliseconds: 700),
                    exitBottomSheetDuration: const Duration(milliseconds: 700),
                    isScrollControlled: true,
                    SizedBox(
                        height: MediaQuery.sizeOf(context).height - 50,
                        child: ExercisePageBody(
                          model: model,
                        ))),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      model.name,
                      style: const TextStyle(
                          fontFamily: Constans.fontFamily,
                          fontSize: 25,
                          fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    const Icon(
                      Icons.info_outline,
                      color: Colors.black,
                      size: 26,
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              CustomTimer(
                controller: _controller,
                builder: (state, time) {
                  if (controller.nextPressed) {
                    workoutPageController.totalCalories -=
                        int.parse(model.calories);
                    debugPrint(
                        'workoutPageController.totalCalories: ${workoutPageController.totalCalories}');

                    debugPrint('time ${time.seconds}');
                    controller.nextPressed = false;
                    _controller.begin;
                    var seconds =
                        _controller.begin.inSeconds - int.parse(time.seconds);
                    var minuts =
                        _controller.begin.inMinutes - int.parse(time.minutes);
                    var totalTime = seconds + minuts;
                    debugPrint('totalTime: ${totalTime}');
                    debugPrint(
                        'workoutPageController.alltime: ${workoutPageController.alltime}');
                  }
                  if (_controller.state.value == CustomTimerState.finished) {
                    outerPageController.nextPage(
                        duration: const Duration(seconds: 1),
                        curve: Curves.linear);
                    workoutPageController.alltime += int.parse(model.time);
                  }
                  return Column(
                    children: [
                      Text("${time.minutes} : ${time.seconds}",
                          style: const TextStyle(
                              fontSize: 40.0,
                              fontFamily: Constans.fontFamily,
                              fontWeight: FontWeight.bold)),
                      const SizedBox(
                        height: 15,
                      ),
                      GestureDetector(
                        onTap: () async {
                          if (state == CustomTimerState.counting) {
                            _controller.pause();
                          } else if (state == CustomTimerState.finished &&
                              index == lastIndex - 1) {
                            var fullTime = 0;
                            var allCalories = 0;
                            debugPrint(
                                'workoutPageController.alltime: ${workoutPageController.alltime}');
                            for (var i = 0;
                                i < exerController.all_exer.length;
                                i++) {
                              workoutPageController.totalCalories += int.parse(
                                  exerController.all_exer[i].calories);
                              allCalories += int.parse(
                                  exerController.all_exer[i].calories);
                              fullTime +=
                                  int.parse(exerController.all_exer[i].time);
                            }
                            debugPrint(
                                'workoutPageController.totalCalories: ${workoutPageController.totalCalories}');
                            Get.back();
                            Get.back();
                            Get.bottomSheet(FinishExerciseBottomSheet(
                              exerciseNumber:
                                  exerController.all_exer.length.toString(),
                              totalTime:
                                  workoutPageController.alltime.toString(),
                              totalCalories: workoutPageController.totalCalories
                                  .toString(),
                            ));
                            await workoutPageController.updateReport(
                                allCalories, fullTime);if(isCoachExercise){
                              print("areej is here");
                             await specController.unlockedday();
                             print("deal"); 
                          } 
                          } else {
                            _controller.start();
                          }
                        },
                        child: Container(
                          width: 200,
                          padding: const EdgeInsets.all(12),
                          decoration: BoxDecoration(
                              color: state == CustomTimerState.finished
                                  ? Constans.test
                                  : Constans.test,
                              borderRadius: BorderRadius.circular(999)),
                          child: Center(
                              child: state == CustomTimerState.finished
                                  ? const CustomTimerButton(
                                      title: 'D O N E',
                                      icon: Icons.sports_gymnastics_rounded,
                                    )
                                  : state == CustomTimerState.counting
                                      ? const CustomTimerButton(
                                          title: 'P A U S E',
                                          icon: Icons.pause,
                                        )
                                      : state == CustomTimerState.paused
                                          ? const CustomTimerButton(
                                              title: 'P L A Y',
                                              icon: Icons.play_arrow_rounded)
                                          : const CustomTimerButton(
                                              title: 'S T A R T',
                                              icon: Icons.play_arrow)),
                        ),
                      )
                    ],
                  );
                },
              ),
            ],
          );
        });
  }
}
