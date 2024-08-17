import 'package:custom_timer/custom_timer.dart';
import 'package:fitnessapp/constans.dart';
import 'package:fitnessapp/controller/workout_page_controller.dart';
import 'package:fitnessapp/models/challenge_model.dart';
import 'package:fitnessapp/views/exercises_playing_page/widgets/custom_timer_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:panara_dialogs/panara_dialogs.dart';

class TimerChallengeBody extends StatefulWidget {
  const TimerChallengeBody({
    super.key,
    required this.model,
  });

  final ChallengeModel model;
  @override
  State<TimerChallengeBody> createState() => _TimerChallengeBodyState();
}

class _TimerChallengeBodyState extends State<TimerChallengeBody>
    with SingleTickerProviderStateMixin {
  late final CustomTimerController _controller = CustomTimerController(
    vsync: this,
    begin: const Duration(seconds: 0),
    end: const Duration(days: 1000),
  );
  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  final controller = Get.put(WorkoutPageController());

  @override
  Widget build(BuildContext context) {
    return CustomTimer(
      controller: _controller,
      builder: (state, time) {
        if (_controller.state.value == CustomTimerState.finished) {}
        return Column(
          children: [
            Text("${time.minutes} : ${time.seconds}",
                style: const TextStyle(
                    color: Colors.white,
                    fontSize: 50.0,
                    fontFamily: Constans.fontFamily,
                    fontWeight: FontWeight.bold)),
            const SizedBox(
              height: 50,
            ),
            GestureDetector(
              onTap: () {
                if (state == CustomTimerState.counting) {
                  _controller.pause();
                } else if (state == CustomTimerState.finished) {
                  Get.back();
                  Get.back();
                } else {
                  _controller.start();
                }
              },
              child: Container(
                width: 280,
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.2),
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
            ),
            const SizedBox(
              height: 16,
            ),
            GestureDetector(
              onTap: () {
                _controller.pause();
                PanaraConfirmDialog.show(
                  context,
                  title: "Are you sure",
                  message:
                      "do you want to exit this challenge ?\n Save your result or exit directly",
                  confirmButtonText: "E X I T",
                  cancelButtonText: "S A V E",
                  onTapCancel: () async {
                    Get.back();
                    Get.back();
                    String updateTime =
                        (int.parse(time.minutes) + int.parse(time.seconds))
                            .toString();
                        debugPrint('int.parse(time.minutes): ${int.parse(time.minutes)}');
                        debugPrint('time.minutes: ${time.minutes}');
                    debugPrint('updateTime: $updateTime');
                    await controller.updateChallenge(
                        widget.model.id.toString(),
                        widget.model.type.toString(),
                        updateTime,
                        null,
                        widget.model.name);
                  },
                  onTapConfirm: () {
                    _controller.start();
                    Navigator.pop(context);
                  },
                  panaraDialogType: PanaraDialogType.warning,
                );
              },
              child: Container(
                width: 280,
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(999)),
                child: const Center(
                  child: Text(
                    "E X I T ",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 24,
                        fontFamily: Constans.fontFamily,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            )
          ],
        );
      },
    );
  }
}
