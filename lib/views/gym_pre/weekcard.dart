import 'package:fitnessapp/constans.dart';
import 'package:fitnessapp/controller/precontroller.dart';
import 'package:fitnessapp/controller/spec_day_controller.dart';
import 'package:fitnessapp/models/dayplan.dart';
import 'package:fitnessapp/views/gym_pre/planofday.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Weekcard extends StatelessWidget {
  final List<Dayplan> week;
  final bool ispast;
   Weekcard({super.key, required this.week, required this.ispast});
  final controller = Get.put(Precontroller(), permanent: true);
  final control = Get.put(SpecDay(), permanent: true);
  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: ispast?1:0.4,
      child: Container(
        margin: EdgeInsets.only(left: 50, right: 30, bottom: 50),
        height: 130,
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color:/* Colors.white.withOpacity(0.5) */Color.fromARGB(255, 50, 144, 173).withOpacity(0.04)/* Colors.black.withOpacity(0.02) */,
          border: Border.all(
            color: Color(0xff4A748C),
            width: 0.1
          )
        ),
        child: LayoutBuilder(builder: (context , contr)=>Container(
          height: contr.maxHeight,
          width: contr.maxWidth,
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 8),
                height: contr.maxHeight*0.5,
                width: contr.maxWidth,
               child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  day(contr , week[0] , context),
                  daybetween(contr, context),
                  day(contr , week[1] , context),
                  daybetween(contr, context),
                  day(contr , week[2] , context),
                  daybetween(contr, context),
                  day(contr , week[3] , context)
                ],
               ),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 35),
                height: contr.maxHeight*0.5,
                width: contr.maxWidth,
               child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  day(contr , week[4] , context),
                  daybetween(contr, context),
                  day(contr , week[5] , context),
                  daybetween(contr, context),
                  day(contr , week[6] , context),
                ],
               ),
              ),
            ],
          ),
        )),
      ),
    );
  }

  Widget day(BoxConstraints contr , Dayplan d , BuildContext context) {
    return InkWell(
      onTap: (){
        if(controller.plans.contains(d.id)){
           control.updateday(d.id);
           Get.off(Dayplanpage(d: d,));
        }
      },
      child: Container(
        height: contr.maxHeight*0.35,
        width: contr.maxHeight*0.35,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(70),
          border: Border.all(
            width:(d.id != controller.plans[controller.plans.length-1])? 0.7:3 ,
            color:controller.plans.contains(d.id)? Color.fromARGB(255, 50, 144, 173):Color.fromARGB(255, 50, 144, 173).withOpacity(0.3)
          ),
        //  color:(controller.plans.contains(d.id)&& d.id != controller.plans[controller.plans.length-1] )? /* Color.fromARGB(255, 175, 212, 215) */Color(0xff4A748C):null,
          gradient:(controller.plans.contains(d.id)&& d.id != controller.plans[controller.plans.length-1] )? LinearGradient(colors: [
          // Colors.black,
            Color.fromARGB(255, 63, 161, 191),
         //  Color.fromARGB(255, 50, 144, 173),
          //  Colors.black
          Color(0xff4A748C)
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight
          ):null
        ),
        alignment: Alignment.center,
        child:(controller.plans.contains(d.id)&& d.id != controller.plans[controller.plans.length-1] )?Icon(Icons.done , color:/* Color.fromARGB(255, 50, 144, 173) */Colors.white, size: 25,)
        : Text(d.day.toString() , style: TextStyle(
          fontSize: MediaQuery.of(context).size.width * 0.05,
          color:controller.plans.contains(d.id)? Color.fromARGB(255, 50, 144, 173):Color.fromARGB(255, 50, 144, 173).withOpacity(0.3),
          fontWeight: FontWeight.bold,
          fontFamily: Constans.fontFamily,
        ),),
      ),
    );
  }
  Widget daybetween(BoxConstraints contr , BuildContext context) {
    return  Container(
      height: contr.maxHeight*0.4,
      width: contr.maxHeight*0.2,
     alignment: Alignment.center,
     child: Icon(Icons.arrow_forward_ios_outlined , size: 20, color: Colors.grey,),
    );
  }
}
