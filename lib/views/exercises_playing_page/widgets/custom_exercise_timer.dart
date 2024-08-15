import 'package:custom_timer/custom_timer.dart';
import 'package:fitnessapp/models/exersice.dart';
import 'package:fitnessapp/views/exercises_playing_page/widgets/exercise_timer_info_section.dart';
import 'package:flutter/material.dart';

class CustomExerciseTimer extends StatefulWidget {
  const CustomExerciseTimer({
    super.key,
    required this.outerPageController,
    required this.index,
    required this.lastIndex,
    required this.model, required this.isCoachExercise,
  });
  final PageController outerPageController;
  final int index;
  final int lastIndex;
  final ExerciseModel model;
  final bool isCoachExercise;
  @override
  State<CustomExerciseTimer> createState() => _CustomExerciseTimerState();
}

class _CustomExerciseTimerState extends State<CustomExerciseTimer>
    with SingleTickerProviderStateMixin {
  late final CustomTimerController _controller;
  late int totalTime;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    int secondes = int.parse(widget.model.time) % 60;
    int minutes = (int.parse(widget.model.time) / 60).toInt();
    _controller = CustomTimerController(
      vsync: this,
      begin: Duration(minutes: minutes, seconds: secondes),
      end: const Duration(),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 24.0),
            child: InfoSection(
              isCoachExercise: widget.isCoachExercise,
              controller: _controller,
              outerPageController: widget.outerPageController,
              index: widget.index,
              lastIndex: widget.lastIndex,
              model: widget.model,
            ),
          ),
        ],
      ),
    );
  }
}
