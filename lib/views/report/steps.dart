import 'package:fitnessapp/constans.dart';
import 'package:fitnessapp/views/report/circleprogress.dart';
import 'package:fitnessapp/views/report/step_part.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class Steps extends StatefulWidget {
  final bool daily ;
   int steps ;
   Steps({super.key,required this.daily ,
  required this.steps
  });

  @override
  State<Steps> createState() => _StepsState();
}

class _StepsState extends State<Steps> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      overlayColor: WidgetStatePropertyAll(Colors.white.withOpacity(0)),
      onTap: () {
        if(widget.daily){
           showDialog(context: context,
        barrierDismissible: false,
         builder: (context)=>StepCalculate()).then(( ff){
          setState(() {
            widget.steps+= int.parse(ff);
          });
         });
        }
      },
      child: Card(
        margin: const EdgeInsets.only(left: 7, right: 7, top: 7, bottom: 0),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
        elevation: 3,
        child: Container(
          padding: const EdgeInsets.only(left: 10, top: 6 ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25),
            color: Colors.white,
          ),
          child: Column(
            children: [
              Row(
                children: [
                  const Padding(
                    padding:  EdgeInsets.only(left: 5),
                    child: Text(
                      "Steps",
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontFamily: Constans.fontFamily,
                          fontSize: 20),
                    ),
                  ),
                  const Spacer(),
                  Container(
                    height: 30,
                    width: 30,
                    decoration: BoxDecoration(
                        color: Color(0xffE99C40),
                        borderRadius: BorderRadius.circular(30)),
                    margin: const EdgeInsets.only(right: 12, top: 4),
                    child: const Icon(
                      Icons.directions_walk_outlined,
                      size: 20,
                      color: Colors.white,
                    ),
                  )
                ],
              ),
               SizedBox(
                height:widget.daily == true? 0:5,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 0),
                child: Circleprogress(
                    color: Constans.test,
                    red: 55,
                    width: 10,
                    wid:  SizedBox(
                      height: 70,
                      width: 70,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                           SizedBox(
                             height: 40,
                             width: 45,
                             child: Image.asset("assets/images/step2.png",fit: BoxFit.contain,),
                           ), 
                          Text(
                           widget.steps.toString() ,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Color.fromARGB(255, 133, 100, 3),
                              fontFamily: Constans.fontFamily,
                              fontSize: 13,
                            ),
                          )
                        ],
                      ),
                    ),
                    per:widget.daily==true? widget.steps / 1000:widget.steps/7000,
                    colors:const[
                      Color(0xffF9CF4D),
                      Color(0xffE99C40)
                    ],
                    ),
              ),
             widget.daily? Container(
                margin: EdgeInsets.only(top: 6),
                height: 17,
                width: 70,
                alignment: Alignment.center,
                child: Text("Click here" , style: TextStyle(
                  fontFamily: Constans.fontFamily,
                  color: Color(0xffE99C40),
                  fontSize: 10
                ),),
              ):Container()
            ],
          ),
        ),
      ),
    );
  }
}
