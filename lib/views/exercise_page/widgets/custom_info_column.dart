import 'package:fitnessapp/constans.dart';
import 'package:flutter/material.dart';

class CustomInfo extends StatelessWidget {
  const CustomInfo({
    super.key,
    required this.title,
    required this.subTitle,
    required this.icon, this.textColor, this.avatarColor, this.iconColor,
  });
  final String title;
  final String subTitle;
  final IconData icon;
  final Color? textColor;
  final Color? avatarColor;
  final Color? iconColor;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CircleAvatar(
            backgroundColor:avatarColor?? Colors.white,
            radius: 16,
            child: Icon(
              icon,
              size: 18,
              color:iconColor?? Colors.black,
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
              style:  TextStyle(
                  fontFamily: Constans.fontFamily,
                  color:textColor?? Colors.white,
                  fontWeight: FontWeight.bold),
            ),
            Text(subTitle,
                style:  TextStyle(
                    fontFamily: Constans.fontFamily,
                    color:textColor?? Colors.white,
                    fontSize: 13.5))
          ],
        ),
      ],
    );
  }
}
