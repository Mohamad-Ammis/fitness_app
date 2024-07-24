import 'dart:convert';
import 'package:fitnessapp/constans.dart';
import 'package:fitnessapp/main.dart';
import 'package:fitnessapp/models/coach.dart';
import 'package:fitnessapp/models/dayplan.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class Precontroller extends GetxController{
  List <Coach> coaches = [];

  List helper =[];

  final color =const Color.fromARGB(255, 50, 144, 173);

   List<int> expanded = [];

  

  void checkexpand(bool value , int index){
       if(value == true){
        expanded.add(coaches[index].id);
        }else{if(expanded.contains(coaches[index].id)){
          expanded.remove(coaches[index].id);
          }}
       update();
   }

  double opcitydes(int index){
    if(expanded.contains(coaches[index].id)){
      return 1;
    }else{
      return 0;
    }
  }
  
  double opcitybio(int index){
    if(expanded.contains(coaches[index].id)){
      return 0;
    }else{
      return 1;
    }
  }


  int choosetypeexer = 0;
  
  void choose(int val){
    choosetypeexer = val ;
    update();
  }

  String image = "";

  void chooseimage(String value){
    image = value ;
    update();
  }

  double  rate =0 ;

  void rating (double value , int coachid ){
    rate = value ;
    userInfo!.setString("rate$coachid", value.toString());
    update();
  }

  void initrate(int coachid){
    rate = userInfo!.getString("rate$coachid")==null? 0 : double.parse(userInfo!.getString("rate$coachid")!) ;
  }

  List<Dayplan> week1 =[
    Dayplan(day: 1, id: 1),
    Dayplan(day: 2, id: 2),
    Dayplan(day: 3, id: 3),
    Dayplan(day: 4, id: 4),
    Dayplan(day: 5, id: 5),
    Dayplan(day: 6, id: 6),
    Dayplan(day: 7, id: 7),
  ];

  List<Dayplan> week2 =[
    Dayplan(day: 1, id: 8),
    Dayplan(day: 2, id: 9),
    Dayplan(day: 3, id: 10),
    Dayplan(day: 4, id: 11),
    Dayplan(day: 5, id: 12),
    Dayplan(day: 6, id: 13),
    Dayplan(day: 7, id: 14),
  ];

  List<Dayplan> week3 =[
    Dayplan(day: 1, id: 15),
    Dayplan(day: 2, id: 16),
    Dayplan(day: 3, id: 17),
    Dayplan(day: 4, id: 18),
    Dayplan(day: 5, id: 19),
    Dayplan(day: 6, id: 20),
    Dayplan(day: 7, id: 21),
  ];

  List<Dayplan> week4 =[
    Dayplan(day: 1, id: 22),
    Dayplan(day: 2, id: 23),
    Dayplan(day: 3, id: 24),
    Dayplan(day: 4, id: 25),
    Dayplan(day: 5, id: 26),
    Dayplan(day: 6, id: 27),
    Dayplan(day: 7, id: 28),
  ];


 List plans =[1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17];


 int getweek(Dayplan d){
  if(week1.contains(d)){
    return 1 ;
  }else if(week2.contains(d)){
    return 2 ;
  }else if(week3.contains(d)){
    return 3 ;
  }else{
    return 4 ;
  }
 } 


 Future getallcoaches ()async{
    const String url = '${Constans.baseUrl}coach/allCoach';
    try{
     final res = await http.get(Uri.parse(url) ,       
     headers: {
      'Accept':'application/json', 
      'Authorization': 'Bearer ${userInfo!.getString('token')}',
     }
     );
   if(res.statusCode==200){
    coaches = [] ;
     final resdata = json.decode(res.body);
     helper = resdata["coach"] as List<dynamic>;
     for(int i = 1 ; i<helper.length ; i++){
      Coach test = Coach(
        image: helper[i]["image"],
        name: helper[i]["name"],
        bio: helper[i]["bio"],
        id: helper[i]["id"],
        price: helper[i]["price"],
        rate: helper[i]["rating"],
        age: helper[i]["age"],
        des: helper[i]["description"],);
        coaches.add(test);
     }
     update();
   }else{
    throw "Something wrong , please try again";
   }
    }catch(errore){
       throw'$errore';
    }
  }

} 