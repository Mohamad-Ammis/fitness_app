import 'package:fitnessapp/constans.dart';
import 'package:flutter/material.dart';

class Number extends StatefulWidget {
  final int num ;
  const Number({super.key,
  required this.num
  });

  @override
  State<Number> createState() => _NumberState();
}

class _NumberState extends State<Number> {
  
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(top: 10, bottom: 0, left: 7, right: 7),
      elevation: 3,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(25),
      ),
      child: Container(
          padding: const EdgeInsets.only(left: 15, top: 7),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25),
             color: Colors.white 
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
              children: [
                const Text(
                  "Exercise",
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontFamily: Constans.fontFamily,
                      fontSize: 20),
                ),
                const Spacer(),
                Container(
                  height: 30,
                  width: 30,
                  decoration: BoxDecoration(
                      color:const Color(0xff3471DF),
                      borderRadius: BorderRadius.circular(30)),
                  margin: const EdgeInsets.only(right: 12, top: 4),
                  child: const Icon(
                    Icons.sports_gymnastics_outlined,
                    size: 20,
                    color: Colors.white,
                  ),
                )
              ],
            ),
           Container(
            margin:const EdgeInsets.only(left: 20),
            height:55,
            width: 100,
            child: Image.asset("assets/images/srtc.png",fit: BoxFit.fitHeight,),
           ),
           Padding(
             padding:const EdgeInsets.only(left: 15),
             child:  Row(
                children: [
                  Text(widget.num.toString(),style:const TextStyle(
                    color: Color(0xff3471DF),
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    fontFamily: Constans.fontFamily
                  ),),
                 const SizedBox(width: 8,),
                 const Text("exercises",style: TextStyle(
                    color: Colors.black,
                    fontSize: 15,
                    fontFamily: Constans.fontFamily
                  ),)
                ],
              ),
           ),
                ],
              ),
              ),
              
    );

  }
}
