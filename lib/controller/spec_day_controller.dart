import 'dart:convert';
import 'package:fitnessapp/constans.dart';
import 'package:fitnessapp/controller/precontroller.dart';
import 'package:fitnessapp/main.dart';
import 'package:fitnessapp/models/Ingredient.dart';
import 'package:fitnessapp/models/exersice.dart';
import 'package:fitnessapp/models/mealcoach.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class SpecDay extends GetxController {

final controller = Get.put(Precontroller() , permanent: true);

  int load = 0 ;
  int loadexer = 0;
  int dayid = 0 ;
  int coachid = 0 ;
  List helper = [] ;
  List helperint = [];
  List<Ingredient> inte = [] ;
  List<Meal> testt = [];
  List<Meal> breakfast = [];
  List<Meal> snack = [];
  List<Meal> lunch = [];
  List<Meal> dinner = [];



  List helperexer = [] ;
  List <ExerciseModel> exer = [];



  void updatecoach(int cid){
    coachid = cid ;
    update();
  }

  void updateday(int did){
    dayid = did ;
    update();
  }

  
   void updateload(){
    load = 1;
    update();
   }

    Map <String , String> specday ={
    'categoryName':'',
    'day_id':'',
    'coach_id':'',
  };


  Map <String , String> specdayexer ={
    'choose':'',
    'day_id':'',
    'coach_id':'',
  };

   void setspecday( String categoryName ){
      specday["coach_id"] = coachid.toString() ;
      specday["day_id"] = dayid.toString() ;
      specday["categoryName"] = categoryName ;
   }

   void setspecdayexer(){
      specdayexer["coach_id"] = coachid.toString() ;
      specdayexer["day_id"] = dayid.toString() ;
      if(controller.choosetypeexer ==1){
        specdayexer["choose"] = "equipment" ;
      }else{
        specdayexer["choose"] = "no_equipment" ;
      }
   }


   

   Future getmeal ()async{
    helper = [] ;
   helperint = [];
   inte = [] ;
   testt = [];
     const String url = '${Constans.baseUrl}coach/meal/show';
      try{
      final res = await http.post(Uri.parse(url),
      headers:{
      'Accept':'application/json',
      'Authorization': 'Bearer ${userInfo!.getString('token')}',
     },
     body: specday
     );
     if(res.statusCode==200){
     final resdata = json.decode(res.body);
      helper = resdata["meal"] as List<dynamic >;
       for(int i =0 ; i<helper.length ; i++ ){
        Meal test = Meal(
          id: helper[i]["id"],
          name: helper[i]["name"],
          categoryName: helper[i]["categoryName"],
          type: helper[i]["type"],
          calories: helper[i]["calories"],
          protein: helper[i]["protein"],
          image: helper[i]["image"],
          description: helper[i]["description"],
          warning: helper[i]["warning"],
        );
        helperint = helper[i]["ingredients"]  as List<dynamic >;
        for(int i = 0 ; i < helperint.length ; i++){
          Ingredient test =Ingredient(
            name: helperint[i]["name"],
            image: helperint[i]["image"],
          );
          inte.add(test);
        }
        test.ingredient = inte ;
        testt.add(test);
       }
       if(specday["categoryName"]=="breakfast"){
         breakfast = [];
         breakfast = testt;
       }else if (specday["categoryName"]=="snack"){
          snack = [];
          snack = testt;
       }else if(specday["categoryName"]=="dinner"){
         dinner=[];
         dinner = testt;
       }else{
          lunch=[];
          lunch = testt;
       }
     }else{
      throw "Something wrong , please try again";
     }
      }catch(error){
         throw'$error';
      }

   }


   Future getexer ()async{
    helperexer = [];
    exer = [];
     const String url = '${Constans.baseUrl}exercise/exercisePlan';
      try{
      final res = await http.post(Uri.parse(url),
      headers:{
      'Accept':'application/json',
      'Authorization': 'Bearer ${userInfo!.getString('token')}',
     },
     body: specdayexer
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
          focus_area:Focusid(helperexer[i]["focus_areas"]) ,
          focus_area_name: Focusname(helperexer[i]["focus_areas"]),
          pivot: null);
         exer.add(test);
       }
       loadexer = 1;
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