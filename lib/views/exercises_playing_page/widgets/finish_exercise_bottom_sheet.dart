import 'dart:math';

import 'package:confetti/confetti.dart';
import 'package:fitnessapp/constans.dart';
import 'package:fitnessapp/utils/app_images.dart';
import 'package:fitnessapp/views/auth_pages/widgets/auth_custom_button.dart';
import 'package:fitnessapp/views/exercise_page/widgets/custom_info_column.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FinishExerciseBottomSheet extends StatefulWidget {
  const FinishExerciseBottomSheet({
    super.key,
    required this.exerciseNumber,
    required this.totalTime,
    required this.totalCalories,
  });
  final String exerciseNumber;
  final String totalTime;
  final String totalCalories;

  @override
  State<FinishExerciseBottomSheet> createState() =>
      _FinishExerciseBottomSheetState();
}

class _FinishExerciseBottomSheetState extends State<FinishExerciseBottomSheet> {
  final _controller = ConfettiController();
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _controller.dispose();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller.play();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color.fromARGB(255, 219, 219, 219),
      child: Stack(
        alignment: Alignment.topCenter,
        children: [
          BottomSheet(
              enableDrag: false,
              onClosing: () {},
              backgroundColor: Colors.grey.withOpacity(.18),
              builder: (context) {
                return Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Stack(
                      children: [
                        IntrinsicHeight(
                          child: Column(
                            children: [
                              Container(
                                clipBehavior: Clip.hardEdge,
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.only(
                                        bottomRight: Radius.circular(999))),
                                // margin: EdgeInsets.all(20),
                                child: Image.asset(Assets.imagesManArm1),
                              ),
                              SizedBox(
                                height: 40,
                              ),
                            ],
                          ),
                        ),
                        Positioned.fill(
                            child: Align(
                          alignment: Alignment.bottomCenter,
                          child: Container(
                            margin: EdgeInsets.symmetric(horizontal: 20),
                            decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                    blurRadius: 1,
                                    color: Colors.black.withOpacity(.1))
                              ],
                              borderRadius: BorderRadius.circular(16),
                              color: const Color(0xFFF3F4F6),
                            ),
                            height: 80,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                CustomInfo(
                                    title: 'Exercise',
                                    textColor: Colors.black,
                                    avatarColor: Colors.black,
                                    iconColor: Colors.white,
                                    subTitle: widget.exerciseNumber,
                                    icon: Icons.numbers),
                                CustomInfo(
                                    title: 'Calories',
                                    textColor: Colors.black,
                                    avatarColor: Colors.black,
                                    iconColor: Colors.white,
                                    subTitle: widget.totalCalories,
                                    icon: Icons.local_fire_department_outlined),
                                CustomInfo(
                                    title: 'time',
                                    textColor: Colors.black,
                                    avatarColor: Colors.black,
                                    iconColor: Colors.white,
                                    subTitle: widget.totalTime,
                                    icon: Icons.timelapse_sharp),
                              ],
                            ),
                          ),
                        ))
                      ],
                    ),
                    Container(
                      margin: EdgeInsets.all(20),
                      height: 70,
                      child: AuthCustomButton(
                          backgroundColor: Constans.test,
                          borderRadius: 16,
                          width: MediaQuery.sizeOf(context).width,
                          buttonText: Text(
                            "C L O S E",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontFamily: Constans.fontFamily,
                                fontSize: 20),
                          ),
                          onTap: () {
                            Get.back();
                          }),
                    ),
                  ],
                );
              }),
          ConfettiWidget(
            confettiController: _controller,
            blastDirection: -pi / 2,
            emissionFrequency: 0.1,
          )
        ],
      ),
    );
  }
}
