import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class Musclecontroller extends GetxController{
  int areaa = 0 ;
   Color basic =  const Color.fromARGB(255, 38, 164, 170).withOpacity(0.4);


   void setarea(int value){
    areaa = value ;
    update();
   }

   void setbasic(Color color){
    basic = color ;
    update();
   }

}