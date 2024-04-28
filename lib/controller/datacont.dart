import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
 import 'package:image_picker/image_picker.dart'; 

class Datacontroller extends GetxController {
  Color basiccolor = const Color.fromARGB(255, 38, 164, 170) ;
  Color deepcolor = const Color.fromARGB(255, 27, 118, 122) ;
  Color twocolor = Colors.black ;

  int index = 0;

  void changed(int value) {
    index = value;
    update();
  }
   
   double percent = 1/6 ;
   void nextpercent(){
    percent += 1/6 ;
    update();
   }

   void previouspercent(){
    percent -= 1/6 ;
    update();
   }
  
   
  final control = PageController();

  double heightman =350 ;
  double heightwoman = 340;
   void setwidth (double widthScreen , double heightScreen ){
   if (man == 0) {
     heightman = heightScreen*0.445 ;
   heightwoman = heightScreen*0.425;
   }else if(man == 1){
     heightman = heightScreen*0.5 ;
     heightwoman = 220;
   }else{
    heightwoman = heightScreen*0.48;
    heightman = 220;
   }

   }

 //gender page 
  Color crman = Colors.black;
  double sizeman = 25;
  FontWeight weightman = FontWeight.normal;
  Color crwoman = Colors.black;
  double sizewoman = 25;
  FontWeight weightwoman = FontWeight.normal;
  int man = 0;
  //350
  double leftman = 60;
  double bottomman = 30;
  
  double opacityman = 1;
  double rightwoman = 60;
  double bottomwoman = 30;
  
  double opacitywoman = 1;

  void selectman(
      {required Color crm,
      required double sizem,
      required FontWeight weightm,
      required Color crw,
      required double sizew,
      required FontWeight weightw,
      required int m,
      required double leftm,
      required double bottomm,
      required double heightm,
      required double opacitym,
      required double rightw,
      required double bottomw,
      required double heightw,
      required double opacityw}) {
    crman = crm;
    sizeman = sizem;
    weightman = weightm;
    crwoman = crw;
    sizewoman = sizew;
    weightwoman = weightw;
     man = m;
    leftman = leftm;
    bottomman = bottomm;
    heightman = heightm;
    opacityman = opacitym;
    rightwoman = rightw;
    bottomwoman = bottomw;
    heightwoman = heightw;
    opacitywoman = opacityw;
    update();
  }


   //target page 
   String selectgoal =''; 

   void setselectgoal(String value){
     selectgoal = value ;
     update();
   }


 // focus area page 
 int selectfocusarea = 0 ;

 void setfocusarea(int value){
    selectfocusarea = value ;
    update();
 }


 //weight and height 
 int totalhieght = 250;
 int initheight = 160;
 int currentheight = 160;

 int totalwieght = 150;
 int initweight = 60;
 int currentweight = 60;

 void setheight(int value){
    currentheight = value ;
    initheight = value ;
    update();
 }

 void setweight(int value){
    currentweight = value ;
    initweight = value ;
    update();
 }

//image picker 
final imagepicker = ImagePicker();
File? pickedimage ;

void fetchimage()async{
 XFile? image = await imagepicker.pickImage(source: ImageSource.gallery);
 if(image == null){return;}
 pickedimage = File(image.path);
 update();
}


//Days page
List days =[];

bool check(int a){
  if(days.contains(a)){
    return true;
  }else{return false ;}
}

void setdays(int a ){
  if(days.contains(a)){
    days.remove(a);
  }else{
    days.add(a);
  }
  update();
}

TimeOfDay time = TimeOfDay.now();

 void setclock (TimeOfDay s){
  time = s;
  update();
 }

//illness page 

String selectill =''; 

   void setselectill(String value){
     selectill = value ;
     update();
   }

}
