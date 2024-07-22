import 'dart:io';
import 'dart:convert';
import 'package:fitnessapp/constans.dart';
import 'package:fitnessapp/main.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart'; 
import 'package:http/http.dart' as http;

class Datacontroller extends GetxController {
  Color basiccolor = const Color.fromARGB(255, 38, 164, 170) ;
  Color deepcolor = const Color.fromARGB(255, 27, 118, 122) ;
  Color twocolor = Colors.black ;

  int index = 0;
  int count = 1 ;

  void changed(int value) {
    index = value;
    update();
  }
   
   double percent = 1/7 ;
   void nextpercent(){
    count+=1;
    if(count == 1){
      percent = 1/7;
    }else if (count == 2){
      percent = 2/7 ;
    }else if(count == 3){
      percent = 3/7;
    }else if(count == 4){
       percent = 4/7;
    }else if(count == 5){
      percent = 5/7;
    }else if(count == 6){
      percent = 6/7;
    }else{
      percent =1;
    }
    update();
   }

   void previouspercent(){
    count -=1 ;
      if(count == 1){
      percent = 1/7;
    }else if (count == 2){
      percent = 2/7 ;
    }else if(count == 3){
      percent = 3/7;
    }else if(count == 4){
       percent = 4/7;
    }else if(count == 5){
      percent = 5/7;
    }else if(count == 6){
      percent = 6/7;
    }else{
      percent =1;
    }
    update();
   }
  
   
  final control = PageController();

  double heightman =350 ;
  double heightwoman = 340;
   void setwidth (double widthScreen , double heightScreen ){
   if (man == 0) {
     heightman = heightScreen*0.445 ;
   heightwoman = heightScreen*0.425;
   }else if(man == 1){
     heightman = heightScreen*0.5 ;
     heightwoman = 220;
   }else{
    heightwoman = heightScreen*0.48;
    heightman = 220;
   }

   }

 //gender page 
  Color crman = Colors.black;
  double sizeman = 25;
  FontWeight weightman = FontWeight.normal;
  Color crwoman = Colors.black;
  double sizewoman = 25;
  FontWeight weightwoman = FontWeight.normal;
  int man = 0;
  //350
  double leftman = 60;
  double bottomman = 30;
  
  double opacityman = 1;
  double rightwoman = 60;
  double bottomwoman = 30;
  
  double opacitywoman = 1;

  void selectman(
      {required Color crm,
      required double sizem,
      required FontWeight weightm,
      required Color crw,
      required double sizew,
      required FontWeight weightw,
      required int m,
      required double leftm,
      required double bottomm,
      required double heightm,
      required double opacitym,
      required double rightw,
      required double bottomw,
      required double heightw,
      required double opacityw}) {
    crman = crm;
    sizeman = sizem;
    weightman = weightm;
    crwoman = crw;
    sizewoman = sizew;
    weightwoman = weightw;
     man = m;
    leftman = leftm;
    bottomman = bottomm;
    heightman = heightm;
    opacityman = opacitym;
    rightwoman = rightw;
    bottomwoman = bottomw;
    heightwoman = heightw;
    opacitywoman = opacityw;
    update();
  }


   //target page 
   String selectgoal =''; 

   void setselectgoal(String value){
     selectgoal = value ;
     update();
   }


 // focus area page 
 int selectfocusarea = 0 ;

 void setfocusarea(int value){
    selectfocusarea = value ;
    update();
 }


 //weight and height 
 int totalhieght = 220;
 int initheight = 160;
 int currentheight = 160;

 int totalwieght = 220;
 int initweight = 60;
 int currentweight = 60;

 void setheight(int value){
    currentheight = value ;
    initheight = value ;
    update();
 }

 void setweight(int value){
    currentweight = value ;
    initweight = value ;
    update();
 }

//image picker 
final imagepicker = ImagePicker();
File? pickedimage ;
List<int> imageBytes = [];
String? base64String ;

void fetchimage()async{
 XFile? image = await imagepicker.pickImage(source: ImageSource.gallery);
 if(image == null){return;}
 pickedimage = File(image.path);
 imageBytes = await pickedimage!.readAsBytes();
 base64String = base64Encode(imageBytes);
 update();
}


//Days page
List days =[];

bool check(int a){
  if(days.contains(a)){
    return true;
  }else{return false ;}
}

void setdays(int a ){
  if(days.contains(a)){
    days.remove(a);
  }else{
    days.add(a);
  }
  update();
}

TimeOfDay time = TimeOfDay.now();

