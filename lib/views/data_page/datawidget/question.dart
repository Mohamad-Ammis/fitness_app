import 'package:fitnessapp/controller/datacont.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class Question extends StatelessWidget {
  String que ;
  String subt ;
   Question({super.key,
    required this.que,
    required this.subt
  }) ;
  final controller = Get.put(Datacontroller() , permanent: true);
  @override
  Widget build(BuildContext context) {
    return ListTile(
            title: Text(que , style:  TextStyle(
              fontFamily: "WorkSans",
              fontSize: MediaQuery.of(context).size.width*0.07 ,
              fontWeight: FontWeight.bold ,
              wordSpacing: 2 ,
              color: controller.twocolor
            ),
            textAlign: TextAlign.center,
            ),
            subtitle:  Padding(
              padding: const EdgeInsets.only(top: 8),
              child: Text(subt , textAlign: TextAlign.center, style:  TextStyle(
                fontFamily: "WorkSans",
                color: Colors.black45,
                fontSize: MediaQuery.of(context).size.width*0.045
              ),
              ),
            ),
          );
  }
}
