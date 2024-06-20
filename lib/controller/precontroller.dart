import 'package:fitnessapp/models/coach.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Precontroller extends GetxController{
  List <Coach> coaches = [
    Coach(image: "assets/images/c1.jpg", name: "Areej Mahfouz", price: "200",member: "22" , des: "I am a graduate of the Sports Institute in Damascus and I have 10 years of experience in exercises", age: "21",rate: "5",id: 1,bio: "Do what you love to love what you do"),
    Coach(image: "assets/images/c2.jpg", name: "Sedra Nader", price: "865",member: "14", des: "I am a graduate of the Sports Institute in Damascus and I have 10 years of experience in exercises", age: "25",rate: "3.6",id: 2,bio: "Athlete by day, dreamer by night. Never stop chasing your goals"),
    Coach(image: "assets/images/c3.jpg", name: "Karam AL Madani", price: "430",member: "5", des: "I am a graduate of the Sports Institute in Damascus and I have 10 years of experience in exercises", age: "30",rate: "4.2",id: 3,bio: "Fearless on the field, unstoppable in pursuit. Witness the power of determination"),
    Coach(image: "assets/images/c1.jpg", name: "Rabah Salam", price: "150",member: "21", des: "I am a graduate of the Sports Institute in Damascus and I have 10 years of experience in exercises", age: "28",rate: "2",id: 4,bio: "Heart of a champion, mind of a strategist. I play to win"),
    Coach(image: "assets/images/c2.jpg", name: "Rahaf Mahfouz", price: "300",member: "13", des: "I am a graduate of the Sports Institute in Damascus and I have 10 years of experience in exercises", age: "39",rate: "4.5",id: 5,bio: "Game face on, ready to conquer. Join me on this journey to greatness"), 
  ];

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


} 