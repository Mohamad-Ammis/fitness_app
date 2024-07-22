import 'package:fitnessapp/controller/datacont.dart';
import 'package:fitnessapp/views/data_page/backgr.dart';
import 'package:fitnessapp/views/data_page/datawidget/activity.dart';
import 'package:fitnessapp/views/data_page/datawidget/button.dart';
import 'package:fitnessapp/views/data_page/datawidget/catrow.dart';
import 'package:fitnessapp/views/data_page/datawidget/days.dart';
import 'package:fitnessapp/views/data_page/datawidget/focarea.dart';
import 'package:fitnessapp/views/data_page/datawidget/gender.dart';
import 'package:fitnessapp/views/data_page/datawidget/height-weight.dart';
import 'package:fitnessapp/views/data_page/datawidget/illness.dart';
import 'package:fitnessapp/views/data_page/datawidget/target.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';



// ignore: must_be_immutable, use_key_in_widget_constructors
class Data extends StatelessWidget {
  List pages = [
    Gender(),
    Target(),
    Illness(),
    Activity(),
    Focusarea(),
    Height(),
    Days()
  ];

  final controller = Get.put(Datacontroller() , permanent: true);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children:[
           const Back(),
             GetBuilder<Datacontroller>(
              builder: (con) => con.isloading==false? Column(
                 mainAxisAlignment: MainAxisAlignment.center,
                 children: [
                   Catrow(),
                   Expanded(child:  PageView(
                       onPageChanged: (value) {
                        controller.changed(value);
                       },
                       physics:const NeverScrollableScrollPhysics(),
                       controller: con.control,
                       children: pages.map((item) => Container(
                         child: item,
                       ) ).toList(),
                     ),
                   ),
                   Button(),
                 ],
               ):Center(
                child: SizedBox(
                  height: MediaQuery.of(context).size.height*0.3,
                  width: MediaQuery.of(context).size.width*0.6,
                  child: /* CircularProgressIndicator() */Image.asset("assets/images/loading.gif"),
                ),
               ),
             ),]
        ),
      ),
    );
  }
}