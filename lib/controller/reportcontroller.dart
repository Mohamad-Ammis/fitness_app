import 'dart:convert';
import 'dart:math';
import 'package:fitnessapp/constans.dart';
import 'package:fitnessapp/main.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class Reportcontroller extends GetxController {
  double currentweight = 60 ;
  int mincalories = 0 ;
  int maxcalories = 0 ;

  String bmi = "0" ;
  String bmicat = "Nothing yet" ;
  int numexerday = 0 ;
  int timeday = 0 ;
  int timetotalday = 0 ;
  int calday = 0 ;
  int caltotalday = 0 ;
  int stepday = 0 ;

  int stepss = 0 ;


  int numexerweek = 0 ;
  int timeweek = 0 ;
  int timetotaweek = 0 ;
  int calweek = 0 ;
  int caltotalweek = 0 ;
  int stepweek = 0 ;
  List helper = [] ;
  int wieghtmax = 0 ;
  int wieghtmin = 0 ;
  List<double> caloriesdiagram = [];
  List<double> wieghtdiagram = [];

  


Future<void> getreportdaily() async {
    final String url = '${Constans.baseUrl}report/getDailyReport';
    try {
      final res = await http.get(Uri.parse(url), headers: {
        'Accept': 'application/json',
        'Authorization': 'Bearer ${userInfo!.getString('token')}',
      });
      print(url);
      print(userInfo!.getString('token'));
      if (res.statusCode == 200) {
        final resdata = json.decode(res.body);
        bmi = resdata["new_bmi"].toString();
        bmicat = resdata["bmi_category"];
        numexerday = resdata["Number_of_exercises"];
        timeday = resdata["time"];
        timetotalday = resdata["total_time"];
        calday = resdata["calories"];
        caltotalday = resdata["total-calories"];
        stepday = resdata["steps"];
      } else {
        print("***********8");
        throw "Something wrong , please try again";
      }
    } catch (errore) {
      throw '$errore';
    }
  }


Future<void> getreportweekly() async {
    const String url = '${Constans.baseUrl}report/getWeeklyReport';
    try {
      final res = await http.get(Uri.parse(url), headers: {
        'Accept': 'application/json',
        'Authorization': 'Bearer ${userInfo!.getString('token')}',
      });
      if (res.statusCode == 200) {
        helper = [];
        caloriesdiagram = [];
        final resdata = json.decode(res.body);
        numexerweek = resdata["exercises"];
        stepweek = resdata["total_steps"];
        calweek = resdata["calories"];
        caltotalweek = resdata["total_calories"];
        timeweek=resdata["time"];
        timetotaweek = resdata["total_time_seconds"];
        helper = resdata["daily_reports"];
        for(int i=0 ; i<helper.length ; i++){
          caloriesdiagram.add(double.parse(helper[i]["calories"].toString()));
          wieghtdiagram.add(double.parse(helper[i]["weight"].toString()));
          if(i>0){
            maxcalories = max(caloriesdiagram[i-1].toInt(), caloriesdiagram[i].toInt());
            mincalories = min(caloriesdiagram[i-1].toInt(), caloriesdiagram[i].toInt());
            wieghtmax = max(wieghtdiagram[i-1].toInt(), wieghtdiagram[i].toInt());
            wieghtmin = min(wieghtdiagram[i-1].toInt(), wieghtdiagram[i].toInt());
          }
        }
        currentweight = wieghtdiagram[6];
      } else {
        throw "Something wrong , please try again";
      }
    } catch (errore) {
      throw '$errore';
    }
  }


Future setsteps (String steps)async{
      String url = '${Constans.baseUrl}report/creatReportSteps';
      try{
      final res = await http.post(Uri.parse(url),
      headers:{
      'Accept':'application/json',
      'Authorization': 'Bearer ${userInfo!.getString('token')}',
     },
     body:{
      "steps":int.parse(steps).toString()
     }
     );
      stepss+=int.parse(steps);
      print(url);
      print(userInfo!.getString('token'));
      print({
      "steps":steps.toString()
     });
     if(res.statusCode==200){}else{
      throw "Something wrong , please try again";
     }
      }catch(error){
         throw'$error';
      }

   }

}