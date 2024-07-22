import 'package:fitnessapp/controller/precontroller.dart';
import 'package:fitnessapp/controller/spec_day_controller.dart';
import 'package:fitnessapp/views/gym_pre/plan.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Dealogcoach extends StatelessWidget {
  final int coachid ;
  Dealogcoach({super.key , required this.coachid});
  final control = Get.put(SpecDay(), permanent: true);
  final controller = Get.put(Precontroller(), permanent: true);

  @override
  Widget build(BuildContext context) {
    return Dialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(40),
            color:const Color.fromARGB(255, 243, 252, 255),
          ),
          height: 370,
          width: MediaQuery.of(context).size.width * 0.9,
          child: GetBuilder<Precontroller>(
            builder: (contr) => Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin:const EdgeInsets.only(top: 23, left: 15, right: 15),
                  width: MediaQuery.of(context).size.width * 0.85,
                  child: Text("Subscription with coach includes :" , 
                  style: TextStyle(
                    fontSize: MediaQuery.of(context).size.width * 0.04,
                      color: Colors.redAccent,
                      fontWeight: FontWeight.bold,
                      fontFamily: "WorkSans",
                  ),
                  ),
                ),
                textt(context, contr , "Exercise for a month"),
                textt(context, contr , "Meals for a month"),
                textt(context, contr , "Determine the type of exercises"),
                Padding(
                  padding: const EdgeInsets.only(left: 50),
                  child: Row(
                    children: [
                      Transform.scale(
                        scale: 0.85,
                        child: Radio(
                          value: 1,
                          groupValue: contr.choosetypeexer,
                          onChanged: (value) {
                            contr.choose(value!);
                          },
                          activeColor: contr.color,
                        ),
                      ),
                      Text("With equipment ",
                          style: TextStyle(
                            fontSize: MediaQuery.of(context).size.width * 0.035,
                            color: contr.color,
                            fontWeight: FontWeight.bold,
                            fontFamily: "WorkSans",
                          ))
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 50),
                  child: Row(
                    children: [
                      Transform.scale(
                        scale: 0.85,
                        child: Radio(
                          value: 2,
                          groupValue: contr.choosetypeexer,
                          onChanged: (value) {
                            contr.choose(value!);
                          },
                          activeColor: contr.color,
                        ),
                      ),
                      Text("Without equipment ",
                          style: TextStyle(
                            fontSize: MediaQuery.of(context).size.width * 0.035,
                            color: contr.color,
                            fontWeight: FontWeight.bold,
                            fontFamily: "WorkSans",
                          ))
                    ],
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 15, right: 25, bottom: 20),
                  height: 60,
                  width: MediaQuery.of(context).size.width,
                  decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(30),
                          bottomRight: Radius.circular(30))),
                  alignment: Alignment.bottomRight,
                  child: ElevatedButton(
                      onPressed: () {
                        control.updatecoach(coachid);
                        Navigator.of(context).pop();
                        Get.to(Plan());
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: contr.color,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                      child: childbutton("Confirm ", 50, 85, 0, 16)),
                )
                
              ],
            ),
          ),
        ));
  }

  Container textt(BuildContext context, Precontroller contr , String s) {
    return Container(
                margin: EdgeInsets.only(top: 10),
               height: 30,
               width: MediaQuery.of(context).size.width * 0.85,
               child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(width: 10,),
                  Icon(Icons.task_alt_sharp , color: contr.color,size: 23,),
                  SizedBox(width: 10,),
                  Text(s ,
                  style: TextStyle(
                    fontSize: MediaQuery.of(context).size.width * 0.038,
                    color: const Color.fromARGB(255, 1, 49, 63),
                    fontWeight: FontWeight.bold,
                    fontFamily: "WorkSans",
                  ),
                  )
                ],
               ),
              );
  }

  Container childbutton(
      String s, double height, double width, double hori, double font) {
    return Container(
      alignment: Alignment.center,
      padding: EdgeInsets.symmetric(horizontal: hori, vertical: 8),
      height: height,
      width: width,
      child: Text(
        s,
        style: TextStyle(
            fontFamily: "WorkSans",
            fontSize: font,
            // fontWeight: FontWeight.bold,
            color: Colors.white),
      ),
    );
  }
}
