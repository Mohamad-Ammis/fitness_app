import 'package:fitnessapp/constans.dart';
import 'package:flutter/material.dart';
import 'package:timeline_tile/timeline_tile.dart';

class Mytimelinetile extends StatelessWidget {
  final bool isfirst;
  final bool islast;
  final bool ispast;
  final String textt;
  const Mytimelinetile({super.key , required this.isfirst , required this.islast , required this.ispast , required this.textt});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 180,
      child: TimelineTile(

       isFirst: isfirst,
       isLast: islast,
       beforeLineStyle:LineStyle(color:ispast? const Color.fromARGB(255, 32, 94, 112):const Color.fromARGB(255, 32, 94, 112).withOpacity(0.2) , thickness: 3  ),
       indicatorStyle: IndicatorStyle(
        width: 35 ,
        color: ispast? const Color.fromARGB(255, 50, 144, 173):const Color.fromARGB(255, 50, 144, 173).withOpacity(0.2),
        iconStyle: IconStyle(iconData: Icons.flash_on_rounded , color: Colors.white ,fontSize:20 )
       ),
       endChild: Container(
        height: 40,
        width: 60,
        alignment: Alignment.centerLeft,
        padding: const EdgeInsets.only(left: 10),
       // color: Colors.amber,
        child: Text(textt , style: TextStyle(
          fontSize: MediaQuery.of(context).size.width * 0.05,
          fontWeight: FontWeight.bold,
          color: ispast? Color.fromARGB(255, 50, 144, 173):Color.fromARGB(255, 50, 144, 173).withOpacity(0.2),
          fontFamily: Constans.fontFamily,
        ),)),
      ),
    );
  }
}