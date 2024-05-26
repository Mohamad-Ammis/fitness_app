
import 'package:fitnessapp/constans.dart';
import 'package:flutter/material.dart';

class CustomInfo extends StatelessWidget {
  const CustomInfo({
    super.key,
    required this.title,
    required this.subTitle,
    required this.icon,
  });
  final String title;
  final String subTitle;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CircleAvatar(
            backgroundColor: Colors.white,
            radius: 16,
            child: Icon(
              icon,
              size: 18,
              color: Colors.black,
            )),
        const SizedBox(
          width: 5,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              title,
              style: const TextStyle(
                  fontFamily: Constans.fontFamily, color: Colors.white,fontWeight: FontWeight.bold),
            ),
            Text(subTitle,
                style: TextStyle(
                    fontFamily: Constans.fontFamily,
                    color: Colors.white,
                    fontSize: 13.5))
          ],
        ),
      ],
    );
  }
}
