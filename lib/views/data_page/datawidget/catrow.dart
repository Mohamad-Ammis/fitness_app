import 'package:fitnessapp/controller/datacont.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:percent_indicator/percent_indicator.dart';

class Catrow extends StatelessWidget {
   Catrow({super.key});
   final controller = Get.put(Datacontroller() , permanent: true);
  @override
  Widget build(BuildContext context) {
     
    return GetBuilder<Datacontroller>(builder: (controller)=> Container(
              padding: const EdgeInsets.only(top: 20),
              height: MediaQuery.of(context).size.height*0.09,
              child:GetBuilder<Datacontroller>(
                builder:(contr)=> Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 85,
                      child:contr.index>0? TextButton(
                         style: ButtonStyle(
                          overlayColor: MaterialStatePropertyAll(Colors.white.withOpacity(0)),
                          
                         ),
                        onPressed: (){
                        contr.previouspercent();
                        controller.control.previousPage(duration: const Duration(seconds: 1), curve: Curves.decelerate);
                      }, child: const Icon(Icons.arrow_back , size: 40, color: Color(0xff281537),)):null,
                    ),
                    LinearPercentIndicator(
                      animateFromLastPercent: true,
                     animation: true,
                    width: MediaQuery.of(context).size.width*0.6,
                    percent: contr.percent,
                    lineHeight: 8,
                    barRadius: const Radius.circular(20),
                    linearGradient:  LinearGradient(colors: [
                      controller.deepcolor.withOpacity(0.7),
                      const Color.fromARGB(255, 165, 213, 222).withOpacity(0.7),
                      const Color(0xff281537).withOpacity(0.6)
                    ]) ,
                  ),
                  ],
                ),
              )
            ),);
  }
}