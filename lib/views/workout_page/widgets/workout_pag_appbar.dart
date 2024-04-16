import 'package:fitnessapp/constans.dart';
import 'package:fitnessapp/views/workout_page/widgets/appbar_info.dart';
import 'package:flutter/material.dart';

class WorkoutPageAppbar extends StatelessWidget implements PreferredSizeWidget {
  const WorkoutPageAppbar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child:  Padding(
        padding: EdgeInsets.only(left: 16,bottom: 10,right: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Home Workout",
              style: TextStyle(
                  fontFamily: Constans.fontFamily,
                  fontSize: 22,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AppbarInfo(
                  count: '0',
                  title: 'WORKOUT',
                ),
                AppbarInfo(
                  count: '0',
                  title: 'KCAL',
                ),
                AppbarInfo(
                  count: '0',
                  title: 'MINUTES',
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size(double.infinity, 100);
}
