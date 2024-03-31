import 'package:fitnessapp/constans.dart';
import 'package:flutter/material.dart';

class AuthFooter extends StatelessWidget {
  const AuthFooter({
    super.key, required this.titleText, required this.specialWord, required this.onPressed,
  });
  final String titleText;
  final String specialWord;
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          titleText,
          style: TextStyle(color: Constans.subTitleColor),
        ),
        TextButton(
            onPressed:onPressed,
            child:  Text(specialWord,
                style: const TextStyle(color: Constans.secondryColor)))
      ],
    );
  }
}
