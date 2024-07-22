import 'package:fitnessapp/constans.dart';
import 'package:flutter/material.dart';

class CustomTimerButton extends StatelessWidget {
  const CustomTimerButton(
      {super.key,
      required this.title,
      required this.icon,
      this.buttonTextColor});
  final String title;
  final IconData icon;
  final Color? buttonTextColor;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(title,
            style: TextStyle(
                color: buttonTextColor ?? Colors.white,
                fontSize: 24,
                fontFamily: Constans.fontFamily,
                fontWeight: FontWeight.bold)),
        const SizedBox(
          width: 10,
        ),
        Icon(
          icon,
          color: buttonTextColor ?? Colors.white,
        )
      ],
    );
  }
}
