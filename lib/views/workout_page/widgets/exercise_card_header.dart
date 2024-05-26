
import 'package:fitnessapp/constans.dart';
import 'package:fitnessapp/models/muscle.dart';
import 'package:flutter/material.dart';

class ExerciseCardHeader extends StatelessWidget {
  const ExerciseCardHeader({
    super.key, required this.model,
  });
final Muscle model;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          padding: const EdgeInsets.all(5),
          decoration: BoxDecoration(
              color: const Color(0xFF9EA5AB).withOpacity(0.3),
              borderRadius: BorderRadius.circular(6)),
          child:  Text(
            model.level.toString().toUpperCase(),
            style: TextStyle(
                color: Colors.white,
                fontFamily: Constans.fontFamily,
                fontSize: 12),
          ),
        ),
        IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.arrow_forward_ios_outlined,
              color: Colors.white,
            ))
      ],
    );
  }
}
