import 'package:fitnessapp/views/data_page/datawidget/question.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../controller/datacont.dart';

class Focusarea extends StatelessWidget {
  Focusarea({super.key});
  final controller = Get.put(DataController(), permanent: true);
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
        builder: (ctx, cont) => Container(
              padding: const EdgeInsets.only(top: 6),
              height: cont.maxHeight,
              width: cont.maxWidth,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                      width: cont.maxWidth,
                      alignment: Alignment.center,
                      child: Question(
                        que: "Please choose your focus area ",
                        subt: "",
                      )),
                  Expanded(
                    child: LayoutBuilder(
                      builder: (ctx, coo) => GetBuilder<DataController>(
                        builder: (contr) =>
                            Stack(alignment: Alignment.center, children: [
                          SizedBox(
                            width: coo.maxWidth,
                            height: coo.maxHeight,
                          ),
                          SizedBox(
                            height: coo.maxHeight * 0.9,
                            width: coo.maxWidth * 0.4,
                            child: contr.man == 2
                                ? Image.asset(
                                    'assets/images/woman.png',
                                    fit: BoxFit.fitHeight,
                                  )
                                : Image.asset(
                                    "assets/images/mm.png",
                                    fit: BoxFit.fitHeight,
                                  ),
                          ),
                          Positioned(
                            top: coo.maxHeight * 0.23,
                            left: coo.maxWidth * 0.39,
                            child: hilight_area(
                                cont, contr, 2, 50, cont.maxWidth * 0.23),
                          ),
                          Positioned(
                            top: coo.maxHeight * 0.025,
                            left: coo.maxWidth * 0.08,
                            child: Cont_focus_area(1, contr, "Full Body", 135),
                          ),
                          Positioned(
                            top: coo.maxHeight * 0.23,
                            left: coo.maxWidth * 0.08,
                            child: Cont_focus_area(2, contr, "Chest", 110),
                          ),
                          Positioned(
                            top: coo.maxHeight * 0.35,
                            left: contr.man == 2
                                ? coo.maxWidth * 0.4
                                : coo.maxWidth * 0.4,
                            child: hilight_area(
                                cont, contr, 3, 60, cont.maxWidth * 0.2),
                          ),
                          Positioned(
                            top: coo.maxHeight * 0.37,
                            left: contr.man == 2
                                ? coo.maxWidth * 0.15
                                : coo.maxWidth * 0.075,
                            child: Cont_focus_area(3, contr, "Abs", 100),
                          ),
                          Positioned(
                            top: contr.man == 2
                                ? coo.maxHeight * 0.16
                                : coo.maxHeight * 0.2,
                            right: contr.man == 2
                                ? coo.maxWidth * 0.32
                                : coo.maxWidth * 0.31,
                            child: hilight_area(
                                cont,
                                contr,
                                4,
                                150,
                                contr.man == 2
                                    ? cont.maxWidth * 0.15
                                    : cont.maxWidth * 0.1),
                          ),
                          Positioned(
                            top: contr.man == 2
                                ? coo.maxHeight * 0.2
                                : coo.maxHeight * 0.27,
                            right: contr.man == 2
                                ? coo.maxWidth * 0.1
                                : coo.maxWidth * 0.07,
                            child: Cont_focus_area(4, contr, "Arm", 100),
                          ),
                          Positioned(
                            top: contr.man == 2
                                ? coo.maxHeight * 0.45
                                : coo.maxHeight * 0.5,
                            right: contr.man == 2
                                ? coo.maxWidth * 0.4
                                : coo.maxWidth * 0.36,
                            child: hilight_area(
                                cont, contr, 5, 165, cont.maxWidth * 0.13),
                          ),
                          Positioned(
                            top: contr.man == 2
                                ? coo.maxHeight * 0.6
                                : coo.maxHeight * 0.65,
                            right: contr.man == 2
                                ? coo.maxWidth * 0.15
                                : coo.maxWidth * 0.11,
                            child: Cont_focus_area(5, contr, "Leg", 100),
                          ),
                        ]),
                      ),
                    ),
                  ),
                ],
              ),
            ));
  }

  // ignore: non_constant_identifier_names
  Container hilight_area(
      BoxConstraints cont, DataController contr, int s, double h, double w) {
    return Container(
      height: h,
      width: w,
      decoration: (contr.selectfocusarea == 1 || contr.selectfocusarea == s)
          ? BoxDecoration(
              border: Border.all(width: 0.5, color: contr.deepcolor),
              color: contr.basiccolor.withOpacity(0.2),
              borderRadius: BorderRadius.circular(40))
          : null,
    );
  }

  // ignore: non_constant_identifier_names
  Container Cont_focus_area(int v, DataController contr, String s, double w) {
    return Container(
      height: 40,
      width: w,
      decoration: BoxDecoration(
        border:
            Border.all(width: 0.5, color: controller.twocolor.withOpacity(0.5)),
        borderRadius: BorderRadius.circular(40),
        gradient: (v == contr.selectfocusarea || contr.selectfocusarea == 1)
            ? LinearGradient(colors: [
                contr.deepcolor.withOpacity(0.25),
                const Color.fromARGB(255, 165, 213, 222).withOpacity(0.3),
                const Color(0xff281537).withOpacity(0.25)
              ], begin: Alignment.topLeft, end: Alignment.bottomRight)
            : null,
      ),
      child: Row(
        children: [
          Radio(
            value: v,
            groupValue: contr.selectfocusarea,
            onChanged: (val) {
              contr.setfocusarea(val!);
            },
            activeColor: contr.deepcolor,
          ),
          Text(s,
              style: TextStyle(
                  color: contr.twocolor,
                  fontFamily: "WorkSans",
                  fontSize: 15,
                  fontWeight: FontWeight.bold))
        ],
      ),
    );
  }
}
