import 'package:custom_timer/custom_timer.dart';
import 'package:fitnessapp/constans.dart';
import 'package:fitnessapp/models/exersice.dart';
import 'package:fitnessapp/views/exercise_page/widgets/exercise_page_body.dart';
import 'package:fitnessapp/views/exercises_playing_page/widgets/custom_timer_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class InfoSection extends StatelessWidget {
  const InfoSection({
    super.key,
    required CustomTimerController controller,
    required this.outerPageController, required this.index, required this.lastIndex, required this.model,
  }) : _controller = controller;
  final int index;
  final int lastIndex;
  final ExerciseModel model;
  final CustomTimerController _controller;
  final PageController outerPageController;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        GestureDetector(
          onTap: () => Get.bottomSheet(
              enterBottomSheetDuration: Duration(milliseconds: 700),
              exitBottomSheetDuration: Duration(milliseconds: 700),
              isScrollControlled: true,
              SizedBox(
                  height: MediaQuery.sizeOf(context).height - 50,
                  child: ExercisePageBody(model: model,))),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
               Text(
                model.name,
                style: TextStyle(
                    fontFamily: Constans.fontFamily,
                    fontSize: 25,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                width: 5,
              ),
              Icon(
                Icons.info_outline,
                color: Colors.black,
                size: 26,
              )
            ],
          ),
        ),
        SizedBox(
          height: 20,
        ),
        CustomTimer(
          controller: _controller,
          builder: (state, time) {
            if (_controller.state.value == CustomTimerState.finished) {
              outerPageController.nextPage(
                  duration: Duration(seconds: 1), curve: Curves.linear);
                  
            }
            return Column(
              children: [
                Text("${time.minutes} : ${time.seconds}",
                    style: const TextStyle(
                        fontSize: 40.0,
                        fontFamily: Constans.fontFamily,
                        fontWeight: FontWeight.bold)),
                SizedBox(
                  height: 15,
                ),
                GestureDetector(
                  onTap: () {
                    if (state == CustomTimerState.counting) {
                      _controller.pause();
                    } else if (state == CustomTimerState.finished&&index==lastIndex-1) {
                      Get.back();
                      Get.back();
                    } else {
                      _controller.start();
                    }
                  },
                  child: Container(
                    width: 200,
                    padding: EdgeInsets.all(12),
                    decoration: BoxDecoration(
                        color: state == CustomTimerState.finished
                            ? Constans.test
                            : Constans.test,
                        borderRadius: BorderRadius.circular(999)),
                    child: Center(
                        child: state == CustomTimerState.finished
                            ? CustomTimerButton(
                                title: 'D O N E',
                                icon: Icons.sports_gymnastics_rounded,
                              )
                            : state == CustomTimerState.counting
                                ? CustomTimerButton(
                                    title: 'P A U S E',
                                    icon: Icons.pause,
                                  )
                                : state == CustomTimerState.paused
                                    ? CustomTimerButton(
                                        title: 'P L A Y',
                                        icon: Icons.play_arrow_rounded)
                                    : CustomTimerButton(
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
  }
}
