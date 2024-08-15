import 'package:fitnessapp/constans.dart';
import 'package:fitnessapp/controller/precontroller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Confirmdealog extends StatefulWidget {
  const Confirmdealog({super.key});

  @override
  State<Confirmdealog> createState() => _ConfirmdealogState();
}

class _ConfirmdealogState extends State<Confirmdealog> {

final controller = Get.put(Precontroller(), permanent: true);

  @override
  Widget build(BuildContext context) {
    return  AlertDialog(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(40)),
        title: Row(
          children: [
            Container(
              margin:const EdgeInsets.only(right: 10),
              height: 40,
              width: 40,
              child: Image.asset(
                          "assets/images/confirm.png",
                          fit: BoxFit.contain,
                        ),
            ),
            const Text(
              'Please Confirm',
              style: TextStyle(
                  fontFamily: Constans.fontFamily,
                  color: Color.fromARGB(255, 124, 186, 237), fontSize: 23,fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
          ],
        ),
        content: SizedBox(
          height: 130,
          child: Column(
            children: [
             const Text("Please click Confirm when you Pay for Coach" , style: TextStyle(
                fontFamily: Constans.fontFamily,
                fontSize: 15,
                color: Colors.black
              ),
              textAlign: TextAlign.center,),
                Container(
                    margin: const EdgeInsets.only(top: 10, right: 0, bottom: 10),
                    height: 60,
                    width: MediaQuery.of(context).size.width,
                    decoration: const BoxDecoration(
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(30),
                            bottomRight: Radius.circular(30))),
                    alignment: Alignment.bottomRight,
                    child: Row(
                      children: [
                       const Spacer(),
                        ElevatedButton(
                            onPressed: () {
                              Get.back();
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor:controller.color,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30),
                              ),
                            ),
                            child: childbutton(" Cancel ", 50, 60, 0, 15)),
                          const  Spacer(),
                             ElevatedButton(
                        onPressed: () {
                          Navigator.of(context).pop(true);
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor:controller.color,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                        ),
                        child: childbutton("Confirm ", 50, 60, 0, 15)),
                      const  Spacer(),
                      ],
                    ),
                  )
            ],
          ),
        ),
      );
  }

  Container childbutton(
      String s, double height, double width, double hori, double font ) {
    return Container(
      alignment: Alignment.center,
      padding: EdgeInsets.symmetric(horizontal: hori, vertical: 8),
      height: height,
      width: width,
      child: Text(
        s,
        style: TextStyle(
            fontFamily: Constans.fontFamily,
            fontSize: font,
            // fontWeight: FontWeight.bold,
            color: Colors.white),
      )
    );
  }
}