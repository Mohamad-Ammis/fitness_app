import 'dart:async';
import 'dart:convert';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:fitnessapp/constans.dart';
import 'package:fitnessapp/controller/datacont.dart';
import 'package:fitnessapp/controller/exercontrol.dart';
import 'package:fitnessapp/controller/gymcon.dart';
import 'package:fitnessapp/main.dart';
import 'package:fitnessapp/shimmer/shimmergym.dart';
import 'package:fitnessapp/views/workout_page/artical.dart';
import 'package:fitnessapp/views/workout_page/exer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable, camel_case_types
class Home_gym extends StatefulWidget {
  const Home_gym({super.key});

  @override
  State<Home_gym> createState() => _Home_gymState();
}

// ignore: camel_case_types
class _Home_gymState extends State<Home_gym> {
//final controller = Get.put(Datacontroller() , permanent: true);

final control = Get.put(Gymcontroller() , permanent: true);
final datacont = Get.put(Datacontroller(),permanent: true);
final execontrol = Get.put(Exercontroller() , permanent: true);
 bool isloading = false ;
 @override
  void initState() {
    if(control.load==false){
       setState(() {
        isloading = true;
      });
      Timer(const Duration(milliseconds: 0), () async{ 
       try{
      await control.getCat();
      await control.getartical();
      await control.getrandomexercise();
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
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        color:const Color(0xFFF3F4F6),
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: ListView(
          children: [
            top(context),
            isloading? loadcat(context):catside(context),
            const SizedBox(
              height: 9,
            ),
             isloading? loadartical(context):articalside(context),
            titleside(context, "Random Exercises"),
            const SizedBox(
              height: 5,
            ),
            isloading? loadexr(context):randomexercise(context),
          ],
        )
      );
  }

  Container catside(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 12 , left: 10),
      height: MediaQuery.of(context).size.height * 0.13,
      width: MediaQuery.of(context).size.width,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: control.category.map((item) => Container(
                margin: const EdgeInsets.only(right: 12),
                    height: MediaQuery.of(context).size.height * 0.12,
                    width: MediaQuery.of(context).size.width * 0.2,
                    child: InkWell(
                      onTap: (){
                       Get.to(Exercise(image:userInfo!.getInt("man")==2? item["women_image"]:item["men_image"],
                        title: item["category_name"], des: item["description"],
                        id: item["id"].toString(),
                        level:null
                        )
                        );
                      },
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
                            child:CachedNetworkImage(imageUrl:"${Constans.mainbaseUrlimage}uploads/${item["image"]}",
                              fit: BoxFit.contain,)),
                          Container(
                            alignment: Alignment.center,
                            child: 
                              Text(
                                item["category_name"],
                                style: TextStyle(
                                    fontSize:
                                        MediaQuery.of(context).size.width * 0.027,
                                    color: Colors.black,
                                    fontFamily: Constans.fontFamily,
                                    fontWeight: FontWeight.bold),
                              ),
                            
                          )
                        ],
                      ),
                    ),
                  ))
              .toList(),
        ),
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
                  "Hi,${userInfo!.getString("name")}!",
                  style: TextStyle(
                    fontSize: MediaQuery.of(context).size.width * 0.06,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontFamily: Constans.fontFamily,
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
              child: datacont.base64String==null? Image.asset(
                  "assets/images/pers.png",
                  fit: BoxFit.cover,
                ):Image.memory(base64Decode(datacont.base64String!), fit: BoxFit.cover,)
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
              fontFamily: Constans.fontFamily,
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
          items:control.articals.map((item) {
            return Stack(
              children: [
                Card(
                  shadowColor: Colors.black,
                  elevation: 7,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30)),
                  child: InkWell(
                    onTap: (){
                      Get.to(Articalpage(title: item["title"], img:item["image"], articall:item["Article"], author:item["Author_Name"]));
                    },
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
                          child:item["image"]!=null?CachedNetworkImage(imageUrl:"${Constans.mainbaseUrlimage}uploads/${item["image"]}",
                            fit: BoxFit.cover,)
                         :Image.asset("assets/images/yogaa.jpg",
                          fit: BoxFit.cover,),
                        )),
                  ),
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
                      item["title"].toString(),
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
            
             autoPlay: true,
          autoPlayInterval: Duration(seconds: 3),
            height: MediaQuery.of(context).size.height * 0.27,
            initialPage: 0,
            enlargeCenterPage: true,
          )),
    );
  }

 ListView randomexercise(BuildContext context) {
    return ListView(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            children: control.randomexercise.map((item) => InkWell(
              onTap: (){
                execontrol.fromrandom();
                Get.to(Exercise(
                  image: item.img, title: item.title, des: item.des, id: item.id, level: null));
              },
              child: Card(
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
                          child:CachedNetworkImage(imageUrl:"${Constans.mainbaseUrlimage}uploads/${item.img}", fit: BoxFit.cover,)
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
                          fontSize: MediaQuery.of(context).size.width * 0.048,
                          color: Colors.black, 
                          fontWeight: FontWeight.w500 ,
                          fontFamily: Constans.fontFamily,
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
                          fontFamily: Constans.fontFamily,
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
              ),
            )).toList(),
          );
  }

Container loadcat(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 12 , left: 7),
      height: MediaQuery.of(context).size.height * 0.13,
      width: MediaQuery.of(context).size.width,
      alignment: Alignment.center,
      child: SizedBox(
        height: MediaQuery.of(context).size.height * 0.1,
        child: ListView.builder(
          physics: const NeverScrollableScrollPhysics(),
          primary: false,
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          itemCount: 4,
          itemBuilder: (context, index) => Padding(
            padding: const EdgeInsets.symmetric(horizontal: 11),
            child: Shimmergym.Rectangle(
              radius: 20,
             height: MediaQuery.of(context).size.height * 0.05,
             cc: Colors.grey[300],
             width: MediaQuery.of(context).size.width * 0.18,),
          ),
        ),
      ),
    );
  }

 SizedBox loadartical(BuildContext context) {
  List art =[1,2,3];
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.29,
      width: MediaQuery.of(context).size.width,
      child: CarouselSlider(
          items:art.map((item) {
            return Shimmergym.Rectangle(
              height: MediaQuery.of(context).size.height * 0.27,
              cc: Colors.grey[300],
              width: MediaQuery.of(context).size.width,
              radius: 30) ;
          }).toList(),
          options: CarouselOptions(
            /*  autoPlay: true,
          autoPlayInterval: Duration(seconds: 5), */
            height: MediaQuery.of(context).size.height * 0.27,
            initialPage: 0,
            enlargeCenterPage: true,
          )),
    );
  }

ListView loadexr(BuildContext context) {
    return ListView.builder(
      physics: const NeverScrollableScrollPhysics(),
      primary: false,
      shrinkWrap: true,
      scrollDirection: Axis.vertical,
      itemCount: 3,
      itemBuilder: (context, index) => Padding(
        padding: const  EdgeInsets.only(bottom: 14 , left: 14 , right: 14) ,
        child: Shimmergym.Rectangle(
          radius: 20,
          cc: Colors.grey[300],
         height:MediaQuery.of(context).size.height*0.128 ,
         width: MediaQuery.of(context).size.width ,),
      ),
    );
  }

}
