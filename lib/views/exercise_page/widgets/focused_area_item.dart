import 'dart:async';

import 'package:fitnessapp/constans.dart';
import 'package:fitnessapp/controller/musclecon.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class FocusedAreaItem extends StatefulWidget {
  const FocusedAreaItem({
    super.key, required this.title, required this.areaNumber,
  });
  final String title;
  final int areaNumber;
  @override
  State<FocusedAreaItem> createState() => _FocusedAreaItemState();
}

class _FocusedAreaItemState extends State<FocusedAreaItem> {
  IconData iconOff = FontAwesomeIcons.lightbulb;
  final controller = Get.put(Musclecontroller());
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
          if (iconOff == FontAwesomeIcons.lightbulb) {
            setState(()  {
            iconOff=FontAwesomeIcons.solidLightbulb;
          controller.setarea(widget.areaNumber);
          controller.setbasic(Colors.black);
          Timer(const Duration(milliseconds: 800), () {
            controller.setbasic(
                const Color.fromARGB(255, 38, 164, 170).withOpacity(0.4));
            iconOff=FontAwesomeIcons.lightbulb;
          });
        });
            setState(() {
              
            });
            await Future.delayed(Duration(milliseconds:800 ));
setState(() {
  
});
          }
          else{
          }
        
        
      },
      child: Container(
        clipBehavior: Clip.hardEdge,
        height: 15,
         margin: const EdgeInsets.only(right: 8, top: 4, bottom: 4, left: 4),
         padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
        decoration: BoxDecoration(
            color: Color.fromARGB(70, 184, 229, 231).withOpacity(0.2),
            borderRadius: BorderRadius.circular(999)),
        child: Row(
          children: [
            Icon(
              iconOff,
              color: Constans.test.withOpacity(0.7),
              size: 18,
            ),
            SizedBox(
              width: 5,
            ),
            Text(
              widget.title,
              style: TextStyle(
                overflow: TextOverflow.ellipsis,
                  color: Colors.black,
                  fontFamily: Constans.fontFamily,
                  fontWeight: FontWeight.w600),
            )
          ],
        ),
      ),
    );
  }
}
