import 'package:fitnessapp/constans.dart';
import 'package:fitnessapp/controller/reportcontroller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Bmi extends StatefulWidget {
  const Bmi({super.key});

  @override
  State<Bmi> createState() => _BmiState();
}

class _BmiState extends State<Bmi> {

  final control = Get.put(Reportcontroller() , permanent: true);
  Color color = Constans.test ;


  @override
  void initState() {
     if(double.parse(control.bmi)> 15 && double.parse(control.bmi) <16){
        color = Color(0xff2D47D0) ;
     }else if(double.parse(control.bmi)> 16 && double.parse(control.bmi) <18.5){
         color =Color(0xff3A81F2) ;
     }else if(double.parse(control.bmi)> 18.5 && double.parse(control.bmi) <25){
         color =Color(0xff56C6DF) ;
     }else if(double.parse(control.bmi)> 25 && double.parse(control.bmi) <30){
         color =Color(0xffF9CF4D) ;
     }else if(double.parse(control.bmi)> 30 && double.parse(control.bmi) <35){
        color =Color(0xffE99C40) ;
     }else{
        color =Color(0xffE03741) ;
     }
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Card(
            elevation: 3,
             margin:const EdgeInsets.only(left: 15 , right: 15 , top: 10),
             shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(25)
             ),
             child: Container(
              height: MediaQuery.of(context).size.height*0.185,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
                color: Colors.white
              ),
              child: Column(
                children: [
                  Row(
                    children: [
                      Padding(
                        padding:  EdgeInsets.only(left: 15 , top: 10),
                        child: Row(
                          children: [
                          const Text("BMI",style: TextStyle(
                              fontFamily: Constans.fontFamily,
                              color: Colors.black,
                              fontSize: 23,
                              fontWeight: FontWeight.bold
                            ),),
                            Text("(${double.parse(control.bmi).toStringAsFixed(1)})",style:const TextStyle(
                              fontFamily: Constans.fontFamily,
                              color: Colors.black,
                              fontSize: 23,
                              fontWeight: FontWeight.bold
                            ),),
                          ],
                        ),
                      ),
                      const Spacer(),
                      Container(
                        margin:const EdgeInsets.only(right: 6 , top: 10),
                        height: 18,
                        width: 18,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                           color: color,
                        ),
                      ),
                       Padding(
                        padding:const EdgeInsets.only(right: 20 , top: 10),
                        child: Text(control.bmicat,style:const TextStyle(
                          fontFamily: Constans.fontFamily,
                          color: Colors.black,
                          fontSize: 15,
                        ),),
                      ),
                    ],
                  ),
                  Container(
                    margin:const EdgeInsets.only(top: 30),
                        height: 20,
                        width: 315,
                        child: Row(
                          children: [
                            cont(20,30,Color.fromARGB(255, 142, 151, 193),Color(0xff2D47D0)),
                            cont(20,45,Color(0xff82A4E6),Color(0xff3A81F2)),
                            cont(20,65,Color(0xff6FD7D5),Color(0xff56C6DF)),
                            cont(20,55,Color(0xffFDE285),Color(0xffF9CF4D)),
                            cont(20,55,Color(0xffF5C487),Color(0xffE99C40)),
                            cont(20,55,Color(0xffF26680),Color(0xffE03741)),
                          ],
                        ),
                      ),
                    Container(
                    margin:const EdgeInsets.only(top: 0),
                        height: 20,
                        width: 315,
                        child: Row(
                          children: [
                            cont1(20,26,"15"),
                            cont1(20,41,"16"),
                            cont1(20,61,"18.5"),
                            cont1(20,54,"25"),
                            cont1(20,55,"30"),
                            cont1(20,51,"35"),
                            cont1(20,20,"40"),
                          ],
                        ),
                      )
                ],
              ),
             ),
           );
  }


Container cont(double h , double w ,  Color c1 , Color c2) {
    return Container(
      margin:const EdgeInsets.only(right: 1),
        height: h,
        width: w,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          gradient: LinearGradient(colors: [
            c1,
            c2
          ])
        ),
      );
  }

   Container cont1(double h , double w ,String text) {
    return Container(
      margin:const EdgeInsets.only(right: 1),
        height: h,
        width: w,
        alignment: Alignment.centerLeft,
        child: Text(text , style:const TextStyle(
          fontSize: 13,
          fontFamily: Constans.fontFamily,
          color: Colors.black,
        ),),
      );
  }




}