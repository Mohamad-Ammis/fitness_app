
import 'dart:ui';

import 'package:fitnessapp/constans.dart';
import 'package:flutter/material.dart';

class CustomTimerButton extends StatelessWidget {
  const CustomTimerButton({
    super.key, required this.title, required this.icon,
  });
  final String title;
  final IconData icon;
  @override
  Widget build(BuildContext context) {
    return  Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(title,
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontFamily: Constans.fontFamily,
                  fontWeight: FontWeight.bold)),
          SizedBox(
            width: 10,
          ),
          Icon(
            icon,
            color: Colors.white,
          )
        ],
      );
  }
}
