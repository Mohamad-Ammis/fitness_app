
import 'package:fitnessapp/constans.dart';
import 'package:fitnessapp/models/muscle.dart';
import 'package:flutter/material.dart';

class ExerciseCardBody extends StatelessWidget {
  const ExerciseCardBody({
    super.key, required this.model,
  });
  final Muscle model;
  

  @override
  Widget build(BuildContext context) {
    return  Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "${model.muscleName} WORKOUT",
          style: const TextStyle(
              color: Colors.white,
              fontFamily: Constans.fontFamily,
              fontWeight: FontWeight.bold,
              fontSize: 22),
        ),
        Text(
          "${model.totalTime}Mins - ${model.exerciseNumber}Exercises",
          style: const TextStyle(
              color: Colors.white,
              fontFamily: Constans.fontFamily,
              fontWeight: FontWeight.w500,
              fontSize: 12),
        ),
        const SizedBox(
          height: 10,
        )
      ],
    );
  }
}