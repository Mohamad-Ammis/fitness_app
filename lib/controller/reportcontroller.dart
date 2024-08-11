import 'dart:convert';
import 'package:fitnessapp/constans.dart';
import 'package:fitnessapp/main.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class Reportcontroller extends GetxController {
  double currentweight = 45.4 ;
  double mincalories = 200 ;
  double maxcalories = 600 ;

  String bmi = "0" ;
  String bmicat = "Nothing yet" ;
  int numexerday = 0 ;

  int numexerweek = 0 ;

  


Future<void> getreportdaily() async {
    final String url = '${Constans.baseUrl}report/getDailyReport';
    try {
      final res = await http.get(Uri.parse(url), headers: {
        'Accept': 'application/json',
        'Authorization': 'Bearer ${userInfo!.getString('token')}',
      });
      if (res.statusCode == 200) {
        final resdata = json.decode(res.body);
        bmi = resdata["bmi"].toString();
        bmicat = resdata["bmi_category"];
        numexerday = resdata["Number_of_exercises"];
      } else {
        throw "Something wrong , please try again";
      }
    } catch (errore) {
      throw '$errore';
    }
  }


Future<void> getreportweekly() async {
    final String url = '${Constans.baseUrl}report/getWeeklyReport';
    try {
      final res = await http.get(Uri.parse(url), headers: {
        'Accept': 'application/json',
        'Authorization': 'Bearer ${userInfo!.getString('token')}',
      });
      if (res.statusCode == 200) {
        final resdata = json.decode(res.body);
        numexerweek = resdata["total_exercises"];

      } else {
        throw "Something wrong , please try again";
      }
    } catch (errore) {
      throw '$errore';
    }
  }


}