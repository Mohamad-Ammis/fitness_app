import 'dart:async';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:fitnessapp/constans.dart';
import 'package:fitnessapp/controller/datacont.dart';
import 'package:fitnessapp/controller/exercontrol.dart';
import 'package:fitnessapp/shimmer/shimmergym.dart';
import 'package:fitnessapp/views/exercises_playing_page/playing_exercise.dart';
import 'package:fitnessapp/views/workout_page/widgets/customsliver.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class Exercise extends StatefulWidget {
  String image;
  String title;
  String des ;
  String id ;
  String? level;
  Exercise({super.key , required this.image , required this.title , required this.des,required this.id , required this.level});

  @override
  State<Exercise> createState() => _ExerciseState();
}

class _ExerciseState extends State<Exercise> {
  
  bool test = false;
  bool isloading = false ;
  final control = Get.put(Exercontroller() , permanent: true);
  final datacont = Get.put(Datacontroller() , permanent: true);
  @override
  void initState() {
     setState(() {
        isloading = true;
      });
      Timer(const Duration(milliseconds: 0), () async{ 
       try{
        if(control.random == false){
          control.gender();
         await control.getexer(widget.id , widget.level);
        }else{
          print("from random");
          await control.getexrciserandom(widget.id);
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
      setState(() {
        isloading = false;
      });
      });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height*0.89,
              child: sliver_appbar(context),
            ),
            button(context)
          ],
        ),
      )
    );
  }

  // ignore: non_constant_identifier_names
  CustomScrollView sliver_appbar(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverPersistentHeader(
          pinned: true,
          delegate:CustomSliverAppbarDelegate(expandedHeight: MediaQuery.of(context).size.height*0.37, img: widget.image , title: widget.title , des: widget.des , picks: false)),
       SliverToBoxAdapter(
        child: Padding(
          padding: const EdgeInsets.only(top: 0),
          child:!isloading? ListView(
            primary: false,
            shrinkWrap: true,
            children: [
             ...control.exercise.map((item) => allexer(context, item)),
            ],
          ):ListView.builder(
            itemCount: 4,
            primary: false,
            shrinkWrap: true,
            itemBuilder: (cont  , ind)=>loadallexer(context)),
        )
       ),
      ],
    );
  }

  Container button(BuildContext context) {
    final controller =Get.put(Exercontroller());
    return Container(
               height: MediaQuery.of(context).size.height*0.11,
               alignment: Alignment.topCenter,
               padding: const EdgeInsets.only(top: 10),
               child: ElevatedButton(onPressed: (){
                //control.all_exer
                debugPrint(controller.all_exer.toString());
                 Get.to(const PlayingExercises());
               },
               style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 38, 164, 170),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),),
                child: Container(
                  alignment: Alignment.center,
                  padding:const EdgeInsets.symmetric(horizontal: 20 , vertical: 8),
                  height: 60,
                  width: 250,
                  child: const Text("start" , style:  TextStyle(
                    fontFamily: Constans.fontFamily,
                    fontSize: 25 ,
                    fontWeight: FontWeight.w600 ,
                    color: Colors.white
                  ),),
                 )),
              );
  }

  Column allexer(BuildContext context, item) {
    return Column(
              children: [
                Container(
                  margin: const EdgeInsets.only(top: 0 , bottom: 5 , left: 15 , right: 15),
                  height: MediaQuery.of(context).size.height*0.1,
                  width: MediaQuery.of(context).size.width,
                 // color: Colors.amber,
                  child: Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.only(top: 4 , ),
                        width: MediaQuery.of(context).size.width*0.35,
                        height: MediaQuery.of(context).size.height*0.1,
                      //  color: Colors.pink,
                        child:CachedNetworkImage(imageUrl:"${Constans.mainbaseUrlimage}uploads/${item["gif"]}", fit: BoxFit.contain,)
                      ),
                      Expanded(child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            height: MediaQuery.of(context).size.height*0.07,
                          //  color: Colors.black,
                            alignment: Alignment.centerLeft,
                            child: Text(item["exercise_name"] , style: const TextStyle(
                              fontFamily: Constans.fontFamily,
                              fontSize: 19,
                              color: Colors.black
                            ),),
                          ),
                          Text("00:${item["time"]}" , style: const TextStyle(
                            fontFamily: Constans.fontFamily,
                            fontSize: 16,
                            color: Colors.black54
                          ),)
                        ],
                      ))
                    ],
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: const Divider())
              ],
             );
  }

  Column loadallexer(BuildContext context) {
    return Column(
              children: [
                Container(
                  margin: const EdgeInsets.only(top: 0 , bottom: 5 , left: 15 , right: 15),
                  height: MediaQuery.of(context).size.height*0.1,
                  width: MediaQuery.of(context).size.width,
                  child: Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.only(top: 4 ,left: 16,right: 16 ),
                        width: MediaQuery.of(context).size.width*0.35,
                        height: MediaQuery.of(context).size.height*0.1,
                        child: Shimmergym.Rectangle(height: MediaQuery.of(context).size.height*0.1,
                        cc: Colors.grey[300],
                         width:MediaQuery.of(context).size.width*0.25,
                        radius: 30),
                      ),
                      Expanded(child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            height: MediaQuery.of(context).size.height*0.07,
                            alignment: Alignment.centerLeft,
                            child: Shimmergym.Rectangle(height:  MediaQuery.of(context).size.height*0.04,
                            cc: Colors.grey[300],
                             width: 190,
                            radius: 10)
                          ),
                          Shimmergym.Rectangle(
                            height: MediaQuery.of(context).size.height*0.03,
                            cc: Colors.grey[300],
                            width: 60,
                            radius: 10)
                          
                        ],
                      ))
                    ],
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: const Divider())
              ],
             );
  }


}

