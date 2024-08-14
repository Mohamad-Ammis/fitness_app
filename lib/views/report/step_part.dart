import 'package:fitnessapp/constans.dart';
import 'package:fitnessapp/controller/reportcontroller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kdgaugeview/kdgaugeview.dart';
import 'package:pedometer/pedometer.dart';
import 'package:permission_handler/permission_handler.dart';

class StepCalculate extends StatefulWidget {
  const StepCalculate({super.key});

  @override
  State<StepCalculate> createState() => _StepCalculateState();
}

class _StepCalculateState extends State<StepCalculate> {
  final control = Get.put(Reportcontroller() , permanent: true);
    late Stream<StepCount> _stepCountStream;
  String _steps = "0" ;
  double ss = 80 ;

  @override
  void initState() {
    super.initState();
    requestPermissions();
  }

  void requestPermissions() async {
    PermissionStatus status = await Permission.activityRecognition.request();
    if (status.isGranted) {
      initPlatformState();
    } else {
      setState(() {
        _steps = 'Permission Denied';
      });
    }
  }

  void onStepCount(StepCount event) {
    print(event);
    setState(() {
      _steps = event.steps.toString();
      key.currentState?.updateSpeed(double.parse(_steps));
      });
       
  }

  void onStepCountError(error) {
    print('onStepCountError: $error');
    setState(() {
      _steps = 'Step Count not available';
    });
  }

  void initPlatformState() {
    try {
      _stepCountStream = Pedometer.stepCountStream;
      _stepCountStream.listen(onStepCount).onError(onStepCountError);
    } catch (e) {
      print('Error initializing pedometer: $e');
      setState(() {
        _steps = 'Step Count not available';
      });
    }

    if (!mounted) return;
  }
   bool isloading = false ;
  final key = GlobalKey<KdGaugeViewState>();
  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Container(
        height: MediaQuery.of(context).size.height*0.6,
        width: MediaQuery.of(context).size.width*0.9,
        color: Colors.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              margin:const EdgeInsets.only(top: 8),
              height: 80,
              width: 290,
              child:const Text("Please keep the page open while walking",
              style: TextStyle(
                fontFamily: Constans.fontFamily,
                fontSize: 19,
                color: Colors.black,
                fontWeight: FontWeight.bold
              ),
              textAlign: TextAlign.center,
              ),
            ),
             Container(
              width: 250,
              height: 240,
              padding:const EdgeInsets.only(top: 10,left: 10,right: 10),
              child: Stack(
                children: [
                  KdGaugeView(
                    key: key,
                    speedTextStyle: TextStyle(
                      fontFamily: Constans.fontFamily,
                      fontSize: 20,
                      color: Colors.black.withOpacity(0),
                      fontWeight: FontWeight.bold
                    ),
                    minMaxTextStyle:const TextStyle(
                      fontFamily: Constans.fontFamily,
                      fontSize: 10,
                      color: Colors.black
                    ),
                    unitOfMeasurementTextStyle:const TextStyle(
                      fontFamily: Constans.fontFamily,
                      fontSize: 20,
                      color: Colors.black,
                      fontWeight: FontWeight.bold
                    ),
                    minSpeed: 0,
                    maxSpeed: 1000,
                    speed:_steps=='Step Count not available'?0: double.parse(_steps),
                    animate: true,
                    duration:const Duration(seconds: 4),
                    alertSpeedArray:const [0, 600],
                    alertColorArray:const [Color(0xff6AD4DD),Color(0xff7AA2E3)],
                   unitOfMeasurement: "",
                   innerCirclePadding: 25.0,
                    gaugeWidth: 10,
                    fractionDigits: 0,
                  ),
                  disgenstep()
                ],
              ),
            ),
            info(context),
             Container(
                  margin: const EdgeInsets.only(top: 0, right: 0, bottom: 0),
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
                           /*  setState(() {
                              key.currentState?.updateSpeed(ss+=10 );
                            }); */
                            Get.back();
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor:const Color(0xff6AD4DD),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30),
                            ),
                          ),
                          child: childbutton(" Cancel ", 50, 75, 0, 16)),
                        const  Spacer(),
                           ElevatedButton(
                      onPressed: () async{
                        try{
                          setState(() {
                            isloading = true ;
                          });
                          await control.setsteps(_steps);
                          Navigator.of(context).pop(_steps);
                        }catch(error){
                          print(error);
                        }
                        isloading = false ;
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor:const Color(0xff6AD4DD),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                      child: childbutton("Confirm ", 50, 75, 0, 16)),
                    const  Spacer(),
                    ],
                  ),
                )
          ],
        ),
      ),
    );
  }

  SizedBox info(BuildContext context) {
    return SizedBox(
            height: 80,
            width: MediaQuery.of(context).size.width*0.9,
            child: Row(
              children: [
               const Spacer(),
                dd("Cal Burned","cal",_steps == 'Step Count not available'?0:double.parse(_steps)),
               const Spacer(),
                Container(
                  margin:const EdgeInsets.only(bottom: 10),
                  height: 40,
                  width: 1,
                  color:const Color(0xffADAEB0),
                ),
               const Spacer(),
                dd("Daily Goal","Step",1000),
               const Spacer()
              ],
            ),
          );
  }

  Column dd(String title , String unit , double num) {
    return Column(
                  children: [
                    Text(title, style:const TextStyle(
                      fontFamily: Constans.fontFamily,
                      fontSize: 17,
                      color: Color.fromARGB(255, 126, 128, 130)
                    ),),
                    Row(
                      children: [
                        Text("${num.toInt()}", style:const TextStyle(
                      fontFamily: Constans.fontFamily,
                      fontSize: 17,
                      color: Colors.black,
                      fontWeight: FontWeight.bold
                    ),),
                    Text(unit, style:const TextStyle(
                      fontFamily: Constans.fontFamily,
                      fontSize: 14,
                      color: Color.fromARGB(255, 126, 128, 130)
                    ),),
                      ],
                    ),
                  ],
                );
  }

 Container childbutton(
      String s, double height, double width, double hori, double font) {
    return Container(
      alignment: Alignment.center,
      padding: EdgeInsets.symmetric(horizontal: hori, vertical: 8),
      height: height,
      width: width,
      child:isloading==true? CircularProgressIndicator(
        color: Colors.white,
      ):Text(
        s,
        style: TextStyle(
            fontFamily: Constans.fontFamily,
            fontSize: font,
            color: Colors.white),
      ),
    );
  }


  Positioned disgenstep() {
    return _steps != 'Step Count not available'? Positioned(
                  bottom: 50,
                  left: 66,
                  child: SizedBox(
                    height: 140,
                    width: 100,
                    child: Column(
                      children: [
                        Container(
                          margin:const EdgeInsets.only(top: 12),
                          height: 60,
                          width: 100,
                          child: Image.asset("assets/images/step4.png",fit: BoxFit.contain,),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 13),
                          child: Text(_steps,style:const TextStyle(
                            fontFamily: Constans.fontFamily,
                            fontSize: 22,
                            color: Color(0xff2CA2E1),
                            fontWeight: FontWeight.bold
                          ),),
                        ),
                      ],
                    )
                  )):const Positioned(
                    bottom: 20,
                    left: 60,
                    child:SizedBox(
                      height: 140,
                      width: 130,
                      child: Text("Sorry , Step Count not available", style: TextStyle(
                        fontSize: 19,
                        color: Colors.black,
                        fontFamily: Constans.fontFamily,
                        fontWeight: FontWeight.bold
                      ),),
                    ),);
  }
}