import 'package:fitnessapp/controller/datacont.dart';
import 'package:fitnessapp/home.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Button extends StatelessWidget {
  Button({super.key});
  final controller = Get.put(DataController(), permanent: true);
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.12,
      child: Row(
        children: [
          const Spacer(),
          GetBuilder<DataController>(
              builder: (cont) => Padding(
                    padding: const EdgeInsets.only(right: 20, bottom: 20),
                    child: Card(
                      elevation: 10,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30)),
                      child: (cont.index) <= 4
                          ? ElevatedButton(
                              onPressed: () {
                                controller.control.nextPage(
                                    duration: const Duration(seconds: 1),
                                    curve: Curves.bounceOut);
                                controller.nextpercent();
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: controller.basiccolor,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30),
                                ),
                              ),
                              child: childbutton("Next"))
                          : ElevatedButton(
                              onPressed: () {
                                Get.offAll(const Home());
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: controller.basiccolor,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30),
                                ),
                              ),
                              child: childbutton("Done")),
                    ),
                  ))
        ],
      ),
    );
  }

  Container childbutton(String s) {
    return Container(
      alignment: Alignment.center,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
      height: 60,
      width: 150,
      child: Text(
        s,
        style: const TextStyle(
            fontFamily: "WorkSans",
            fontSize: 25,
            fontWeight: FontWeight.bold,
            color: Colors.white),
      ),
    );
  }
}
