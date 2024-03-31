
import 'package:fitnessapp/constans.dart';
import 'package:flutter/material.dart';

class RegisterPageHeader extends StatelessWidget {
  const RegisterPageHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        Text(
          "I",
          style: TextStyle(
              color: Constans.secondryColor,
              fontSize: 50,
              fontFamily: Constans.fontFamily,
              fontWeight: FontWeight.bold),
        ),
        SizedBox(
          width: 5,
        ),
        Text(
          "Welcome!",
          style: TextStyle(
              color: Constans.primaryColor,
              fontSize: 40,
              fontFamily: Constans.fontFamily,
              fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}
