import 'package:fitnessapp/constans.dart';
import 'package:fitnessapp/models/artical.dart';
import 'package:fitnessapp/models/category.dart';
import 'package:fitnessapp/models/ranex.dart';
import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
//import 'package:get/get.dart';
import 'package:carousel_slider/carousel_slider.dart';

// ignore: must_be_immutable, camel_case_types
class Home_gym extends StatelessWidget {
  Home_gym({super.key});

  List<Artical> articals = <Artical>[
     Artical(
      title: "Sports and depression",
      img: "assets/images/sadd.jpg",
    ),
    Artical(
      title: "Benefits of Yoga",
      img: "assets/images/yogaa.jpg",
    ),
    Artical(
      title: "Sports and permanent youth",
      img: "assets/images/oldman.jpg",
    ),
    Artical(
      title: "Apples and ideal weight",
      img: "assets/images/appe.jpg",
    ),
  ];

  List<Categ> cat = <Categ>[
    Categ(
        title: "Strength",
        image: "assets/images/strb.png",),
    Categ(
        title: "Cardio",
        image: "assets/images/carb.png",),
    Categ(
        title: "Warmup",
        image: "assets/images/wbb.png",),
    Categ(
        title: "Yoga",
        image: "assets/images/yogb.png",),
  ];

  List<Randomex> ran = <Randomex>[
    Randomex(title: "on the bed", des: "can help build strength, endurance, and balance in different parts of body", img: "assets/images/bed.jpg"),
    Randomex(title: "Kids Yoga", des: "It is a fun activities for a kids, offering a blend of yoga, mindfulness, and relaxation", img: "assets/images/kids.jpg"),
    Randomex(title: "Sun salute ", des:"It is a yoga exercise that involves a sequence of poses Outdoors", img: "assets/images/sun.jpg"),
    Randomex(title: "in the office", des: "Physical activities that help you stay fit and active while working", img: "assets/images/office.jpg"),
    Randomex(title: "De-stress time", des: "To get rid of stress and get rest and relaxation", img: "assets/images/stress.jpg"),
    Randomex(title: "prolong sleep", des: "Some easy and effective exercisees to promote better sleep", img: "assets/images/sleep.jpg"),
    Randomex(title: "Facial exercises", des: "It can help tone and strengthen the muscles in your face", img:"assets/images/faical.jpg"),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
        color:const Color(0xFFF3F4F6),
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: ListView(
          children: [
            top(context),
            catside(context),
            const SizedBox(
              height: 9,
            ),
            articalside(context),
            titleside(context, "Random Exercises"),
            const SizedBox(
              height: 5,
            ),
            randomexercise(context),
          ],
        ),
      );
  }

  
  Container catside(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 12),
      height: MediaQuery.of(context).size.height * /* 0.155 */0.13,
      width: MediaQuery.of(context).size.width,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: cat
            .map((item) => SizedBox(
                  height: MediaQuery.of(context).size.height * 0.12,
                  width: MediaQuery.of(context).size.width * 0.2,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        padding:const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                        margin:const EdgeInsets.only(bottom: 6),
                        height: MediaQuery.of(context).size.height * 0.09,
                        width: MediaQuery.of(context).size.width * 0.18,
                        decoration: BoxDecoration(
                            
                            color:Constans.test,
                            borderRadius: BorderRadius.circular(18)),
                        child: Image.asset(
                          item.image,
                          fit: BoxFit.contain,
                        ),
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            item.title,
                            style: TextStyle(
                                fontSize:
                                    MediaQuery.of(context).size.width * 0.027,
                                color: Colors.black,
                                fontFamily: "WorkSans",
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      )
                    ],
                  ),
                ))
            .toList(),
      ),
    );
  }

  Widget top(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.085,
      width: MediaQuery.of(context).size.width,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          InkWell(
            onTap: () => ZoomDrawer.of(context)!.toggle(),
            child: Container(
                margin: const EdgeInsets.only(left: 5),
                height: MediaQuery.of(context).size.height * 0.05,
                width: MediaQuery.of(context).size.width * 0.11,
                child: Image.asset(
                  "assets/images/apps.png",
                  fit: BoxFit.contain,
                )),
          ),
          Expanded(
              child: Container(
            margin: const EdgeInsets.only(left: 15),
            height: MediaQuery.of(context).size.width * 0.4,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
               const Spacer(),
                Text(
                  "Hi,Areej!",
                  style: TextStyle(
                    fontSize: MediaQuery.of(context).size.width * 0.06,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontFamily: "WorkSans",
                  ),
                ),
                Text(
                  "Stay Fit and Healthy",
                  style: TextStyle(
                      fontSize: MediaQuery.of(context).size.width * 0.025,
                      color: Colors.black38,
                      wordSpacing: 2,
                      letterSpacing: 0.8),
                ), 
                const Spacer(),
              ],
            ),
          )),
          Container(
            margin: const EdgeInsets.only(right: 10),
            height: MediaQuery.of(context).size.height * 0.07,
            width: MediaQuery.of(context).size.width * 0.14,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(50),
              child: Image.asset(
                "assets/images/areej.jpg",
                fit: BoxFit.cover,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Container titleside(BuildContext context, String title) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.07,
      width: MediaQuery.of(context).size.width,
      padding: const EdgeInsets.only(left: 10),
      alignment: Alignment.centerLeft,
      child: Row(
        children: [
          Text(
            title,
            style: TextStyle(
              wordSpacing: 1,
              letterSpacing: 0.7,
                fontSize: MediaQuery.of(context).size.width * 0.06,
                color:Colors.black,
                fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }

  SizedBox articalside(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.29,
      width: MediaQuery.of(context).size.width,
      child: CarouselSlider(
          items: articals.map((item) {
            return Stack(
              children: [
                Card(
                  shadowColor: Colors.black,
                  elevation: 7,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30)),
                  child: Container(
                      height: MediaQuery.of(context).size.height * 0.27,
                      decoration: BoxDecoration(
                          border: Border.all(
                              width: 0.5,
                              color: Constans.test.withOpacity(0.5)),
                          borderRadius: BorderRadius.circular(30)),
                      width: double.infinity,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(30),
                        child: Image.asset(
                          item.img,
                          fit: BoxFit.cover,
                        ),
                      )),
                ),
                Positioned(
                  bottom: 20,
                  left: 4,
                  child: Container(
                    alignment: Alignment.center,
                    height: MediaQuery.of(context).size.height * 0.08,
                    width: MediaQuery.of(context).size.width * 0.72,
                    decoration: const BoxDecoration(
                        color: Colors.black45,
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(10),
                          bottomRight: Radius.circular(30),
                          topRight: Radius.circular(30),
                        )),
                    child: Text(
                      textAlign: TextAlign.center,
                      item.title,
                      style:  TextStyle(fontSize: MediaQuery.of(context).size.width*0.045, color: Colors.white),
                      softWrap: true,
                      overflow: TextOverflow.fade,
                    ),
                  ),
                )
              ],
            );
          }).toList(),
          options: CarouselOptions(
            /*  autoPlay: true,
          autoPlayInterval: Duration(seconds: 5), */
            height: MediaQuery.of(context).size.height * 0.27,
            initialPage: 0,
            enlargeCenterPage: true,
            /* onPageChanged: (ind, _) {
            setState(() {
              index = ind;
            });
          }, */
          )),
    );
  }

 ListView randomexercise(BuildContext context) {
    return ListView(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            children: ran.map((item) => Card(
              color: Colors.white,
              margin:const EdgeInsets.only(bottom: 14 , left: 14 , right: 14) ,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15)
              ),
              elevation: 3,
              child: Row(
                  verticalDirection: VerticalDirection.up,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                   ClipRRect(
                      borderRadius:const BorderRadius.only(
                        topLeft: Radius.circular(15),
                        bottomLeft: Radius.circular(15)
                      ),child: SizedBox(
                        height:MediaQuery.of(context).size.height*0.128 ,
                        width:MediaQuery.of(context).size.width*0.35 ,
                        child: Image.asset(item.img , fit: BoxFit.cover,),
                      ),
                     ),
                     Container(
                      color:Colors.white.withOpacity(0.8),
                      height: MediaQuery.of(context).size.height*0.128,
                      width: MediaQuery.of(context).size.width*0.455,
                      padding: const EdgeInsets.only(left: 10 , top: 3),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(item.title ,style: TextStyle(
                        fontSize: MediaQuery.of(context).size.width * 0.05,
                        color: Colors.black, 
                        fontWeight: FontWeight.bold,
                        fontFamily: "WorkSans",
                      ) ),
                      Container(
                        height: MediaQuery.of(context).size.height*0.075,
                        width: MediaQuery.of(context).size.width*0.45,
                        padding: const EdgeInsets.only(left: 2 , top: 2),
                        child:  Text(item.des ,
                       textAlign: TextAlign.left,
                       style: TextStyle(
                        fontSize: MediaQuery.of(context).size.width * 0.0253,
                        color: Colors.black54, 
                        fontFamily: "WorkSans",
                      ),)
                      )
                        ],
                      ),
                     ),
                     Expanded(
                       child: Container(
                        decoration: BoxDecoration(
                           color: Colors.white.withOpacity(0.8),
                          borderRadius: const BorderRadius.only(
                            topRight: Radius.circular(15),
                            bottomRight: Radius.circular(15)
                          )
                        ),
                         height: MediaQuery.of(context).size.height*0.128,
                        alignment: Alignment.center,
                        padding: const EdgeInsets.only(left: 10),
                        child: Container(
                          width: MediaQuery.of(context).size.width*0.08,
                          height: MediaQuery.of(context).size.height*0.035,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                          ),
                          alignment: Alignment.center,
                          child: Icon(Icons.arrow_forward_ios_rounded , size: 15, color: Constans.test,),
                        ),
                       ),
                     )
                      ],
                ),
            )).toList(),
          );
  }

}
