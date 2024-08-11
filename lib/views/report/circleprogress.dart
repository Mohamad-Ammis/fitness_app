import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';

class Circleprogress extends StatelessWidget {
  final double red ;
  final Color color;
  final double width ;
  final Widget wid ;
  final double per ;
  final List<Color> colors ;
  const Circleprogress({super.key , required this.color ,
   required this.red,
   required this.width,
   required this.wid,
   required this.per,
   required this.colors
   });

  @override
  Widget build(BuildContext context) {
    return CircularPercentIndicator(
      rotateLinearGradient: true,
      linearGradient:LinearGradient( colors:colors),
      radius: red,
      lineWidth: width,
      percent: per,
      backgroundColor: Colors.black12,
      circularStrokeCap: CircularStrokeCap.round,
      center:wid
    ) ;
  }
}