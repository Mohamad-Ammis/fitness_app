
import 'package:fitnessapp/constans.dart';
import 'package:fitnessapp/views/workout_page/widgets/challenge_card_button.dart';
import 'package:flutter/material.dart';

class WorkoutChallengeCardInfo extends StatelessWidget {
  const WorkoutChallengeCardInfo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 5,),
            Row(
              children: [
                const Text(
                  'Full',
                  style: TextStyle(
                      fontFamily: Constans.fontFamily,
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
                Text(
                  ' Body',
                  style: TextStyle(
                      fontFamily: Constans.fontFamily,
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      //color: Color.fromARGB(255, 89, 166, 248)
                      color: Constans.test
                      ),
                ),
              ],
            ),
            const Text(
              'WorkOut',
              style: TextStyle(
                  fontFamily: Constans.fontFamily,
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
          ],
        ),
        const Expanded(child: SizedBox()),
        Text(
          'Here u can read some desc and it isn\'t very helpful so if u read it u r waste ur time   ',
          style: TextStyle(
              fontFamily: Constans.fontFamily,
              fontSize: 12,
              fontWeight: FontWeight.w500,
              color: Constans.subTitleColor),
        ),
        const SizedBox(
          height: 10,
        ),
        const WorkoutChallengeCardInfoButton()
      ],
    );
  }
}
