
import 'package:fitnessapp/constans.dart';
import 'package:flutter/material.dart';

class ExerciseCardBody extends StatelessWidget {
  const ExerciseCardBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Chest Workout",
          style: TextStyle(
              color: Colors.white,
              fontFamily: Constans.fontFamily,
              fontWeight: FontWeight.bold,
              fontSize: 24),
        ),
        Text(
          "20Mins - 16Exercises",
          style: TextStyle(
              color: Colors.white,
              fontFamily: Constans.fontFamily,
              fontWeight: FontWeight.w500,
              fontSize: 14),
        ),
        SizedBox(
          height: 10,
        )
      ],
    );
  }
}