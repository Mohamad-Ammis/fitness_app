
import 'package:fitnessapp/views/workout_page/widgets/challenge_card_info.dart';
import 'package:flutter/material.dart';

class WorkoutChallengeCardBody extends StatelessWidget {
  const WorkoutChallengeCardBody({
    super.key, required this.image,
  });
  final String image;
  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
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
      child: const Padding(
        padding: EdgeInsets.all(8.0),
        child: WorkoutChallengeCardInfo(),
      ),
    );
  }
}
