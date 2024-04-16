
import 'package:fitnessapp/constans.dart';
import 'package:flutter/material.dart';

class AppbarInfo extends StatelessWidget {
  const AppbarInfo({
    super.key, required this.count, required this.title,
  });
  final String count ;
  final String title ;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          count,
          style:const TextStyle(
              fontFamily: Constans.fontFamily,
              fontSize: 24,
              fontWeight: FontWeight.w600),
        ),
        Text(
          title,
          style: const TextStyle(
            fontFamily: Constans.fontFamily,
            fontWeight: FontWeight.w500,
            fontSize: 12
          ),
        ),
      ],
    );
  }
}
