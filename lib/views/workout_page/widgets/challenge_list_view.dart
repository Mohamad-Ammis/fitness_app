
import 'package:fitnessapp/views/workout_page/widgets/challenge_card.dart';
import 'package:flutter/material.dart';

class ChallengesListView extends StatelessWidget {
  const ChallengesListView({
    super.key,
    required this.images,
  });

  final List images;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 240,
      child: ListView.builder(
          itemCount: images.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return WorkoutChallengeCard(
              image: images[index],
            );
          }),
    );
  }
}
