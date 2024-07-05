import 'package:fitnessapp/models/pivot_exer.dart';

class ExerciseModel{
 String id ;
 String name ;
 String des ;
 String calories ;
 String time ;
 String reps ;
 String image ;
 String video_link ;
 String target ;
 String diseases ;
 String level ;
 String gender ;
 String? choose ;
 List focus_area;
 List focus_area_name;
 Pivot? pivot ;

 ExerciseModel({
  required this.id,
  required this.name,
  required this.des,
  required this.calories,
  required this.time,
  required this.reps,
  required this.image,
  required this.video_link,
  required this.target ,
  required this.diseases,
  required this.level,
  required this.gender,
  required this.choose,
  required this.focus_area ,
  required this.focus_area_name,
  required this.pivot
  });
 


}