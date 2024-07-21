import 'package:fitnessapp/constans.dart';
import 'package:fitnessapp/controller/exercise_page_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TapbarSection extends StatelessWidget {
  TapbarSection({
    super.key,
  });
  final exerciseControlller = Get.put(ExerciseController());
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      width: MediaQuery.sizeOf(context).width,
      decoration: BoxDecoration(color: Colors.white, boxShadow: [
        BoxShadow(
            offset: const Offset(0, 0),
            blurRadius: 5,
            spreadRadius: 5,
            color: Colors.black.withOpacity(.1))
      ]),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            width: MediaQuery.sizeOf(context).width / 2.5,
            child: GestureDetector(
              onTap: () {
                exerciseControlller.animationActive = true;
                exerciseControlller.hideMiddleBar=false;
                exerciseControlller.update();
              },
              child: Center(
                child: Text(
                  '  Animation',
                  style: TextStyle(
                    fontFamily: Constans.fontFamily,
                    fontSize: 20,
                    color: exerciseControlller.animationActive
                        ? Colors.black
                        : Colors.black.withOpacity(0.5),
                  ),
                ),
              ),
            ),
          ),
          const VerticalDivider(
            thickness: 0.2,
            color: Color.fromARGB(255, 0, 0, 0),
            indent: 10,
            endIndent: 10,
          ),
          SizedBox(
            width: MediaQuery.sizeOf(context).width / 2.5,
            child: GestureDetector(
              onTap: () {
                exerciseControlller.animationActive = false;
                exerciseControlller.hideMiddleBar=true;
                exerciseControlller.update();
              },
              child: Center(
                child: Text('Video',
                    style: TextStyle(
                      fontFamily: Constans.fontFamily,
                      fontSize: 20,
                      color: !exerciseControlller.animationActive
                          ? Colors.black
                          : Colors.black.withOpacity(0.5),
                    )),
              ),
            ),
          )
        ],
      ),
    );
  }
}
