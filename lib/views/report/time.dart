import 'package:fitnessapp/constans.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Timee extends StatefulWidget {
  final int time ;
  final int totaltime ;
  const Timee({super.key,
  required this.time,
  required this.totaltime
  });

  @override
  State<Timee> createState() => _TimeeState();
}

class _TimeeState extends State<Timee> {
  @override
  Widget build(BuildContext context) {
    return Card(
      margin:const EdgeInsets.only(top: 5, bottom: 10, left: 7, right: 7),
      elevation: 3,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      child: Container(
        padding:const EdgeInsets.only(left: 15 , top: 7),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            gradient:const LinearGradient(colors: [
              Color(0xff6AD4DD),
              Color(0xff7AA2E3)
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight
            ),),
            child: Column(
              children: [
                 Row(
              children: [
                const Text(
                  "Time",
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontFamily: Constans.fontFamily,
                      fontSize: 21),
                ),
                const Spacer(),
                Container(
                  height: 30,
                  width: 30,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(30)),
                  margin: const EdgeInsets.only(right: 12, top: 4),
                  child: const Icon(
                    Icons.timelapse_rounded,
                    size: 20,
                    color: Colors.black,
                  ),
                )
              ],
            ),
           const Spacer(),
            Row(
              children: [
                Text(widget.time.toString(),style: TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  fontFamily: Constans.fontFamily
                ),),
                SizedBox(width: 8,),
                Text("minute",style: TextStyle(
                  color: Colors.black,
                  fontSize: 15,
                  fontFamily: Constans.fontFamily
                ),)
              ],
            ),
             Row(
              children: [
              const  Text("from",style: TextStyle(
                  color: Colors.black,
                  fontSize: 15,
                  fontFamily: Constans.fontFamily
                ),),
              const  SizedBox(width: 8,),
                 Text(widget.totaltime.toString(),style: TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  fontFamily: Constans.fontFamily
                ),),
              ],
            ),
           const Spacer()
              ],
            ),
      ),
    );
  }
}
