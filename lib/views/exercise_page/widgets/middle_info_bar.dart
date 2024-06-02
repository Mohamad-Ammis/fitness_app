
import 'package:fitnessapp/constans.dart';
import 'package:fitnessapp/models/exersice.dart';
import 'package:fitnessapp/views/exercise_page/widgets/custom_info_column.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class MiddleInfoBar extends StatelessWidget {
  const MiddleInfoBar({
    super.key, required this.model,
  });
  final ExerciseModel model;
  @override
  Widget build(BuildContext context) {
    return Positioned(
      // MediaQuery.sizeOf(context).height / 6 * 2 because expand is 2 from 6 in gif section
      //50 is the height removed from bottomsheet
      // the height of upper tapbar is 60 so we add half of them to be in middle
      top: MediaQuery.sizeOf(context).height / 6 * 2 -50 +45  ,
      left: 30,
      child: Container(
        
        // margin: const EdgeInsets.symmetric(horizontal: 20),
        width: MediaQuery.sizeOf(context).width - 60,
        height: 70,
        decoration: BoxDecoration(
          color:Constans.test.withAlpha(170),
          borderRadius: BorderRadius.circular(16),
        ),
        child:  Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CustomInfo(
              title: 'Burns',
              subTitle: '${model.calories}KCal',
              icon: FontAwesomeIcons.fire,
            ),
            VerticalDivider(
              indent: 10,
              endIndent: 10,
              color: Colors.white,
              thickness: 0.5,
            ),
            CustomInfo(
              title: 'Duration',
              subTitle: '00:${model.time}',
              icon: FontAwesomeIcons.clock,
            ),
          ],
        ),
      ),
    );
  }
}

