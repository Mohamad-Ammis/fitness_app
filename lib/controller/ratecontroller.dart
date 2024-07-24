import 'package:fitnessapp/constans.dart';
import 'package:fitnessapp/controller/spec_day_controller.dart';
import 'package:fitnessapp/main.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class Ratecontroller extends GetxController{

 final control = Get.put(SpecDay(), permanent: true);


Future setrate (double rate)async{
     const String url = '${Constans.baseUrl}rating/create';
      try{
      final res = await http.post(Uri.parse(url),
      headers:{
      'Accept':'application/json',
      'Authorization': 'Bearer ${userInfo!.getString('token')}',
     },
     body:{
      "rateable_id":control.coachid.toString(),
      "rating":rate.toInt().toString()
     }
     );
     if(res.statusCode==200){}else{
      throw "Something wrong , please try again";
     }
      }catch(error){
         throw'$error';
      }

   }


}