import 'dart:convert';
import 'package:fitnessapp/constans.dart';
import 'package:fitnessapp/main.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class Paymentcoach extends GetxController {

int idsub = 0;
String urll = "";
String equ = "";

Future subscribe (int coachid)async{
     const String url = '${Constans.baseUrl}subscription/create';
     if(userInfo!.getInt("equ[$coachid]")==1){
      equ ="equipment";
     }else{
      equ ="no_equipment";
     }
      try{
      final res = await http.post(Uri.parse(url),
      headers:{
      'Accept':'application/json',
      'Authorization': 'Bearer ${userInfo!.getString('token')}',
     },
     body:{
      "coach_id":coachid.toString(),
      "choose":equ
     }
     );
     print({
      "coach_id":coachid.toString(),
      "choose":equ
     });
     if(res.statusCode==200){
       final resdata = json.decode(res.body);
       idsub = resdata["data"]["id"];
     }else{
      throw "Something wrong , please try again";
     }
      }catch(error){
         throw'$error';
      }

   }


   Future payment (int subid)async{
     const String url = '${Constans.baseUrl}subscription/pay';
      try{
      final res = await http.post(Uri.parse(url),
      headers:{
      'Accept':'application/json',
      'Authorization': 'Bearer ${userInfo!.getString('token')}',
     },
     body:{
      "subscription_id":subid.toString()
     }
     );
     if(res.statusCode==200){
       final resdata = json.decode(res.body);
       urll = resdata["Data"]["InvoiceURL"];
       print(urll);
     }else{
      throw "Something wrong , please try again";
     }
      }catch(error){
         throw'$error';
      }

   }


}