import 'package:fitnessapp/constans.dart';
import 'package:fitnessapp/controller/precontroller.dart';
import 'package:fitnessapp/controller/ratecontroller.dart';
import 'package:fitnessapp/controller/spec_day_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';

class Ratedialg extends StatefulWidget {
  const Ratedialg({super.key});

  @override
  State<Ratedialg> createState() => _RatedialgState();
}

class _RatedialgState extends State<Ratedialg> {
  final controller = Get.put(Precontroller(), permanent: true);
  final control = Get.put(SpecDay(), permanent: true);
  final ratecontrol = Get.put(Ratecontroller(), permanent: true);

  bool isloading = false;

  double rate = 0;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
      child: Container(
        height: 400,
        width: MediaQuery.of(context).size.width * 0.85,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30), color: Colors.white),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.only(top: 15),
              height: 80,
              width: MediaQuery.of(context).size.width * 0.85,
              alignment: Alignment.center,
              child: Image.asset(
                "assets/images/star.png",
                fit: BoxFit.contain,
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width * 0.85,
              alignment: Alignment.center,
              margin: EdgeInsets.only(top: 15, left: 15, right: 15),
              child: Text(
                "We are working hard for a better user experience.",
                style: TextStyle(
                  fontSize: MediaQuery.of(context).size.width * 0.04,
                  color: Colors.black,
                  fontFamily: Constans.fontFamily,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width * 0.85,
              alignment: Alignment.center,
              margin: EdgeInsets.only(top: 0, left: 15, right: 15),
              child: Text(
                "We'd greatly appreciate if you can rate us .",
                style: TextStyle(
                  fontSize: MediaQuery.of(context).size.width * 0.04,
                  color: Colors.black,
                  fontFamily: Constans.fontFamily,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 10),
              height: 70,
              alignment: Alignment.center,
              width: MediaQuery.of(context).size.width * 0.85,
              // color: Colors.amber,
              child: customIconRate(),
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 15),
              height: 60,
              width: MediaQuery.of(context).size.width,
              alignment: Alignment.center,
              child: ElevatedButton(
                  onPressed: () async {
                    try {setState(() {
                      isloading = true ;
                    });
                      await ratecontrol.setrate(rate);
                      controller.rating(rate, control.coachid);
                      Navigator.of(context).pop();
                    } catch (error) {
                      setState(() {
                        isloading = false ;
                      });
                      showDialog(
                          context: context,
                          builder: (ctxx) => AlertDialog(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(40)),
                                title: const Text(
                                  'Warning',
                                  style: TextStyle(
                                      color: Color.fromARGB(255, 252, 93, 93),
                                      fontSize: 25),
                                  textAlign: TextAlign.center,
                                ),
                                content: Text(error.toString()),
                              ));
                    }
                    
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color.fromARGB(255, 255, 204, 52),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  child: childbutton("RATE", 50, 110, 5, 18)),
            )
          ],
        ),
      ),
    );
  }

  customIconRate() {
    return RatingBar.builder(
      initialRating: 0,
      itemCount: 5,
      itemPadding: const EdgeInsets.symmetric(horizontal: 5),
      itemBuilder: ((context, index) {
        switch (index) {
          case 0:
            return const Icon(
              Icons.sentiment_very_dissatisfied,
              color: Colors.redAccent,
            );
          case 1:
            return const Icon(
              Icons.sentiment_dissatisfied,
              color: Colors.redAccent,
            );
          case 2:
            return const Icon(
              Icons.sentiment_neutral,
              color: Colors.amber,
            );
          case 3:
            return const Icon(
              Icons.sentiment_satisfied,
              color: Colors.lightGreen,
            );
          case 4:
            return const Icon(
              Icons.sentiment_very_satisfied,
              color: Colors.green,
            );
          default:
            return const Icon(Icons.sentiment_neutral);
        }
      }),
      onRatingUpdate: (rating) {
        rate = rating;
      },
    );
  }

  Container childbutton(
      String s, double height, double width, double hori, double font) {
    return  Container(
      alignment: Alignment.center,
      padding: EdgeInsets.symmetric(horizontal: hori, vertical: 8),
      height: height,
      width: width,
      child:isloading == false? Text(
        s,
        style: TextStyle(
            fontFamily: Constans.fontFamily,
            fontSize: font,
            // fontWeight: FontWeight.bold,
            color: Colors.white),
      ):const CircularProgressIndicator(color: Colors.white,),
    );
  }
}
