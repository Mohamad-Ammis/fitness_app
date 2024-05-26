import 'package:fitnessapp/views/exercises_playing_page/widgets/playing_exercise_page.dart';
import 'package:flutter/material.dart';

class PlayingExercises extends StatefulWidget {
  const PlayingExercises({super.key});

  @override
  State<PlayingExercises> createState() => _PlayingExercisesState();
}

class _PlayingExercisesState extends State<PlayingExercises> {
  final PageController innerPageController = PageController();
  final PageController outerPageController = PageController();
  final List<String> gifs = const [
    'assets/gif/74d0bbe4-f240-4fbb-aa45-38842f24a2a1.gif',
    'assets/gif/884ff381-5967-4c54-b998-eedb33e2062a.gif',
    'assets/gif/asd.gif',
    'assets/gif/bench.gif',
    'assets/gif/aqwe.gif',
    'assets/gif/Oggi.gif',
    'assets/gif/Plank.gif',
    'assets/gif/Workout.gif'
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: PageView.builder(
            itemCount: gifs.length,
            controller: outerPageController,
            itemBuilder: (context, index) {
              return PlayingExercisePage(
                innerPageController: innerPageController,
                outerPageController: outerPageController,
                index: index,
                lastIndex: gifs.length, gif: gifs[index],
              );
            }));
  }
}
