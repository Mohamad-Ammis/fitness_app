import 'package:custom_timer/custom_timer.dart';
import 'package:fitnessapp/models/exersice.dart';
import 'package:fitnessapp/views/exercises_playing_page/widgets/exercise_timer_info_section.dart';
import 'package:flutter/material.dart';

class CustomExerciseTimer extends StatefulWidget {
  const CustomExerciseTimer({
    super.key,
    required this.outerPageController,
    required this.index,
    required this.lastIndex, required this.model,
  });
  final PageController outerPageController;
  final int index;
  final int lastIndex;
  final ExerciseModel model;
  @override
  State<CustomExerciseTimer> createState() => _CustomExerciseTimerState();
}

class _CustomExerciseTimerState extends State<CustomExerciseTimer>
    with SingleTickerProviderStateMixin {
  late final CustomTimerController _controller = CustomTimerController(
    vsync: this,
    begin:  Duration(seconds: int.parse(widget.model.time)),
    end: const Duration(),
  );
  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8),
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 24.0),
            child: InfoSection(
              controller: _controller,
              outerPageController: widget.outerPageController,
              index: widget.index,
              lastIndex: widget.lastIndex, model: widget.model,
            ),
          ),
        ],
      ),
    );
  }
}
