import 'package:fitnessapp/constans.dart';
import 'package:fitnessapp/controller/datacont.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:ui' as ui;

class Articalpage extends StatelessWidget {
  final String title ;
  final String author ;
  final String img ;
  final String articall;
   Articalpage({super.key , required this.title , required this.img , required this.articall , required this.author});
  final controller = Get.put(Datacontroller() , permanent: true);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          background(context),
          shsh(),
          mainartical(context)
        ],
      ),
    );
  }

  Container mainartical(BuildContext context) {
    return Container(
          margin: EdgeInsets.only(
            left: MediaQuery.of(context).size.width*0.035,
            top: MediaQuery.of(context).size.width*0.088
          ),
          height: MediaQuery.of(context).size.height*0.9,
          width: MediaQuery.of(context).size.width*0.925,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(40),
            border: Border.all(
              width: 0.5,
              color: Colors.black45
            ),
            color: Colors.white,
          ),
          child: Stack(
            children: [
              Column(
                children: [
                   image(context),
                   Title(context),
                   authortime(context),
                   artical(context)
                ],
              ),
              Padding(padding: const EdgeInsets.only(top: 14.0 , left: 9),
              child: IconButton(onPressed: (){
              Get.back();},
             icon: const Icon(Icons.arrow_back ,size: 30 , color: Colors.black,)),
             )
            ],
          ),
        );
  }

  BackdropFilter shsh() {
    return BackdropFilter(
            filter: ui.ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
            child: Container(
              color: Colors.black.withOpacity(0),
            ),
          );
  }

  Opacity background(BuildContext context) {
    return Opacity(
          opacity: 0.8,
          child: SizedBox(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: Image.network("http://${controller.ip}:8000/uploads/$img", fit: BoxFit.cover,),
          ),
        );
  }


  Widget artical(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height*0.52,
      child: Scrollbar(
          thickness: 6.0, 
          radius: const Radius.circular(10),
        child: SingleChildScrollView(
          child: Padding(
                    padding: const EdgeInsets.only(left: 20 , right:  30 , top: 10),
                    child: Text(articall,
                    style: TextStyle(
                    fontSize: MediaQuery.of(context).size.width * 0.044,
                    color: const Color.fromARGB(255, 34, 33, 33), 
                    fontWeight: FontWeight.w300 ,
                    fontFamily: "WorkSans",
                    ),),
                    ),
        ),
      ),
    );
  }

  Container authortime(BuildContext context) {
    return Container(
              padding: const EdgeInsets.only(left: 25),
              height: MediaQuery.of(context).size.height*0.05,
             width: MediaQuery.of(context).size.width,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height*0.05,
                    width: MediaQuery.of(context).size.width*0.4,
                    child: Row(
                      children: [
                        const Icon(Icons.person , size: 25 , color:Colors.black,),
                        const SizedBox(width: 7,),
                        Text(author, style: TextStyle(
                        fontSize: MediaQuery.of(context).size.width * 0.04,
                        color: const Color.fromARGB(255, 9, 133, 139),
                        fontWeight: FontWeight.w400 ,
                        fontFamily: "WorkSans",
                      ),),
                      ],
                    )
                    
                  ),
                   Container(
                    alignment: Alignment.centerLeft,
                    padding: const EdgeInsets.only(left: 20),
                    height: MediaQuery.of(context).size.height*0.05,
                    width: MediaQuery.of(context).size.width*0.4,
                    child: Row(
                      children: [
                        const Icon(Icons.date_range , size: 25 , color:Colors.black,),
                        const SizedBox(width: 7,),
                        Text("23 jan 2023 ", style: TextStyle(
                        fontSize: MediaQuery.of(context).size.width * 0.04,
                        color: const Color.fromARGB(255, 9, 133, 139),
                        fontWeight: FontWeight.w400 ,
                        fontFamily: "WorkSans",
                      ),),
                      ],
                    )
                    
                  )
                ],
              ),
             );
  }

  // ignore: non_constant_identifier_names
  Container Title(BuildContext context) {
    return Container(
              margin: const EdgeInsets.only(top: 10 , left: 10),
              height: MediaQuery.of(context).size.height*0.045,
              width: MediaQuery.of(context).size.width,
              child: Text(title , style: TextStyle(
                fontSize: MediaQuery.of(context).size.width * 0.05,
                wordSpacing: 3,
                letterSpacing: 0.4,
                color: Colors.black, 
                fontWeight: FontWeight.bold ,
                fontFamily: "WorkSans",
              ),),
             );
  }

  Container image(BuildContext context) {
    return Container(
              height: MediaQuery.of(context).size.height*/* 0.29 */0.26,
             /*  width: MediaQuery.of(context).size.width, */
             width: MediaQuery.of(context).size.width*0.925,
              decoration: const BoxDecoration(
                 borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(40),
                  topRight: Radius.circular(40),
                  bottomRight: Radius.circular(100)
                 )
              ),
              child: ClipRRect(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(40),
                  topRight: Radius.circular(40),
                  bottomRight: Radius.circular(100)
                ),
                child: Image.network("http://${Constans.host}:8000/uploads/$img", fit: BoxFit.cover,),)
             );
  }
}