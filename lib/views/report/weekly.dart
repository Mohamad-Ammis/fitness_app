import 'dart:async';

import 'package:fitnessapp/constans.dart';
import 'package:fitnessapp/controller/reportcontroller.dart';
import 'package:fitnessapp/shimmer/shimmergym.dart';
import 'package:fitnessapp/views/report/calories.dart';
import 'package:fitnessapp/views/report/num.dart';
import 'package:fitnessapp/views/report/steps.dart';
import 'package:fitnessapp/views/report/time.dart';
import 'package:fitnessapp/views/report/widget/bmi.dart';
import 'package:fitnessapp/views/report/widget/titles.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';

class Weekly extends StatefulWidget {
  const Weekly({super.key});

  @override
  State<Weekly> createState() => _WeeklyState();
}

class _WeeklyState extends State<Weekly> {
  bool isloading = false ;
  final controller = Get.put(Reportcontroller() , permanent: true);
  double x1 = 6.7 ;

@override
   void initState() {
       setState(() {
        isloading = true;
      });
      Timer(const Duration(milliseconds: 0), () async{
        try{
          await controller.getreportweekly();
        }catch(error){
          print(error);
        }
        setState(() {
          isloading = false ;
        });
       });
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return ListView(
         physics: const NeverScrollableScrollPhysics(),
         shrinkWrap: true,
         children: [
          info(context),
          weight(context),
          const SizedBox(height: 10,),
          calories(context), 
          const SizedBox(height: 10,),
          const Bmi(),   
          const SizedBox(height: 20,),
         ],
    );
  }

