

import 'package:fitnessapp/constans.dart';
import 'package:fitnessapp/models/challenge_model.dart';
import 'package:flutter/material.dart';

class HeaderInfo extends StatelessWidget {
  const HeaderInfo({
    super.key, required this.model,
  });
final ChallengeModel model;
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          model.name.toString().toUpperCase(),
          style: const TextStyle(
              fontFamily: Constans.fontFamily,
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: Colors.white),
        ),
        Text(
          model.type.toString().toUpperCase()+" challenge".toUpperCase(),
          style: const TextStyle(
              fontFamily: Constans.fontFamily,
              fontSize: 10,
              fontWeight: FontWeight.normal,
              color: Colors.white),
        ),
      ],
    );
  }
}
