import 'package:fitnessapp/constans.dart';
import 'package:fitnessapp/models/challenge_model.dart';
import 'package:fitnessapp/views/challenges_page/widgets/counter_challenge_body.dart';
import 'package:fitnessapp/views/challenges_page/widgets/gif_section.dart';
import 'package:fitnessapp/views/challenges_page/widgets/header_info.dart';
import 'package:fitnessapp/views/challenges_page/widgets/timer_challenge_body.dart';
import 'package:flutter/material.dart';

class ChallengePage extends StatelessWidget {
  const ChallengePage({super.key, required this.model});
  final ChallengeModel model;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        Column(
          children: [
            SizedBox(
              height: MediaQuery.sizeOf(context).height / 3 + 20,
            ),
            Container(
              decoration: BoxDecoration(
                color: Colors.black,
                image: DecorationImage(
                    image: NetworkImage(
                        "http://${Constans.host}:8000/Uploads/${model.secondryImage}"),
                    fit: BoxFit.cover,
                    opacity: 0.2),
              ),
              padding: EdgeInsets.fromLTRB(12, 40, 12, 8),
              height: MediaQuery.sizeOf(context).height / 3 * 2 - 20,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  HeaderInfo(
                    model: model,
                  ),
                  model.type != "timer"
                      ? CounterChallengeBody()
                      : TimerChallengeBody(),
                  Text(""),
                ],
              ),
            ),
          ],
        ),
        ChallengeGifSection(model: model),
      ],
    ));
  }
}
