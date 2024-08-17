// ignore_for_file: use_build_context_synchronously

import 'dart:async';
import 'package:fitnessapp/controller/reportcontroller.dart';
import 'package:fitnessapp/shimmer/shimmergym.dart';
import 'package:fitnessapp/views/report/calories.dart';
import 'package:fitnessapp/views/report/num.dart';
import 'package:fitnessapp/views/report/steps.dart';
import 'package:fitnessapp/views/report/time.dart';
import 'package:fitnessapp/views/report/widget/bmi.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';

class Daily extends StatefulWidget {
  const Daily({super.key});

  @override
  State<Daily> createState() => _DailyState();
}

class _DailyState extends State<Daily> {

   bool isloading = false ;
   final control = Get.put(Reportcontroller() , permanent: true);

   @override
   void initState() {
       setState(() {
        isloading = true;
      });
      Timer(const Duration(milliseconds: 0), () async{
        try{
          await control.getreportdaily();
        }catch(error){
          showDialog(
              context: context,
              builder: (ctxx) => AlertDialog(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(40)),
                    title: const Text(
                      'Warning',
                      style: TextStyle(
                          color: Color.fromARGB(255, 252, 93, 93), fontSize: 25),
                      textAlign: TextAlign.center,
                    ),
                    content: Text(error.toString()),
                  ));
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
          isloading==false? Bmi():loadbmi(),
         ],
    );
  }



 Container info(BuildContext context) {
    return Container(
          //  color: Colors.amber,
            height: MediaQuery.of(context).size.height*0.47,
            width: MediaQuery.of(context).size.width,
            margin:const EdgeInsets.symmetric(horizontal: 10),
            child:  GridView.custom(
                            physics: const NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            gridDelegate: SliverWovenGridDelegate.count(
                              crossAxisCount: 2,
                              mainAxisSpacing: 0,
                              crossAxisSpacing: 0,
                              pattern: [
                                const WovenGridTile(1),
                                const WovenGridTile(
                                  1.2,
                                  crossAxisRatio: 0.97,
                                  alignment: AlignmentDirectional.centerEnd,
                                ),
                              ],
                            ),
                            childrenDelegate: SliverChildBuilderDelegate(
                                childCount: 4,
                                (context, index) =>
                                (index==0&&isloading==false)? Steps(daily: true,steps: control.stepday,):
                                (index==0&&isloading==true)?loadbmi():
                               (index ==1&&isloading==false)? Timee(
                                time: control.timeday,
                                totaltime: control.timetotalday,
                               ):
                                 (index ==1&&isloading==true)?loadbmi():
                                (index ==2&&isloading==false)? Number(num: control.numexerday):
                                 (index ==2&&isloading==true)?loadbmi()
                                :(index ==3&&isloading==false)? Calories(
                                  calories: control.calday,
                                  totalcalories: control.caltotalday,
                                ):loadbmi()
                                ),
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