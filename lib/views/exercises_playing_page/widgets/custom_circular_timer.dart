
import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:fitnessapp/constans.dart';
import 'package:flutter/material.dart';

class CustomCirculatTimer extends StatelessWidget {
  const CustomCirculatTimer({
    super.key,
    required CountDownController controller,
    required this.pageController,
  }) : _controller = controller;

  final CountDownController _controller;
  final PageController pageController;

  @override
  Widget build(BuildContext context) {
    return CircularCountDownTimer(
      duration: 10,
      initialDuration: 0,
      controller: _controller,
      width: 100,
      height: 100,
      ringColor: Colors.grey[100]!,
      ringGradient: null,
      fillColor: Constans.test,
      fillGradient: null,
      backgroundColor: Colors.white,
      backgroundGradient: null,
      strokeWidth: 10.0,
      strokeCap: StrokeCap.round,
      textStyle: const TextStyle(
          fontSize: 48.0,
          color: Colors.black,
          fontWeight: FontWeight.bold,
          fontFamily: Constans.fontFamily),
      textFormat: CountdownTextFormat.S,
      isReverse: true,
      isReverseAnimation: true,
      isTimerTextShown: true,
      autoStart: false,
      onComplete: () {
        pageController.nextPage(
            duration: const Duration(milliseconds: 300),
            curve: Curves.linear);
      },
      timeFormatterFunction: (defaultFormatterFunction, duration) {
        if (duration.inSeconds == 10) {
          _controller.start();
          return "Start";
        } else if (duration.inSeconds < 0) {
          return 'Done';
        } else {
          return Function.apply(defaultFormatterFunction, [duration]);
        }
      },
    );
  }
}
