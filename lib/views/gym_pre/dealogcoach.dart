// ignore_for_file: use_build_context_synchronously

import 'package:fitnessapp/constans.dart';
import 'package:fitnessapp/controller/payment_coach_controller.dart';
import 'package:fitnessapp/controller/precontroller.dart';
import 'package:fitnessapp/controller/spec_day_controller.dart';
import 'package:fitnessapp/main.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

class Dealogcoach extends StatefulWidget {
  final int coachid ;
  const Dealogcoach({super.key , required this.coachid});

  @override
  State<Dealogcoach> createState() => _DealogcoachState();
}

class _DealogcoachState extends State<Dealogcoach> {
  final control = Get.put(SpecDay(), permanent: true);

  final controller = Get.put(Precontroller(), permanent: true);

  final paymentcontroller = Get.put(Paymentcoach(), permanent: true);

  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Dialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(40),
            color:Colors.white,
          ),
          height: 390,
          width: MediaQuery.of(context).size.width * 0.9,
          child: GetBuilder<Precontroller>(
            builder: (contr) =>Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  alignment: Alignment.center,
                  margin:const EdgeInsets.only(top: 23, left: 15, right: 15 , bottom: 10),
                  width: MediaQuery.of(context).size.width * 0.85,
                  child: Row(
                    children: [
                      Text("Subscription with coach :" , 
                      style: TextStyle(
                        fontSize: MediaQuery.of(context).size.width * 0.045,
                          color:const Color.fromARGB(255, 1, 49, 63),
                          fontWeight: FontWeight.bold,
                          fontFamily: Constans.fontFamily,
                      ),
                      textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
                textt(context, contr , "Exercise for a month"),
                textt(context, contr , "Meals for a month"),
                textt(context, contr , "Determine the type of exercises"),
                Padding(
                  padding: const EdgeInsets.only(left: 50),
                  child: Row(
                    children: [
                      Transform.scale(
                        scale: 0.85,
                        child: Radio(
                          value: 1,
                          groupValue: contr.choosetypeexer,
                          onChanged: (value) {
                            contr.choose(value!);
                          },
                          activeColor: contr.color,
                        ),
                      ),
                      Text("With equipment ",
                          style: TextStyle(
                            fontSize: MediaQuery.of(context).size.width * 0.035,
                            color: contr.color,
                            fontWeight: FontWeight.bold,
                            fontFamily: Constans.fontFamily,
                          ))
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 50),
                  child: Row(
                    children: [
                      Transform.scale(
                        scale: 0.85,
                        child: Radio(
                          value: 2,
                          groupValue: contr.choosetypeexer,
                          onChanged: (value) {
                            contr.choose(value!);
                          },
                          activeColor: contr.color,
                        ),
                      ),
                      Text("Without equipment ",
                          style: TextStyle(
                            fontSize: MediaQuery.of(context).size.width * 0.035,
                            color: contr.color,
                            fontWeight: FontWeight.bold,
                            fontFamily: Constans.fontFamily,
                          ))
                    ],
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 15, right: 25, bottom: 20),
                  height: 60,
                  width: MediaQuery.of(context).size.width,
                  decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(30),
                          bottomRight: Radius.circular(30))),
                  alignment: Alignment.bottomRight,
                  child: ElevatedButton(
                      onPressed: () async{
                        if(controller.choosetypeexer!=0){
                          setState(() {
                          isLoading = true;
                        });
                        try{
                          control.updatecoach(widget.coachid);
                        userInfo!.setInt("equ[${widget.coachid}]",controller.choosetypeexer);
                        await paymentcontroller.subscribe(widget.coachid);
                        await paymentcontroller.payment(paymentcontroller.idsub);
                        
                        if(paymentcontroller.urll!=""){
                          var uri = Uri.parse(paymentcontroller.urll.toString());
                          await _launchURL(uri.toString());
                           Navigator.of(context).pop(true);
                        }
                        }catch(error){
                          showDialog(
                            context: context,
                            builder: (ctxx) => AlertDialog(
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(40)),
                                  title: const Text(
                                    'Warning',
                                    style: TextStyle(
                                        color: Color.fromARGB(255, 252, 93, 93), fontSize: 25),
                                    textAlign: TextAlign.center,
                                  ),
                                  content: Text(error.toString()),
                                ));
                        }
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: contr.color,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                      child: childbutton("Confirm ", 50, 85, 0, 16,isLoading)),
                )
                
              ],
            )
          ),
        ));
  }

  Future<void> _launchURL(String url) async {
  if (await canLaunchUrl(Uri.parse(url))) {
    await launchUrl(Uri.parse(url));
   // await launchUrl(Uri.parse('your-app-scheme://'));
  } else {
  }
}


  Container textt(BuildContext context, Precontroller contr , String s) {
    return Container(
                margin: const EdgeInsets.only(top: 10),
               height: 30,
               width: MediaQuery.of(context).size.width * 0.85,
               child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const SizedBox(width: 10,),
                  Icon(Icons.task_alt_sharp , color: contr.color,size: 23,),
                  const SizedBox(width: 10,),
                  Text(s ,
                  style: TextStyle(
                    fontSize: MediaQuery.of(context).size.width * 0.035,
                    color: const Color.fromARGB(255, 1, 49, 63),
                    fontWeight: FontWeight.bold,
                    fontFamily: Constans.fontFamily,
                  ),
                  )
                ],
               ),
              );
  }

  Container childbutton(
      String s, double height, double width, double hori, double font , bool isLoading) {
    return Container(
      alignment: Alignment.center,
      padding: EdgeInsets.symmetric(horizontal: hori, vertical: 8),
      height: height,
      width: width,
      child:isLoading==false? Text(
        s,
        style: TextStyle(
            fontFamily: Constans.fontFamily,
            fontSize: font,
            // fontWeight: FontWeight.bold,
            color: Colors.white),
      ):CircularProgressIndicator(
        color: Colors.white,
      ),
    );
  }
}
