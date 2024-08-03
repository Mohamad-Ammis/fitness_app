import 'package:fitnessapp/constans.dart';
import 'package:fitnessapp/controller/workout_page_controller.dart';
import 'package:fitnessapp/models/challenge_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:panara_dialogs/panara_dialogs.dart';

class CounterChallengeBody extends StatefulWidget {
  const CounterChallengeBody({super.key, required this.model});
  final ChallengeModel model;
  @override
  State<CounterChallengeBody> createState() => _CounterChallengeBodyState();
}

class _CounterChallengeBodyState extends State<CounterChallengeBody> {
  int counter = 0;
  final controller = Get.put(WorkoutPageController());
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: () {
            counter++;
            setState(() {});
          },
          child: Container(
            padding: const EdgeInsets.all(8),
            width: 200,
            height: 200,
            decoration: BoxDecoration(
                border: Border.all(color: Colors.white.withOpacity(0.5)),
                color: Colors.white.withOpacity(0.2),
                borderRadius: BorderRadius.circular(999)),
            child: Center(
                child: Text(
              counter.toString(),
              style: const TextStyle(
                  color: Colors.white,
                  fontFamily: Constans.fontFamily,
                  fontWeight: FontWeight.bold,
                  fontSize: 40),
            )),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Text("Tap in circle to increase your count",
            style: TextStyle(
                color: Colors.white.withOpacity(0.6),
                fontSize: 14,
                fontFamily: Constans.fontFamily,
                fontWeight: FontWeight.normal)),
        const SizedBox(
          height: 20,
        ),
        GestureDetector(
          onTap: () {
            PanaraConfirmDialog.show(
              context,
              title: "Are you sure",
              message:
                  "do you want to exit this challenge ?\n Save your result or exit directly",
              confirmButtonText: "E X I T",
              cancelButtonText: "S A V E",
              onTapCancel: () async {
                Get.back();
                Get.back();
                await controller.updateChallenge(
                    widget.model.id.toString(),
                    widget.model.type.toString(),
                    null,
                    counter.toString(),
                    widget.model.name);
              },
              onTapConfirm: () {
                Navigator.pop(context);
              },
              panaraDialogType: PanaraDialogType.warning,
            );
          },
          child: Container(
            width: 280,
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(999)),
            child: const Center(
              child: Text(
                "E X I T ",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 24,
                    fontFamily: Constans.fontFamily,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
