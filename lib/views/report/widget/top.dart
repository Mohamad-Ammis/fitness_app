import 'package:flutter/material.dart';

class Top extends StatelessWidget {
  final double top ;
  final String text ;
  final Color color ;
  const Top({super.key,
  required this.color,
  required this.text,
  required this.top
  });

  @override
  Widget build(BuildContext context) {
    return Container(
            height: MediaQuery.of(context).size.height*0.06,
            width: MediaQuery.of(context).size.width,
            margin: EdgeInsets.only(top: top),
            padding:const EdgeInsets.only(top: 3 , left: 10),
            child: Text(text , style: TextStyle(
              color: color,
              fontSize: MediaQuery.of(context).size.width*0.065,
              fontWeight: FontWeight.bold,
              fontFamily: "Work Sans"
            ),),
          );
  }
}