import 'package:fitnessapp/controller/datacont.dart';
import 'package:fitnessapp/views/data_page/datawidget/question.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Gender extends StatelessWidget {
  Gender({super.key});
  final controller = Get.put(DataController(), permanent: true);
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (ctx, cont) {
      controller.setwidth(MediaQuery.of(context).size.width,
          MediaQuery.of(context).size.height);
      return Container(
        padding: const EdgeInsets.only(top: 3),
        height: cont.maxHeight,
        width: cont.maxWidth,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
                width: cont.maxWidth,
                alignment: Alignment.center,
                child: Question(
                  que: "What's your gender ? ",
                  subt: "Let us know you better",
                )),
            Expanded(
                child: Stack(
              children: [
                SizedBox(
                  height: cont.maxHeight * 0.9,
                  width: cont.maxWidth,
                ),
                GetBuilder<DataController>(
                  builder: (contr) => AnimatedPositioned(
                      left: contr.leftman,
                      bottom: contr.bottomman,
                      duration: const Duration(seconds: 1),
                      child: AnimatedOpacity(
                        opacity: contr.opacityman,
                        duration: const Duration(seconds: 1),
                        child: AnimatedContainer(
                          duration: const Duration(seconds: 1),
                          height: contr.heightman,
                          width: cont.maxWidth * 0.34,
                          child: Image.asset(
                            "assets/images/mm.png",
                            fit: BoxFit.fitHeight,
                          ),
                        ),
                      )),
                ),
                GetBuilder<DataController>(
                  builder: (contr) => AnimatedPositioned(
                      right: contr.rightwoman,
                      bottom: contr.bottomwoman,
                      duration: const Duration(seconds: 1),
                      child: AnimatedOpacity(
                        opacity: contr.opacitywoman,
                        duration: const Duration(seconds: 1),
                        child: AnimatedContainer(
                          duration: const Duration(seconds: 1),
                          height: contr.heightwoman,
                          width: cont.maxWidth * 0.34,
                          child: Image.asset(
                            "assets/images/woman.png",
                            fit: BoxFit.fitHeight,
                          ),
                        ),
                      )),
                )
              ],
            )),
            SizedBox(
                height: cont.maxHeight * 0.13,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Spacer(),
                    SizedBox(
                      width: cont.maxWidth * 0.32,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          GetBuilder<DataController>(
                            builder: (contr) => Radio(
                              value: 1,
                              groupValue: contr.man,
                              onChanged: (val) {
                                contr.selectman(
                                    m: val!,
                                    crm: controller.deepcolor,
                                    sizem: MediaQuery.of(context).size.width *
                                        0.08,
                                    weightm: FontWeight.bold,
                                    crw: Colors.black,
                                    sizew: 23,
                                    weightw: FontWeight.normal,
                                    leftm: cont.maxWidth * 0.32,
                                    bottomm: 10,
                                    heightm: cont.maxHeight * 0.68,
                                    opacitym: 1,
                                    rightw: 5,
                                    bottomw: 80,
                                    heightw: cont.maxHeight * 0.4,
                                    opacityw: 0.6);
                              },
                              activeColor: controller.deepcolor,
                            ),
                          ),
                          GetBuilder<DataController>(
                            builder: (contr) => AnimatedDefaultTextStyle(
                                style: TextStyle(
                                    color: contr.crman,
                                    fontSize: contr.sizeman,
                                    fontWeight: contr.weightman),
                                duration: const Duration(seconds: 1),
                                child: const Text("Male")),
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      width: cont.maxWidth * 0.03,
                    ),
                    SizedBox(
                      width: cont.maxWidth * 0.42,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          GetBuilder<DataController>(
                            builder: (contr) => Radio(
                              value: 2,
                              groupValue: contr.man,
                              onChanged: (val) {
                                contr.selectman(
                                    m: val!,
                                    crw: controller.deepcolor,
                                    sizew: MediaQuery.of(context).size.width *
                                        0.08,
                                    weightw: FontWeight.bold,
                                    crm: Colors.black,
                                    sizem: 23,
                                    weightm: FontWeight.normal,
                                    rightw: cont.maxWidth * 0.32,
                                    bottomw: 10,
                                    heightw: cont.maxHeight * 0.65,
                                    opacityw: 1,
                                    leftm: 5,
                                    bottomm: 80,
                                    heightm: cont.maxHeight * 0.4,
                                    opacitym: 0.6);
                              },
                              activeColor: controller.deepcolor,
                            ),
                          ),
                          GetBuilder<DataController>(
                            builder: (contr) => AnimatedDefaultTextStyle(
                                style: TextStyle(
                                    color: contr.crwoman,
                                    fontSize: contr.sizewoman,
                                    fontWeight: contr.weightwoman),
                                duration: const Duration(seconds: 1),
                                child: const Text("Female")),
                          )
                        ],
                      ),
                    ),
                    const Spacer()
                  ],
                ))
          ],
        ),
      );
    });
  }
}
