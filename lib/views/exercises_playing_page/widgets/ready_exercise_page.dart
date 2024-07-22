import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:fitnessapp/constans.dart';
import 'package:fitnessapp/models/exersice.dart';
import 'package:fitnessapp/views/exercises_playing_page/widgets/custom_circular_timer.dart';
import 'package:flutter/material.dart';

class ReadyExercisePage extends StatelessWidget {
  ReadyExercisePage({
    super.key,
    required this.pageController, required this.model,
  });
  final PageController pageController;
  final CountDownController _controller = CountDownController();
final ExerciseModel model;
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      margin: const EdgeInsets.all(1),
      padding: const EdgeInsets.all(8),
      clipBehavior: Clip.hardEdge,
      decoration: const BoxDecoration(color: Colors.white
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            'READY TO GO!',
            style: TextStyle(
                color: Constans.test,
                fontFamily: Constans.fontFamily,
                fontSize: 36,
                fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 10,
          ),
           Text(
            model.name,
            style: const TextStyle(
                fontFamily: Constans.fontFamily,
                fontSize: 24,
                fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const Text(''),
              const Text(''),
              CustomCirculatTimer(controller: _controller, pageController: pageController),
              IconButton(
                  onPressed: () {
                    pageController.nextPage(
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.linear);
                  },
                  icon: const Icon(
                    Icons.arrow_right_outlined,
                    size: 50,
                  ))
            ],
          ),
        ],
      ),
    );
  }
}
