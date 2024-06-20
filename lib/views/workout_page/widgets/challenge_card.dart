
import 'package:fitnessapp/views/challenges_page/challenges_page.dart';
import 'package:fitnessapp/views/workout_page/widgets/challenge_card_body.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class WorkoutChallengeCard extends StatelessWidget {
  const WorkoutChallengeCard({
    super.key, required this.image,
  });
  final String image;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: SizedBox(
          
          width: 320,
          child: WorkoutChallengeCardBody(image: image),
        ),
      ),
    );
  }
}
