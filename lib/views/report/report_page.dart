import 'package:fitnessapp/constans.dart';
import 'package:fitnessapp/views/report/daily.dart';
import 'package:fitnessapp/views/report/weekly.dart';
import 'package:fitnessapp/views/report/widget/top.dart';
import 'package:flutter/material.dart';

class Reportpage extends StatefulWidget {
  const Reportpage({super.key});

  @override
  State<Reportpage> createState() => _ReportpageState();
}

class _ReportpageState extends State<Reportpage> {
  
  int select = 1 ;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:const Color(0xffE7E8EC) ,
      body:ListView(
        children: [
          const Top(color:Colors.black, text: "My Activity", top: 5),
          choose(context),
          const SizedBox(height: 20,),
          select==1?Daily():Weekly()
          ],
      )
    );
  }

  Card choose(BuildContext context) {
    return Card(
            margin:const EdgeInsets.only(top: 10 , left: 20 , right: 20),
            elevation: 5,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(25)
            ),
            child: Container(
              height: MediaQuery.of(context).size.height*0.065,
              width: MediaQuery.of(context).size.width,
             decoration: BoxDecoration(
              border: Border.all(
                width: 0.05,
                color: Colors.black
              ),
              borderRadius: BorderRadius.circular(25)
             ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  button("Daily",1),
                  Container(
                    width: 0.5,
                    height: MediaQuery.of(context).size.height*0.07,
                    color:Colors.black87,
                  ),
                   button("Weekly",2),
                ],
              ),
            ),
          );
  }

  Widget button(String text , int id) {
    return Expanded(
      child: InkWell(
        onTap: (){
        setState(() {
          select = id ;
        });
      },
        child: Container(
                      height: MediaQuery.of(context).size.height*0.07,
                      decoration:select==id? BoxDecoration(
                        borderRadius:select==1?const BorderRadius.only(
                          topLeft: Radius.circular(25),
                          bottomLeft: Radius.circular(25)
                        ):const BorderRadius.only(
                          topRight: Radius.circular(25),
                          bottomRight: Radius.circular(25)
                        ),
                        color: /* Constans.test */Color.fromRGBO(78, 195, 206, 1)
                      ):null,
                      
                      alignment: Alignment.center,
                      child: Text(text,style: TextStyle(
                        fontFamily: Constans.fontFamily,
                        fontSize: 19,
                        color:select==id? Colors.white:Colors.black,
                        fontWeight: FontWeight.bold
                      ),),
                    ),
      ),
    );
  }


}