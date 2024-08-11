import 'package:fitnessapp/constans.dart';
import 'package:fitnessapp/controller/datacont.dart';
import 'package:fitnessapp/views/data_page/datawidget/question.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Days extends StatelessWidget {
  Days({super.key});
  final controller = Get.put(Datacontroller(), permanent: true);
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
        builder: (ctx, cont) => SizedBox(
              height: cont.maxHeight,
              width: cont.maxWidth,
              child: Column(children: [
                Container(
                    width: cont.maxWidth,
                    height: cont.maxHeight*0.2,
                    alignment: Alignment.center,
                    margin: const EdgeInsets.only(top: 10),
                    child: Question(
                      que: "Set your weekly goal ",
                      subt: "Achieving goals comes through discipline",
                    )),
                select_days(cont),
                select_clock(cont, context)
              ]), 
            ));
  }

  // ignore: non_constant_identifier_names
  Widget select_clock(BoxConstraints cont, BuildContext context) {
    return GetBuilder<Datacontroller>(
      builder:(contr)=> Container(
                  height: cont.maxHeight * 0.35,
                  width: cont.maxWidth,
                  margin: const EdgeInsets.only(left: 20, top: 15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Select reminder :",
                        style: TextStyle(
                          color: controller.twocolor,
                          fontFamily: Constans.fontFamily,
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                          wordSpacing: 2,
                        ),
                      ),
                      InkWell(
                        overlayColor: MaterialStatePropertyAll(
                          Colors.white.withOpacity(0)),
                      onTap: () {
                        showTimePicker(context: context, initialTime: TimeOfDay.now()).then((value) {
                          contr.setclock(value!);
                        });
                      },
                        child: Container(
                          margin: const EdgeInsets.only(top: 20),
                          width: cont.maxWidth,
                          height: cont.maxHeight*0.23,
                          alignment: Alignment.center,
                          child: Container(
                            alignment: Alignment.center,
                            height: 100,
                            width: 230,
                            decoration: BoxDecoration(
                              border: Border.all(
                                width: 1 ,
                                color: controller.twocolor
                              ),
                              borderRadius: BorderRadius.circular(15)
                            ),
                            
                            child: Text(contr.time.format(context).toString(),style: TextStyle(
                              color: controller.twocolor,
                              fontSize: 40
                            ),),
                          ),
                        ),
                      ),
                       ],
                  ),
                ),
    );
  }

  // ignore: non_constant_identifier_names
  Container select_days(BoxConstraints cont) {
    return Container(
      margin: const EdgeInsets.only(top: 5),
      height: cont.maxHeight * 0.35,
      width: cont.maxWidth,
      child: Column(
        children: [
          SizedBox(
            height: cont.maxHeight * 0.2,
            width: cont.maxWidth,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                days_cont(cont, "Sun", 1),
                const SizedBox(
                  width: 10,
                ),
                days_cont(cont, "Mon", 2),
                const SizedBox(
                  width: 10,
                ),
                days_cont(cont, "Tue", 3),
                const SizedBox(
                  width: 10,
                ),
                days_cont(cont, "Wen", 4),
              ],
            ),
          ),
          Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            days_cont(cont, "Thu", 5),
            const SizedBox(
              width: 10,
            ),
            days_cont(cont, "Fri", 6),
            const SizedBox(
              width: 10,
            ),
            days_cont(cont, "Sat", 7),
          ])
        ],
      ),
    );
  }

  // ignore: non_constant_identifier_names
  Widget days_cont(BoxConstraints cont, String name, int num) {
    return GetBuilder<Datacontroller>(
      builder: (contr) => InkWell(
        onTap: () {
          contr.setdays(num);
        },
        overlayColor: MaterialStatePropertyAll(Colors.white.withOpacity(0)),
        child: Card(
          color: Colors.white,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(20)),
          ),
          elevation: 10,
          child: Container(
            height: cont.maxHeight * 0.13,
            width: cont.maxWidth * 0.18,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: Colors.white,
                gradient: contr.check(num)
                    ? LinearGradient(colors: [
                        contr.deepcolor.withOpacity(0.25),
                        const Color.fromARGB(255, 165, 213, 222).withOpacity(0.3),
                        const Color(0xff281537).withOpacity(0.25)
                      ], begin: Alignment.topLeft, end: Alignment.bottomRight)
                    : null,
                border: Border.all(width: 0.8, color: controller.twocolor.withOpacity(0.5)),
                borderRadius: BorderRadius.circular(20)),
            child: Text(
              name,
              style: TextStyle(
                  fontFamily: Constans.fontFamily,
                  fontSize: 25,
                  color: controller.twocolor,
                 // fontWeight: FontWeight.w600
                  ),
            ),
          ),
        ),
      ),
    );
  }
}
