import 'dart:convert';
import 'package:fitnessapp/constans.dart';
import 'package:fitnessapp/main.dart';
import 'package:fitnessapp/models/exersice.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class Pickscotroller extends GetxController {


   int time =0;
   int numexer = 0;
   int calories = 0;
   List helperexer =[];
   List<ExerciseModel> exer = [];

 

   Future getexer ()async{
    helperexer = [];
    exer = [];
    numexer = 0;
    calories =0;
    time = 0;
     const String url = '${Constans.baseUrl}exercise/pickforYou';
      try{
      final res = await http.get(Uri.parse(url),
      headers:{
      'Accept':'application/json',
      'Authorization': 'Bearer ${userInfo!.getString('token')}',
     },
     );
     if(res.statusCode==200){
     final resdata = json.decode(res.body);
      helperexer = resdata["data"] as List<dynamic >;
       for(int i =0 ; i<helperexer.length ; i++ ){
        ExerciseModel test = ExerciseModel(
          id: helperexer[i]["id"].toString(),
          name: helperexer[i]["exercise_name"],
          des: helperexer[i]["description"],
          calories: helperexer[i]["calories"].toString(),
          time: helperexer[i]["time"],
          reps: helperexer[i]["reps"].toString(),
          image: helperexer[i]["image"],
          video_link: helperexer[i]["video_link"],
          target: helperexer[i]["target"],
          diseases: helperexer[i]["diseases"],
          level: helperexer[i]["level"],
          gender: helperexer[i]["gender"],
          choose: helperexer[i]["choose"],
          focus_area:Focusid(helperexer[i]["focus_areas"]),
          focus_area_name: Focusname(helperexer[i]["focus_areas"]),
          pivot: null);
         exer.add(test);
         calories+= int.parse(test.calories);
         time+=int.parse(test.time);
       }
      numexer=exer.length;
     }else{
      throw "Something wrong , please try again";
     }
      }catch(error){
         throw'$error';
      }

   }


// ignore: non_constant_identifier_names
List Focusid(List FF){
    List focus = [];
   for(int i=0 ; i< FF.length ; i++){
    focus.add(FF[i]["id"]);
   }
   return focus;
  }

  // ignore: non_constant_identifier_names
  List Focusname(List FF){
    List focus = [];
   for(int i=0 ; i< FF.length ; i++){
    focus.add(FF[i]["focus_area"]);
   }
   return focus;
  }
}