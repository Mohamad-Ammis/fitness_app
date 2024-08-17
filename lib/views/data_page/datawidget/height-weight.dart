// ignore_for_file: file_names

import 'package:fitnessapp/constans.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wheel_slider/wheel_slider.dart';
import '../../../controller/datacont.dart';

class Height extends StatelessWidget {
  Height({super.key});

  final controller = Get.put(Datacontroller(), permanent: true);
  
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
        builder: (ctx, cont) => SizedBox(
              height: cont.maxHeight,
              width: cont.maxWidth,
              child: Column(
                children: [
                  choose_pic(cont , context),
                  const SizedBox(height: 50,),
                  select_height(cont),
                  const SizedBox(height: 20,),
                  select_wieght(cont)
                ],
              ),
            ));
  }

  // ignore: non_constant_identifier_names
  Container select_height(BoxConstraints cont) {
    return Container(
                  margin: const EdgeInsets.only(left: 20),
                  height: cont.maxHeight * 0.3,
                  width: cont.maxWidth,
                  child: GetBuilder<Datacontroller>(
                    builder:(contr)=> Column(
                      children: [
                        Row(
                          textBaseline: TextBaseline.alphabetic,
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.baseline,
                          children: [
                            const Text(
                              "Select your height :",
                              style: TextStyle(
                                  fontFamily: Constans.fontFamily,
                                  fontSize: 23,
                                  fontWeight: FontWeight.bold,
                                  wordSpacing: 2,
                                  color: Colors.black),
                            ),
                            Text(
                              " ${contr.currentheight}",
                              style: TextStyle(
                                  fontFamily: Constans.fontFamily,
                                  fontSize: 28,
                                  fontWeight: FontWeight.bold,
                                  wordSpacing: 2,
                                  color: controller.deepcolor),
                            ),
                            const Text(
                              " cm ",
                              style: TextStyle(
                                  color: Colors.black54, fontSize: 18),
                            )
                          ],
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          decoration: BoxDecoration(
                            border: Border.all(
                              width: 0.8,
                              color: controller.basiccolor
                            ),
                            borderRadius: BorderRadius.circular(40)
                          ),
                          margin: const EdgeInsets.only(top: 30),
                          height: cont.maxHeight * 0.15,
                          width: cont.maxWidth * 0.86,
                          child: WheelSlider.number(
                            pointerWidth: 60,
                            pointerHeight: 60,
                            pointerColor: Colors.black12,
                            showPointer: true,
                            itemSize: 70,
                            interval: 1,
                            totalCount: contr.totalhieght,
                            initValue: contr.initheight,
                            currentIndex: contr.currentheight,
                            unSelectedNumberStyle: const TextStyle(
                              fontSize: 22,
                              color: Color.fromARGB(190, 0, 0, 0),
                            ),
                            selectedNumberStyle: TextStyle(
                              fontSize: 30 ,
                              fontWeight: FontWeight.bold ,
                              color: controller.deepcolor
                            ),
                            onValueChanged: (val) {
                              contr.setheight(val);
                            },
                            hapticFeedbackType: HapticFeedbackType.vibrate,
                          ),
                        )
                      ],
                    ),
                  ),
                );
  }

 // ignore: non_constant_identifier_names
 Container select_wieght(BoxConstraints cont) {
    return Container(
                  margin: const EdgeInsets.only(left: 20),
                  height: cont.maxHeight * 0.3,
                  width: cont.maxWidth,
                  child: GetBuilder<Datacontroller>(
                    builder:(contr)=> Column(
                      children: [
                        Row(
                          textBaseline: TextBaseline.alphabetic,
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.baseline,
                          children: [
                            const Text(
                              "Select your Weight :",
                              style: TextStyle(
                                  fontFamily: Constans.fontFamily,
                                  fontSize: 23,
                                  fontWeight: FontWeight.bold,
                                  wordSpacing: 2,
                                  color: Colors.black),
                            ),
                            Text(
                              " ${contr.currentweight}",
                              style: TextStyle(
                                  fontFamily: Constans.fontFamily,
                                  fontSize: 28,
                                  fontWeight: FontWeight.bold,
                                  wordSpacing: 2,
                                  color: controller.deepcolor),
                            ),
                            const Text(
                              " kg ",
                              style: TextStyle(
                                  color: Colors.black54, fontSize: 18),
                            )
                          ],
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          decoration: BoxDecoration(
                            border: Border.all(
                              width: 0.8,
                              color: controller.basiccolor
                            ),
                            borderRadius: BorderRadius.circular(40)
                          ),
                          margin: const EdgeInsets.only(top: 30),
                          height: cont.maxHeight * 0.15,
                          width: cont.maxWidth * 0.86,
                          child: WheelSlider.number(
                            enableAnimation: false,
                            pointerWidth: 60,
                            pointerHeight: 60,
                            pointerColor: Colors.black12,
                            showPointer: true,
                            itemSize: 70,
                            interval: 1,
                            totalCount: contr.totalwieght,
                            initValue: contr.initweight,
                            currentIndex: contr.currentweight,
                            unSelectedNumberStyle: const TextStyle(
                              fontSize: 22,
                              color: Color.fromARGB(190, 0, 0, 0),
                            ),
                            selectedNumberStyle: TextStyle(
                              fontSize: 30 ,
                              fontWeight: FontWeight.bold ,
                              color: controller.deepcolor
                            ),
                            onValueChanged: (val) {
                              contr.setweight(val);
                            },
                            hapticFeedbackType: HapticFeedbackType.vibrate,
                          ),
                        )
                      ],
                    ),
                  ),
                );
  }

  // ignore: non_constant_identifier_names
  Container choose_pic(BoxConstraints cont , BuildContext ctx) {
    return Container(
      margin: const EdgeInsets.only(top: 30),
      height: cont.maxHeight * 0.2,
      width: cont.maxWidth,
      child: GetBuilder<Datacontroller>(
        builder:(contr)=> Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              margin: const EdgeInsets.only(left: 20, right: 20, top: 0),
              height: cont.maxHeight * 0.26,
              width: cont.maxWidth * 0.3,
              child:
              (contr.pickedimage==null)?Image.asset(
                "assets/images/picc.png",
                fit: BoxFit.fitHeight,
              ):Image.file(contr.pickedimage! , fit: BoxFit.cover,),
            ), 
            Container(
              alignment: Alignment.topCenter,
              margin: const EdgeInsets.only(right: 10),
              width: cont.maxWidth * 0.5,
              child: Column(
                children: [
                   Text(
                    "Please Choose picture for your profile ",
                    textAlign: TextAlign.left,
                    style: TextStyle(
                        fontFamily: Constans.fontFamily,
                        fontSize: MediaQuery.of(ctx).size.width*0.047,
                        fontWeight: FontWeight.bold,
                        wordSpacing: 2,
                        color: Colors.black),
                  ),
                  Container(
                    alignment: Alignment.bottomRight,
                    height: 25,
                    child: InkWell(
                      overlayColor: WidgetStatePropertyAll(
                          Colors.white.withOpacity(0)),
                      onTap: () {
                        contr.fetchimage();
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Icon(
                            Icons.photo_camera_back_outlined,
                            size: 20,
                            color: controller.deepcolor,
                          ),
                          const SizedBox(
                            width: 4,
                          ),
                          Text("Choose picture ",
                              style: TextStyle(
                                  fontFamily: Constans.fontFamily,
                                  fontSize: MediaQuery.of(ctx).size.width*0.04,
                                  // fontWeight: FontWeight.bold ,
                                  // wordSpacing: 2 ,
                                  color: controller.deepcolor))
                        ],
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