  Card calories(BuildContext context) {
    return Card(
            color: Colors.white,
            margin:const EdgeInsets.only(left: 13,right: 13 , top: 10),
            elevation: 3,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(25)
            ),
            child: Container(
              padding:const EdgeInsets.only(top: 5),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
                color: Constans.foodblue.withOpacity(0)
              ),
              child: Column(
                children: [
                 Container(
                  height: 50,
                  width: MediaQuery.of(context).size.width,
                  margin:const EdgeInsets.only(left: 20 , top: 4,bottom: 4),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        margin: EdgeInsets.only(right: 7),
                        height: 35,
                        width: 35,
                        child: Image.asset("assets/images/kcal.png",fit: BoxFit.contain,),
                      ),
                     const Text("Calories" , style: TextStyle(
                        fontFamily: Constans.fontFamily,
                        fontSize: 23,
                        fontWeight: FontWeight.bold
                      ),),
                      const Spacer(),
                    ],
                  ),
                 ),
                  LineChartSample2(leftTitleWidgets: leftTitleWidgets,
                  minY: controller.mincalories-((controller.maxcalories+controller.mincalories)/8),
                  maxY: controller.maxcalories+((controller.maxcalories+controller.mincalories)/8),
                  flspot:  const [
                      FlSpot(1, 300),
                      FlSpot(2, 200),
                      FlSpot(3, 500),
                      FlSpot(4, 310),
                      FlSpot(5, 400),
                      FlSpot(6, 300),
                      FlSpot(7, 400),],
                      h: (controller.maxcalories+controller.mincalories)/4,
                      fldot:  FlDotData(show: false,),
                       grad:const [
                        Color(0xffFE646F),
                        Color(0xffFFD15B)
                       ],
                       minX: 1,
                       maxX: 7,
                       weight: false,
                  ),
                ],
              )));
  }

  Card weight(BuildContext context) {
    return Card(
            color: Colors.white,
            margin:const EdgeInsets.only(left: 13,right: 13 , top: 10),
            elevation: 3,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(25)
            ),
            child: Container(
              padding:const EdgeInsets.only(top: 5),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
                color: Constans.foodblue.withOpacity(0)
              ),
              child: Column(
                children: [
                 Container(
                  height: 50,
                  width: MediaQuery.of(context).size.width,
                  margin:const EdgeInsets.only(left: 20),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        margin:const EdgeInsets.only(right: 7),
                        height: 33,
                        width: 33,
                        child: Image.asset("assets/images/w2.png",fit: BoxFit.contain,),
                      ),
                     const Text("Weight" , style: TextStyle(
                        fontFamily: Constans.fontFamily,
                        fontSize: 23,
                        fontWeight: FontWeight.bold
                      ),),
                      const Spacer(),
                      Container(
                        margin:const EdgeInsets.only(right: 10 , top: 5),
                        height:50 ,
                        width: 140,
                        child:const Column(
                          children: [
                            Row(children: [
                              Text("Heaviest:  ",style: TextStyle(
                                fontFamily: Constans.fontFamily,
                                fontSize: 12,
                                color: Colors.black87
                              ),),
                              SizedBox(width: 5,),
                              Text("45.7 Kg",style: TextStyle(
                                fontFamily: Constans.fontFamily,
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                                color: Color.fromARGB(255, 11, 133, 185)
                              ),)
                            ],),
                             Row(children: [
                              Text("Lightest:  ",style: TextStyle(
                                fontFamily: Constans.fontFamily,
                                fontSize: 12,
                                color: Colors.black87
                              ),),
                              SizedBox(width: 5,),
                              Text("42.7 Kg",style: TextStyle(
                                fontFamily: Constans.fontFamily,
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                                color: Color.fromARGB(255, 11, 133, 185)
                              ),)
                            ],),
                          ],
                        ),
                      )
                    ],
                  ),
                 ),
                  LineChartSample2(leftTitleWidgets:leftTitleWidgetsweight ,
                  minY: controller.currentweight*10-15,
                  maxY: controller.currentweight*10+15,
                  flspot:  [
                    FlSpot(1, controller.currentweight*10-5),
                    FlSpot(7, controller.currentweight*10),
                  ],
                  h: 3,
                  fldot:  FlDotData(
                      show: true,
                      getDotPainter: (spot, percent, barData, index) {
                        return FlDotCirclePainter(
                          radius: 4,
                          color:const Color(0xff29ABE2),
                          strokeWidth: 3,
                          strokeColor:const Color.fromARGB(255, 106, 74, 212),
                        );},),
                  grad:const [Color(0xff29ABE2),Color.fromARGB(255, 106, 74, 212)],
                  minX: 0.5,
                  maxX: 8,
                  weight: true,
                  ),
                ],
              )));
  }

    Widget leftTitleWidgets(double value, TitleMeta meta) {
    const style = TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 13,
    );
    String text;
    if(value.toInt()==controller.maxcalories){
      text = (controller.maxcalories.toInt()).toString();
      return Text(text, style: style, textAlign: TextAlign.center);
    }else if(value.toInt()==((controller.maxcalories+controller.mincalories)/2)){
      text = ((controller.maxcalories+controller.mincalories)/2).toInt().toString();
      return Text(text, style: style, textAlign: TextAlign.center);
    }else if(value.toInt()==controller.mincalories){
      text = (controller.mincalories.toInt()).toString();
      return Text(text, style: style, textAlign: TextAlign.center);
    }else{
      return Container();
    }
  }

   Widget leftTitleWidgetsweight(double value, TitleMeta meta) {
    const style = TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 13,
    );
    String text;
    if(value.toInt()==controller.currentweight*10-10){
      text = (controller.currentweight-0.1).toString();
      return Text(text, style: style, textAlign: TextAlign.center);
    }else if (value.toInt()==controller.currentweight*10-5){
       text = (controller.currentweight-0.5).toString();
       return Text(text, style: style, textAlign: TextAlign.center);
    }else if(value.toInt()==controller.currentweight*10){
       text = (controller.currentweight).toString();
       return Text(text, style: style, textAlign: TextAlign.center);
    }else if(value.toInt()==controller.currentweight*10+5){
       text = (controller.currentweight+0.5).toString();
       return Text(text, style: style, textAlign: TextAlign.center);
    }else if(value.toInt()==controller.currentweight*10+10){
       text = (controller.currentweight+0.1).toString();
       return Text(text, style: style, textAlign: TextAlign.center);
    }else{
        return Container();
    }
  }

 Container info(BuildContext context) {
    return Container(
            height: MediaQuery.of(context).size.height*0.45,
            width: MediaQuery.of(context).size.width,
            margin:const EdgeInsets.symmetric(horizontal: 10),
            child:  GridView.custom(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              gridDelegate: SliverWovenGridDelegate.count(
                crossAxisCount: 2,
                mainAxisSpacing: 0,
                crossAxisSpacing: 0.5,
                pattern: [
                  const WovenGridTile(1.05),
                  const WovenGridTile(
                    1.3,
                    crossAxisRatio: 0.97,
                    alignment: AlignmentDirectional.centerEnd,
                  ),
                ],
              ),
              childrenDelegate: SliverChildBuilderDelegate(
                  childCount: 4,
                  (context, index) =>index==0? Steps(daily: false,):
                  index == 1?Timee():
                  (index ==2&&isloading==false)? Number(num: controller.numexerweek):
                  (index ==2&&isloading==true)?loadbmi():
                  Calories()),
            ),
          );
  }
   Widget loadbmi(){
    return Card(
            elevation: 3,
             color: Colors.white,
             margin:const EdgeInsets.only(left: 15 , right: 15 , top: 10),
             shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(25)
             ),
              child:Shimmergym.Rectangle(
              cc: Colors.white,
              radius: 25,
             height: MediaQuery.of(context).size.height*0.185,
              width: MediaQuery.of(context).size.width,),
              );
  }

}