import 'package:fitnessapp/constans.dart';
import 'package:flutter/material.dart';

class WorkoutChallengeCardInfoButton extends StatelessWidget {
  const WorkoutChallengeCardInfoButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 10),
        padding: const EdgeInsets.all(8),
        width: double.infinity,
        decoration: BoxDecoration(
          color: Constans.test,
          // gradient: LinearGradient(
          //   begin: Alignment.centerLeft,
          //   end: Alignment.centerRight,
          //   colors: [
          //     Constans.test2,
          //     Constans.test,
          //   ],
          // ),
          borderRadius: BorderRadius.circular(8),
        ),
        child: const Center(
          child: Text(
            'Start',
            style: TextStyle(
                fontFamily: Constans.fontFamily,
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.white),
          ),
        ),
      ),
    );
  }
}