import 'dart:io';
import 'dart:convert';
import 'package:fitnessapp/constans.dart';
import 'package:fitnessapp/main.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;

class Datacontroller extends GetxController {
  Color basiccolor = const Color.fromARGB(255, 38, 164, 170);
  Color deepcolor = const Color.fromARGB(255, 27, 118, 122);
  Color twocolor = Colors.black;

  int index = 0;

  void changed(int value) {
    index = value;
    update();
  }

  double percent = 1 / 6;
  void nextpercent() {
    percent += 1 / 6;
    update();
  }

  void previouspercent() {
    percent -= 1 / 6;
    update();
  }

  final control = PageController();

  double heightman = 350;
  double heightwoman = 340;
  void setwidth(double widthScreen, double heightScreen) {
    if (man == 0) {
      heightman = heightScreen * 0.445;
      heightwoman = heightScreen * 0.425;
    } else if (man == 1) {
      heightman = heightScreen * 0.5;
      heightwoman = 220;
    } else {
      heightwoman = heightScreen * 0.48;
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
  String selectgoal = '';

  void setselectgoal(String value) {
    selectgoal = value;
    update();
  }

  // focus area page
  int selectfocusarea = 0;

  void setfocusarea(int value) {
    selectfocusarea = value;
    update();
  }

  //weight and height
  int totalhieght = 220;
  int initheight = 160;
  int currentheight = 160;

  int totalwieght = 220;
  int initweight = 60;
  int currentweight = 60;

  void setheight(int value) {
    currentheight = value;
    initheight = value;
    update();
  }

  void setweight(int value) {
    currentweight = value;
    initweight = value;
    update();
  }

//image picker
  final imagepicker = ImagePicker();
  File? pickedimage;
  List<int> imageBytes = [];
  String? base64String;

  void fetchimage() async {
    XFile? image = await imagepicker.pickImage(source: ImageSource.gallery);
    if (image == null) {
      return;
    }
    pickedimage = File(image.path);
    imageBytes = await pickedimage!.readAsBytes();
    base64String = base64Encode(imageBytes);
    update();
  }

//Days page
  List days = [];

  bool check(int a) {
    if (days.contains(a)) {
      return true;
    } else {
      return false;
    }
  }

  void setdays(int a) {
    if (days.contains(a)) {
      days.remove(a);
    } else {
      days.add(a);
    }
    update();
  }

  TimeOfDay time = TimeOfDay.now();

  void setclock(TimeOfDay s) {
    time = s;
    update();
  }

//illness page

  int selectill = 0;

  bool checkill(int num) {
    if (selectill == num) {
      return true;
    } else {
      return false;
    }
  }

  void setselectill(int value) {
    if (selectill == value) {
      selectill = 0;
    } else {
      selectill = value;
    }
    update();
  }

//
  String ip = Constans.host;
  String? token = userInfo?.getString("token");
  String baseurl = "http://${Constans.host}:8000/api/";

  Map<String, String> userData = {
    'gender': '',
    'target': '',
    'diseases': '',
    'focus_area': '',
    'tall': '',
    'weight': '',
    'preferred_time': ''
  };

  void setUserData() {
    if (man == 1) {
      userData["gender"] = "male";
    } else {
      userData["gender"] = "female";
    }
    if (selectgoal == "1") {
      userData["target"] = "lose weight";
    } else if (selectgoal == "2") {
      userData["target"] = "build muscle";
    } else {
      userData["target"] = "keep fit";
    }
    userData["tall"] = currentheight.toString();
    userData["weight"] = currentweight.toString();
    if (selectfocusarea == 1) {
      userData['focus_area'] = 'all';
    } else if (selectfocusarea == 2) {
      userData['focus_area'] = 'chest';
    } else if (selectfocusarea == 3) {
      userData['focus_area'] = 'abs';
    } else if (selectfocusarea == 4) {
      userData['focus_area'] = 'arm';
    } else {
      userData['focus_area'] = 'leg';
    }
    if (selectill == 0) {
      userData['diseases'] = 'none';
    } else if (selectill == 1) {
      userData['diseases'] = 'knee';
    } else if (selectill == 2) {
      userData['diseases'] = 'heart';
    } else {
      userData['diseases'] = 'breath';
    }
    userData['preferred_time'] =
        "${time.hour.toString()}:${time.minute.toString()}";
  }

  Future setData() async {
    final String url = '${baseurl}trainer/info';
    try {
      final request = http.MultipartRequest('POST', Uri.parse(url));

      request.headers.addAll(
        {
          'Accept': 'application/json',
          'Authorization': 'Bearer $token',
        },
      );
      request.fields.addAll(userData);
      if (pickedimage != null) {
        request.files
            .add(await http.MultipartFile.fromPath("Image", pickedimage!.path));
      }
      var res = await request.send();
      var response = await http.Response.fromStream(res);
      print(response.statusCode.toString());
      if (response.statusCode == 500) {
        throw 'No Internet , Please try again';
      }
    } catch (errore) {
      rethrow;
    }
  }

  bool isloading = false;

  void load(bool value) {
    isloading = value;
    update();
  }

  void setmemoryman(int value) {
    man = value;
    update();
  }

  void setmemoryimage(String value) {
    base64String = value;
    update();
  }

  void setlogout() {
    index = 0;
    heightman = 350;
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
    selectgoal = '';
    selectfocusarea = 0;
    initheight = 160;
    initweight = 60;
    pickedimage = null;
    days = [];
    time = TimeOfDay.now();
    selectill = 0;
    percent = 1 / 6;
    base64String = null;
    update();
  }
}