 void setclock (TimeOfDay s){
  time = s;
  update();
 }

//illness page 

int selectill =0; 

bool checkill(int num ){
  if(selectill == num){
    return true ;
  }else{
    return false;
  }
}

   void setselectill(int value){
    if(selectill == value){
      selectill = 0;
    }else{
      selectill = value ;
    }
     update();
   }

//
  String ip=Constans.host;
  String baseurl ="http://${Constans.host}:8000/api/";
 
  Map <String , String> User_data ={
    'gender':'',
    'target':'',
    'diseases':'',
    'activity':'',
    'focus_area':'',
    'tall':'',
    'weight':'',
    'preferred_time':''
  };


  void setUser_Data(){
    if (man == 1) {
       User_data["gender"]="male";
    }else{
      User_data["gender"]="female";
    }
   if(selectgoal =="1"){
     User_data["target"]="lose_weight";
   }else if(selectgoal == "2"){
     User_data["target"]="build_muscle";
   }else{
     User_data["target"]="keep_fit";
   }
   User_data["tall"]=currentheight.toString();
   User_data["weight"]=currentweight.toString();
   if(selectfocusarea ==1){
     User_data['focus_area'] = 'all';
   }else if(selectfocusarea == 2){
     User_data['focus_area'] = 'chest';
   }else if (selectfocusarea == 3){
    User_data['focus_area'] = 'abs';
   }else if(selectfocusarea == 4){
     User_data['focus_area'] = 'arm';
   }else{
    User_data['focus_area'] = 'leg';
   }
   if(selectill == 0){
    User_data['diseases'] = 'none';
   }else if(selectill == 1){
    User_data['diseases'] = 'knee';
   }else if(selectill == 2){
     User_data['diseases'] = 'heart';
   }else if(selectill == 3){
    User_data['diseases'] = 'breath';
   }else if(selectill == 4){
     User_data['diseases'] = 'diabetes';
   }else{
     User_data['diseases'] = 'blood_pressure';
   }
   if(activity == 1){
    User_data['activity'] = 'Sedentary';
   }else if(activity == 2){
    User_data['activity'] = 'Lightly_Active';
   }else{
    User_data['activity'] = 'Very_Active';
   }
   User_data['preferred_time'] = "${time.hour.toString()}:${time.minute.toString()}";
  }

 Future Setdata ()async{
  final String url = '${baseurl}trainer/info';
  try{
     final request = http.MultipartRequest('POST',Uri.parse(url));
    
    request.headers.addAll({'Accept':'application/json' ,
      'Authorization': 'Bearer ${userInfo!.getString('token')}',
      },);
      request.fields.addAll(User_data);

      if(pickedimage!= null){
      request.files.add(await http.MultipartFile.fromPath("Image", pickedimage!.path));
      }
     var res= await request.send();
     var response = await http.Response.fromStream(res);
     if(response.statusCode == 500){
      throw 'No Internet , Please try again';
     }
     }
    catch(errore){
      rethrow ;
    }
 }

bool isloading = false;

void Load(bool value){
  isloading = value;
  update();
}

void setmemoryman(int value){
  man = value ;
  update();
}

void setmemoryimage(String value){
  base64String = value ;
  update();
}






void setlogout(){
  index = 0;
   heightman =350 ;
   heightwoman = 340;
   crman = Colors.black;
   sizeman = 25;
   weightman = FontWeight.normal;
   crwoman = Colors.black;
   sizewoman = 25;
    weightwoman = FontWeight.normal;
   man = 0;
    leftman = 60;
   bottomman = 30;
   opacityman = 1;
   rightwoman = 60;
   bottomwoman = 30;
   opacitywoman = 1;
    selectgoal =''; 
   selectfocusarea = 0 ;
   initheight = 160;
   initweight = 60;
   pickedimage = null ;
   days =[];
   time = TimeOfDay.now();
   selectill =0; 
   percent = 1/6 ;
   base64String= null ;
   update();

}

//activity

int activity = 0 ; 

   void setactivity(int value){
     activity = value ;
     update();
   }




}
