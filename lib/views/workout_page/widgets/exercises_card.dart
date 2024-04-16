import 'package:fitnessapp/views/workout_page/widgets/exercise_card_header.dart';
import 'package:fitnessapp/views/workout_page/widgets/exercises_card_body.dart';
import 'package:flutter/material.dart';

class ExcercisesCard extends StatelessWidget {
  const ExcercisesCard({
    super.key, required this.image,
  });
  final String image;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 150,
      constraints: const BoxConstraints(minHeight: 140, maxHeight: 180),
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
              offset: const Offset(0, 2),
              spreadRadius: 2,
              blurRadius: 5,
              color: Colors.grey.withOpacity(0.2))
        ],
        image:  DecorationImage(
          opacity: 0.8,
          //colorFilter: ColorFilter.srgbToLinearGamma(),
          colorFilter: const ColorFilter.mode(
              Color.fromARGB(255, 10, 0, 0), BlendMode.lighten),
          image: AssetImage(
            image,
          ),
          fit: BoxFit.cover,
        ),
      ),
      child: const Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(left: 20, top: 10),
            child: ExerciseCardHeader(),
          ),
          Padding(
            padding: EdgeInsets.only(left: 20, bottom: 10),
            child: ExerciseCardBody(),
          )
        ],
      ),
    );
  }
}

