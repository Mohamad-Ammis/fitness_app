import 'package:fitnessapp/constans.dart';
import 'package:flutter/material.dart';

class EventCard extends StatelessWidget {
  const EventCard({super.key, required this.title, required this.subtitle});
  final String title;
  final String subtitle;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(25),
      decoration: BoxDecoration(),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
                fontFamily: Constans.fontFamily,
                fontWeight: FontWeight.bold,
                fontSize: 20),
          ),
          Row(
            children: [
              Icon(
                Icons.access_time_rounded,
                color: Constans.shopColor,
              ),
              SizedBox(
                width: 5,
              ),
              Text(
                subtitle,
                style: TextStyle(
                    color: Colors.black.withOpacity(.3),
                    fontFamily: Constans.fontFamily,
                    fontWeight: FontWeight.bold,
                    fontSize: 14),
              ),
            ],
          )
        ],
      ),
    );
  }
}
