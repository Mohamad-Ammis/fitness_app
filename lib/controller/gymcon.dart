import 'dart:convert';
import 'package:fitnessapp/controller/datacont.dart';
import 'package:get/get.dart';
 import 'package:http/http.dart' as http;
class Gymcontroller extends GetxController {
  
final controller = Get.put(Datacontroller() , permanent: true);
  List<dynamic> articals =[];
  List<dynamic> category =[];
  bool load = false ;
 Future<void> getartical ()async{
    final String url = '${controller.baseurl}articl/allArticls';
    try{
     final res = await http.get(Uri.parse(url) ,       
     headers: {
      'Accept':'application/json', 
     }
     );
   if(res.statusCode==200){
     final resdata = json.decode(res.body);
     articals = resdata as List<dynamic>;
     load = true;
   }else{
    throw "Something wrong , please try again";
   }
    }catch(errore){
       throw'$errore';
    }
  }


  Future<void> getCat()async{
    final String url = '${controller.baseurl}category/show';
    try{
     final res = await http.get(Uri.parse(url) ,       
     headers: {
      'Accept':'application/json', 
     }
     );
   if(res.statusCode==200){
     final resdata = json.decode(res.body);
     category = resdata["data"] as List<dynamic>;
    // print(category);
   }else{
    throw "Something wrong , please try again";
   }
    }catch(errore){
       throw'$errore';
    }
  }



}