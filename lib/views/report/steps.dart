import 'package:fitnessapp/constans.dart';
import 'package:fitnessapp/views/report/circleprogress.dart';
import 'package:fitnessapp/views/report/step_part.dart';
import 'package:flutter/material.dart';

class Steps extends StatefulWidget {
  final bool daily ;
  const Steps({super.key,required this.daily});

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
         builder: (context)=>StepCalculate());
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
                padding: const EdgeInsets.only(top: 3),
                child: Circleprogress(
                    color: Constans.test,
                    red: 58,
                    width: 10,
                    wid:  SizedBox(
                      height: 70,
                      width: 70,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                           SizedBox(
                             height: 45,
                             width: 50,
                             child: Image.asset("assets/images/step2.png",fit: BoxFit.contain,),
                           ), 
                         const Text(
                            "450",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Color.fromARGB(255, 133, 100, 3),
                              fontFamily: Constans.fontFamily,
                              fontSize: 14,
                            ),
                          )
                        ],
                      ),
                    ),
                    per: 450 / 1000,
                    colors:const[
                      Color(0xffF9CF4D),
                      Color(0xffE99C40)
                    ],
                    ),
              ),
              Container(
                height: 10,
                width: 40,
                color: Colors.amber,
              )
            ],
          ),
        ),
      ),
    );
  }
}
