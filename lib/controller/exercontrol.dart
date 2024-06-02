import 'dart:convert';
import 'package:fitnessapp/controller/datacont.dart';
import 'package:fitnessapp/main.dart';
import 'package:fitnessapp/models/exersice.dart';
import 'package:fitnessapp/models/pivot_exer.dart';
import 'package:get/get.dart';
 import 'package:http/http.dart' as http;
 
class Exercontroller extends GetxController {
  
final controller = Get.put(Datacontroller() , permanent: true);
  
  String time ="0";
  String numexer = "0";
  String calories = "0";
  String gen = "";
  void gender(){
    if(preference!.getInt("man")==2){
     gen ="female";
    }else{
      gen = "male";
    }
  }


  List<dynamic> exercise =[];
  List<ExerciseModel> all_exer =[];

  Future getexer (String id , String? level)async{
    all_exer = [];
    print("jjjjj");
    final String url = level==null?'${controller.baseurl}category':'${controller.baseurl}trainer/exercise/gender';
    try{
     final res = await http.post(Uri.parse(url),
     headers:level==null? {'Accept':'application/json'
     }:{
      'Accept':'application/json',
      'Authorization': 'Bearer ${controller.token}',
     },
     body:level==null? {
      'category_id': id,
      'gender': gen
     }:{
      'muscle_id': id,
      'gender': gen,
      'level':level
     }
     );
    if(res.statusCode==200){
     final resdata = json.decode(res.body);
     if(level==null){
    exercise = resdata[0]["exercises"] as List<dynamic>;
     time = resdata[0]["total_time"].toString() ;
     numexer =resdata[0]["exercise_count"].toString() ;
     calories =resdata[0]["total_calories"].toString();
     }else{
      print(resdata["exercise"][0]["exercises"]);
      exercise = resdata["exercise"][0]["exercises"] as List<dynamic>;
     time = resdata["exercise"][0]["total_time"].toString() ;
     numexer =resdata["exercise"][0]["exercise_count"].toString() ;
     calories =resdata["exercise"][0]["total_calories"].toString();
     }
     update();
     for(int i = 0 ; i<exercise.length ; i++){
      if(level==null){
        ExerciseModel test = ExerciseModel(
        id: exercise[i]["id"].toString(),
        name: exercise[i]["exercise_name"],
        des: exercise[i]["description"],
       calories: exercise[i]["calories"].toString(),
      time: exercise[i]["time"],
      reps: exercise[i]["reps"].toString(),
      image: exercise[i]["image"],
      video_link: exercise[i]["video_link"],
      target: exercise[i]["target"],
      diseases: exercise[i]["diseases"],
      level: exercise[i]["level"],
      gender: exercise[i]["gender"],
      choose: exercise[i]["choose"],
      focus_area: null,
      focus_area_name: null,
      pivot: Pivot(
        cat_id: exercise[i]["pivot"]["category_id"].toString(),
        exer_id: exercise[i]["pivot"]["exercise_id"].toString()
        ));
        all_exer.add(test);
      }else{
         ExerciseModel test =ExerciseModel(
        id: exercise[i]["id"].toString(),
        name: exercise[i]["exercise_name"],
        des: exercise[i]["description"],
       calories: exercise[i]["calories"].toString(),
      time: exercise[i]["time"],
      reps: exercise[i]["reps"].toString(),
      image: exercise[i]["image"],
      video_link: exercise[i]["video_link"],
      target: exercise[i]["target"],
      diseases: exercise[i]["diseases"],
      level: exercise[i]["level"],
      gender: exercise[i]["gender"],
      choose: exercise[i]["choose"],
      focus_area:Focusid(exercise[i]["focus_areas"]) ,
      focus_area_name: Focusname(exercise[i]["focus_areas"]),
      pivot: Pivot(
        cat_id: exercise[i]["pivot"]["muscle_id"].toString(),
        exer_id: exercise[i]["pivot"]["exercise_id"].toString()
        ));
        all_exer.add(test);
      }
     }
     print({
      'muscle_id': id,
      'gender': gen,
      'level':level
     });
   }else{
    throw "Something wrong , please try again";
   }
    }catch(errore){
       throw'$errore';
    }

  }


  List Focusid(List FF){
    List focus = [];
   for(int i=0 ; i< FF.length ; i++){
    focus.add(FF[i]["id"]);
   }
   return focus;
  }

  List Focusname(List FF){
    List focus = [];
   for(int i=0 ; i< FF.length ; i++){
    focus.add(FF[i]["focus_area"]);
   }
   return focus;
  }

}