import 'package:fitnessapp/controller/musclecon.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class FocuseAreaBodyImage extends StatelessWidget {
  List<dynamic> muscle;
  FocuseAreaBodyImage({super.key, required this.muscle});

  final controller = Get.put(Musclecontroller(), permanent: true);
  @override
  Widget build(BuildContext context) {
    return Container(
      // height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: 400,
            width: 350,
            child: Stack(
              children: [
                const SizedBox(
                  height: 400,
                  width: 400,
                ),
                SizedBox(
                  height: 400,
                  width: 400,
                  child: Image.asset(
                    "assets/images/testt.jpg",
                    fit: BoxFit.fitHeight,
                  ),
                ),
                //abs  1
                Positioned(
                  top: 110,
                  left: 68,
                  child: hilight_area(15, 21, false, null, null, null, null, 1),
                ),
                Positioned(
                  top: 110,
                  left: 88,
                  child: hilight_area(15, 21, false, null, null, null, null, 1),
                ),
                Positioned(
                  top: 125,
                  left: 72,
                  child: hilight_area(15, 18, false, null, null, null, null, 1),
                ),
                Positioned(
                  top: 125,
                  left: 88,
                  child: hilight_area(15, 18, false, null, null, null, null, 1),
                ),
                Positioned(
                  top: 140,
                  left: 88,
                  child: hilight_area(15, 16, false, null, null, null, null, 1),
                ),
                Positioned(
                  top: 140,
                  left: 73,
                  child: hilight_area(15, 16, false, null, null, null, null, 1),
                ),
                Positioned(
                  top: 154,
                  left: 75,
                  child: hilight_area(28, 13, true, 30, 30, 150, 40, 1),
                ),
                Positioned(
                  top: 154,
                  left: 88,
                  child: hilight_area(28, 13, true, 30, 30, 40, 150, 1),
                ),

                //chest 2
                Positioned(
                  top: 77,
                  left: 56,
                  child: hilight_area(38, 30, true, 40, 40, 80, 20, 2),
                ),
                Positioned(
                  top: 77,
                  left: 90,
                  child: hilight_area(38, 30, true, 40, 40, 20, 80, 2),
                ),

                //shoulder front 3
                Positioned(
                  top: 74,
                  left: 39,
                  child: hilight_area(32, 24, true, 450, 40, 80, 1000, 3),
                ),
                Positioned(
                  top: 74,
                  left: 115,
                  child: hilight_area(32, 24, true, 40, 450, 1000, 80, 3),
                ),

                //shoulder back 3
                Positioned(
                  top: 74,
                  left: 213,
                  child: hilight_area(30, 27, true, 600, 1000, 80, 1000, 3),
                ),
                Positioned(
                  top: 74,
                  left: 284,
                  child: hilight_area(30, 27, true, 1000, 600, 1000, 80, 3),
                ),
                //top arm Biceps  4
                Positioned(
                  top: 105,
                  left: 39,
                  child: hilight_area(36, 18, true, 100, 100, 100, 150, 4),
                ),
                Positioned(
                  top: 105,
                  left: 122,
                  child: hilight_area(36, 18, true, 100, 100, 150, 150, 4),
                ),
                //back arm Triceps  5
                Positioned(
                  top: 105,
                  left: 211,
                  child: hilight_area(38, 17, true, 150, 100, 100, 150, 5),
                ),
                Positioned(
                  top: 105,
                  left: 294,
                  child: hilight_area(38, 17, true, 100, 150, 150, 150, 5),
                ),
                //Quadriceps  6 فخد امامي
                Positioned(
                  top: 180,
                  left: 55,
                  child: hilight_area(70, 28, true, 150, 150, 150, 200, 6),
                ),
                Positioned(
                  top: 180,
                  left: 93,
                  child: hilight_area(70, 28, true, 150, 150, 150, 200, 6),
                ),
                //Hamstring  7  فخد خلفي
                Positioned(
                  top: 200,
                  left: 227,
                  child: hilight_area(59, 28, true, 150, 150, 300, 300, 7),
                ),
                Positioned(
                  top: 200,
                  left: 266,
                  child: hilight_area(59, 28, true, 150, 150, 300, 300, 7),
                ),
                //gluteus muscles   8
                Positioned(
                  top: 165,
                  left: 228,
                  child: hilight_area(36, 34, false, null, null, null, null, 8),
                ),
                Positioned(
                  top: 165,
                  left: 261,
                  child: hilight_area(36, 32, false, null, null, null, null, 8),
                ),
                //Calves   9
                Positioned(
                  top: 275,
                  left: 228,
                  child: hilight_area(40, 13, true, 150, 20, 20, 20, 9),
                ),
                Positioned(
                  top: 275,
                  left: 240,
                  child: hilight_area(45, 13, true, 150, 100, 100, 100, 9),
                ),
                Positioned(
                  top: 275,
                  left: 280.5,
                  child: hilight_area(40, 13, true, 20, 150, 20, 20, 9),
                ),
                Positioned(
                  top: 275,
                  left: 270,
                  child: hilight_area(45, 12, true, 150, 100, 100, 100, 9),
                ),
                //back  10
                Positioned(
                  top: 90,
                  left: 222,
                  child: hilight_area(25, 30, true, 50, 50, 50, 50, 10),
                ),
                Positioned(
                  top: 90,
                  left: 269,
                  child: hilight_area(25, 30, true, 50, 50, 50, 50, 10),
                ),
                Positioned(
                  top: 110,
                  left: 230,
                  child: hilight_area(28, 30, true, 50, 50, 100, 100, 10),
                ),
                Positioned(
                  top: 110,
                  left: 262,
                  child: hilight_area(28, 30, true, 50, 50, 100, 100, 10),
                ),
                Positioned(
                  top: 137,
                  left: 236,
                  child: hilight_area(28, 20, true, 50, 50, 100, 100, 10),
                ),
                Positioned(
                  top: 137,
                  left: 266,
                  child: hilight_area(28, 20, true, 50, 50, 100, 100, 10),
                ),
                Positioned(
                  top: 137,
                  left: 256,
                  child: hilight_area(28, 10, true, 50, 50, 100, 100, 10),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // ignore: non_constant_identifier_names
  Widget hilight_area(double h, double w, bool special, double? tl, double? tr,
      double? bl, double? br, int area) {
    return GetBuilder<Musclecontroller>(
        builder: (control) => AnimatedContainer(
              height: h,
              width: w,
              decoration: BoxDecoration(
                  border: Border.all(
                      width: 0.6,
                      color: muscle.contains(area)
                          ? Colors.black
                          : Colors.white.withOpacity(0)),
                  color: (control.areaa == area)
                      ? control.basic
                      : muscle.contains(area)
                          ? const Color.fromARGB(255, 38, 164, 170)
                              .withOpacity(0.4)
                          : Colors.white.withOpacity(0),
                  borderRadius: special == false
                      ? BorderRadius.circular(40)
                      : BorderRadius.only(
                          topLeft: Radius.circular(tl!),
                          topRight: Radius.circular(tr!),
                          bottomLeft: Radius.circular(bl!),
                          bottomRight: Radius.circular(br!))),
              duration: const Duration(milliseconds: 900),
            ));
  }
}
