import 'dart:async';
import 'package:fitnessapp/constans.dart';
import 'package:fitnessapp/controller/precontroller.dart';
import 'package:fitnessapp/main.dart';
import 'package:fitnessapp/shimmer/shimmergym.dart';
import 'package:fitnessapp/views/data_page/backgr.dart';
import 'package:fitnessapp/views/gym_pre/dealogcoach.dart';
import 'package:fitnessapp/views/gym_pre/picks.dart';
import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:get/get.dart';

class Pre extends StatefulWidget {
  Pre({super.key});

  @override
  State<Pre> createState() => _PreState();
}

class _PreState extends State<Pre> {
  final controller = Get.put(Precontroller(), permanent: true);
  bool isloading = false;

  @override
  void initState() {
    setState(() {
      isloading = true ;
    });
     Timer(const Duration(milliseconds: 0), () async{ 
       try{
         await controller.getallcoaches();
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
       setState(() {
       isloading = false ;
     });
     });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          const Opacity(
            opacity: 0.5,
            child: Back(),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: ListView(
              children: [top(context), pick(context), title(context),
              isloading==false? coach(): loadcoach()
              ],
            ),
          )
        ],
      ),
    );
  }

  GetBuilder<Precontroller> coach() {
    return GetBuilder<Precontroller>(
      init: Precontroller(),
      builder: (control) => ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: control.coaches.length,
          itemBuilder: (context, index) => Padding(
                padding: const EdgeInsets.only(bottom: 10, left: 15, right: 15),
                child: Card(
                  elevation: 10,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30)),
                  child: Theme(
                    data: ThemeData(
                        splashColor: Colors.transparent,
                        cardColor: Colors.white,
                        canvasColor: Colors.white),
                    child: Stack(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(30)),
                          child: ExpansionTile(
                            onExpansionChanged: (value) {
                              control.checkexpand(value, index);
                            },
                            expansionAnimationStyle: AnimationStyle(
                                duration: const Duration(milliseconds: 600)),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30)),
                            initiallyExpanded: false,
                            trailing: Container(
                              width: 1,
                              color: Colors.white,
                            ),
                            title: Row(
                              children: [
                                Container(
                                  alignment: Alignment.center,
                                  padding: const EdgeInsets.only(left: 0),
                                  height: 100,
                                  width:
                                      MediaQuery.of(context).size.width * 0.23,
                                  decoration: const BoxDecoration(
                                    borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(30),
                                        bottomLeft: Radius.circular(30)),
                                    color: Colors.white,
                                  ),
                                  child: SizedBox(
                                    height: 90,
                                    width: MediaQuery.of(context).size.width *
                                        0.24,
                                    child: ClipRRect(
                                      borderRadius: const BorderRadius.all(
                                          Radius.circular(50)),
                                      child: Image.network(
                                        "http://${Constans.host}:8000/uploads/${control.coaches[index].image!}",
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                ),
                                Container(
                                    height: 100,
                                    alignment: Alignment.topLeft,
                                    width: MediaQuery.of(context).size.width *
                                        0.46,
                                    color: Colors.white,
                                    child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                top: 0, left: 15),
                                            child: Text(
                                              control.coaches[index].name!,
                                              style: TextStyle(
                                                fontSize: MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    0.045,
                                                color: Colors.black,
                                                fontWeight: FontWeight.bold,
                                                fontFamily: "WorkSans",
                                              ),
                                            ),
                                          ),
                                          Container(
                                              width: double.infinity,
                                              margin: const EdgeInsets.only(
                                                  left: 15),
                                              height: 65,
                                              child: Stack(children: [
                                                AnimatedOpacity(
                                                    duration: const Duration(
                                                        seconds: 1),
                                                    opacity: control
                                                        .opcitydes(index),
                                                    child: Text(
                                                        control.coaches[index].des!,
                                                        style: TextStyle(
                                                            fontSize: MediaQuery.of(
                                                                        context)
                                                                    .size
                                                                    .width *
                                                                0.03,
                                                            color:
                                                                /* Colors.black54 */control.color,
                                                            fontFamily:
                                                                "WorkSans"))),
                                                AnimatedOpacity(
                                                    duration: const Duration(
                                                        seconds: 1),
                                                    opacity: control
                                                        .opcitybio(index),
                                                    child: Text(
                                                        control.coaches[index].bio!,
                                                        style: TextStyle(
                                                            fontSize: MediaQuery.of(
                                                                        context)
                                                                    .size
                                                                    .width *
                                                                0.03,
                                                            color:
                                                                Colors.black54,
                                                            fontFamily:
                                                                "WorkSans")))
                                              ]))
                                        ])),
                              ],
                            ),
                            children: [
                              SizedBox(
                                height: 60,
                                width: MediaQuery.of(context).size.width,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    SizedBox(
                                      height: 40,
                                      width: 70,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        children: [
                                          Icon(
                                            Icons.badge_outlined,
                                            color: control.color,
                                          ),
                                          Text(
                                            control.coaches[index].age!,
                                            style: TextStyle(
                                              fontSize: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.035,
                                              color: Colors.black54,
                                              fontWeight: FontWeight.bold,
                                              fontFamily: "WorkSans",
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      height: 40,
                                      width: 70,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        children: [
                                          const Icon(
                                            Icons.star,
                                            color: Color.fromARGB(
                                                255, 221, 203, 35),
                                          ),
                                          Text(control.coaches[index].rate==null?"": double.parse(control.coaches[index].rate!).toStringAsFixed(1),
                                            style: TextStyle(
                                              fontSize: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.035,
                                              color: Colors.black54,
                                              fontWeight: FontWeight.bold,
                                              fontFamily: "WorkSans",
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      height: 40,
                                      width: 70,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        children: [
                                          Text(
                                            control.coaches[index].price!,
                                            style: TextStyle(
                                              fontSize: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.035,
                                              color: Colors.black54,
                                              fontWeight: FontWeight.bold,
                                              fontFamily: "WorkSans",
                                            ),
                                          ),
                                          Text(
                                            "\$",
                                            style: TextStyle(
                                              fontSize: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.035,
                                              color: control.color,
                                              fontWeight: FontWeight.bold,
                                              fontFamily: "WorkSans",
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                margin: const EdgeInsets.only(
                                    bottom: 15, right: 15),
                                height: 60,
                                width: MediaQuery.of(context).size.width,
                                decoration: const BoxDecoration(
                                    borderRadius: BorderRadius.only(
                                        bottomLeft: Radius.circular(30),
                                        bottomRight: Radius.circular(30))),
                                alignment: Alignment.bottomRight,
                                child: ElevatedButton(
                                    onPressed: () {
                                      control.chooseimage(control.coaches[index].image!);
                                      showDialog(
                                        context: context, builder: (context)=> Dealogcoach(coachid:  control.coaches[index].id,));
                                    },
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: control.color,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(30),
                                      ),
                                    ),
                                    child: childbutton(
                                        "Subscribe", 50, 110, 5, 18)),
                              )
                            ],
                          ),
                        ),
                        Positioned(
                            right: 15,
                            top: 8,
                            child: AnimatedOpacity(
                              duration: Duration(milliseconds: 500),
                              opacity: control.opcitybio(index),
                              child: SizedBox(
                                height: 30,
                                width: 45,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    const Icon(
                                      Icons.star,
                                      color: Color.fromARGB(255, 221, 203, 35),
                                      size: 20,
                                    ),
                                     Text(
                                    control.coaches[index].rate==null?"":double.parse(control.coaches[index].rate!).toStringAsFixed(1)
                                    // "4"
                                    ,
                                      style: TextStyle(
                                        fontSize:
                                            MediaQuery.of(context).size.width *
                                                0.032,
                                        color: Colors.black54,
                                        fontWeight: FontWeight.bold,
                                        fontFamily: "WorkSans",
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            )
                            )
                      ],
                    ),
                  ),
                ),
              )),
    );
  }

 Widget loadcoach(){
   return ListView.builder(
     primary: false,
     shrinkWrap: true,
    itemCount: 2,
    itemBuilder: (cont , ind)=> const Padding(
      padding:  EdgeInsets.only(bottom: 10, left: 15, right: 15),
      child: Shimmergym.Rectangle(height: 100, width: double.infinity, radius: 30),
      ));
 }


  Container title(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 20, top: 20),
      height: 50,
      width: MediaQuery.of(context).size.width,
      child: Text(
        "Available Coaches",
        style: TextStyle(
          fontSize: MediaQuery.of(context).size.width * 0.055,
          color: Colors.black,
          fontWeight: FontWeight.bold,
          fontFamily: "WorkSans",
        ),
      ),
    );
  }

  Container pick(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      margin: const EdgeInsets.only(top: 15),
      height: 300,
      width: MediaQuery.of(context).size.width,
      child: Stack(children: [
        RotationTransition(
          turns: const AlwaysStoppedAnimation(10.0 / 360),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(40),
              color: controller.color,
            ),
            height: 250,
            width: MediaQuery.of(context).size.width * 0.85,
          ),
        ),
        Stack(children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(40),
              color: Colors.black,
            ),
            height: 250,
            width: MediaQuery.of(context).size.width * 0.85,
            child: Opacity(
                opacity: 0.35,
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(40),
                    child: Image.asset(
                      "assets/images/picks.jpg",
                      fit: BoxFit.cover,
                    ))),
          ),
          Positioned(
              left: 15,
              top: 20,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.6,
                    child: Text(
                      "Picks For You",
                      style: TextStyle(
                        fontSize: MediaQuery.of(context).size.width * 0.05,
                        color: const Color.fromARGB(255, 99, 209, 243),
                        fontWeight: FontWeight.bold,
                        fontFamily: "WorkSans",
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 1,
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.65,
                    child: Text(
                      "Exercises with observance ${userInfo!.getString("illness")} pain",
                      style: TextStyle(
                        fontSize: MediaQuery.of(context).size.width * 0.045,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontFamily: "WorkSans",
                      ),
                    ),
                  ),
                ],
              )),
          Positioned(
              bottom: 20,
              left: 85,
              child: ElevatedButton(
                  onPressed: () {
                    Get.to(()=>Picks(image: "assets/images/picks.jpg", des: "These exercises are intended to help you cope with your illness and relieve the resulting pain. ",
                     title: "${userInfo!.getString("illness")} pain"));
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: controller.color,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  child: childbutton("Start", 50, 120, 20, 22)))
        ]),
      ]),
    );
  }

  Container childbutton(
      String s, double height, double width, double hori, double font) {
    return Container(
      alignment: Alignment.center,
      padding: EdgeInsets.symmetric(horizontal: hori, vertical: 8),
      height: height,
      width: width,
      child: Text(
        s,
        style: TextStyle(
            fontFamily: "WorkSans",
            fontSize: font,
            fontWeight: FontWeight.bold,
            color: Colors.white),
      ),
    );
  }

  Container top(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 5),
      height: 90,
      width: MediaQuery.of(context).size.width,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          InkWell(
               onTap: () => ZoomDrawer.of(context)!.toggle(),
              child: Container(
                  margin: const EdgeInsets.only(left: 1, top: 10),
                  height: 50,
                  width: MediaQuery.of(context).size.width * 0.15,
                  child: Image.asset(
                    "assets/images/apps.png",
                    fit: BoxFit.contain,
                  ))),
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.8,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 4),
                  child: Row(
                    children: [
                      Text(
                        "Welcom to",
                        style: TextStyle(
                          fontSize: MediaQuery.of(context).size.width * 0.057,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontFamily: "WorkSans",
                        ),
                      ),
                      Text(
                        " Premium",
                        style: TextStyle(
                          fontSize: MediaQuery.of(context).size.width * 0.057,
                          color: controller.color,
                          fontWeight: FontWeight.bold,
                          fontFamily: "WorkSans",
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 0, left: 5),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        "hope you an enjoyable sports trip",
                        style: TextStyle(
                            fontSize: MediaQuery.of(context).size.width * 0.032,
                            color: Colors.black45,
                            wordSpacing: 2,
                            letterSpacing: 0.8),
                      ),
                      Container(
                        height: 30,
                        width: 50,
                        child: Image.asset(
                          "assets/images/prete.png",
                          fit: BoxFit.contain,
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
