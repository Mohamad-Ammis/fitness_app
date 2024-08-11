import 'dart:io';
// ignore_for_file: avoid_print
import 'package:fitnessapp/constans.dart';
import 'package:fitnessapp/main.dart';
import 'package:fitnessapp/services/api2.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
// import 'package:video_player/video_player.dart';

class Controller extends GetxController {
  final picker = ImagePicker();
  File? image;
  Future getImage() async {
    final pickedImage = await picker.pickImage(source: ImageSource.gallery);
    if (pickedImage != null) {
      image = File(pickedImage.path);
    } else {
      "No pic ";
    }
    update();
  }

  // VideoPlayerController? videoController;

  // File? video;
  // Future getVideo() async {
  //   final pickedVideo = await picker.pickVideo(source: ImageSource.gallery);

  //   if (pickedVideo != null) {
  //     video = File(pickedVideo.path);
  //     videoController = VideoPlayerController.file(video!)
  //       ..initialize().then((_) {
  //         update();
  //         videoController!.play();
  //       });
  //   } else {
  //     "No video";
  //   }
  // }

  bool? val;
  bool? sunday = false;
  bool? monday = false;
  bool? tuesday = false;
  bool? wednesday = false;
  bool? thursday = false;
  bool? friday = false;
  bool? saturday = false;
  List<int> days = [];

  void setdays(int a) {
    if (days.contains(a)) {
      days.remove(a);
    } else {
      days.add(a);
    }
    update();
  }

  updateDay1(bool val) {
    sunday = val;
    setdays(1);
    update();
  }

  updateDay2(bool val) {
    monday = val;
    setdays(2);
    update();
  }

  updateDay3(bool val) {
    tuesday = val;
    setdays(3);
    update();
  }

  updateDay4(bool val) {
    wednesday = val;
    setdays(4);
    update();
  }

  updateDay5(bool val) {
    thursday = val;
    setdays(5);
    update();
  }

  updateDay6(bool val) {
    friday = val;
    setdays(6);
    update();
  }

  updateday7(bool val) {
    saturday = val;
    setdays(7);
    update();
  }

  String name = "";
  String bio = "";
  String height = "";
  String weight = "";
  String currentpassword = "";
  String newpassword = "";
  String confimnewpassword = "";
  String oldPassword = "Kmkok_1123";

  GlobalKey<FormState> formKeypass = GlobalKey();
  GlobalKey<FormState> formKeyAll = GlobalKey();

  TextEditingController currentPass = TextEditingController();
  TextEditingController confimPass = TextEditingController();
  TextEditingController newPass = TextEditingController();

  Map<String, String> data = {'name': '', 'bio': '', 'tall': '', 'weight': ''};
  void setData() {
    data["name"] = name;
    data["bio"] = bio;
    data["tall"] = height;
    data["weight"] = weight;
  }

  Future<int> postUserInfo() async {
    var headers = {
      'Accept': 'application/json',
      'Authorization': 'Bearer ${userInfo?.getString("token")}'
    };
    try {
      var request =
          http.MultipartRequest('POST', Uri.parse('${Constans.baseUrl}info'));
      request.fields.addAll(data);
      request.files
          .add(await http.MultipartFile.fromPath('image', image!.path));
      request.headers.addAll(headers);

      http.StreamedResponse response = await request.send();
      if (response.statusCode == 200) {
        print("successful $image");
        return 200;
        // print(await response.stream.bytesToString());
      }
      else if (response.statusCode == 422) {
        print("successful $image");
        Get.snackbar(
          'Error',
          'Data not fetched',
        );
      }
      else if (response.statusCode == 500) {
        
        throw " No Intrnet, Try again";
        
      } else {
        // print(response.reasonPhrase);
        // print(response.statusCode.toString());
      }
      update();
      return response.statusCode;
    } catch (e) {
      rethrow;
    }
  }

  Future<void> postPassword(
      String oldpass, String newpass, String confnewpass) async {
    await Api().post(
        url: "${Constans.baseUrl}password",
        body: {
          'old_password': oldpass,
          'password': newpass,
          'password_confirmation': confnewpass
        },
        token: userInfo?.getString("token"));
    update();
  }

  bool isLoadingpass = false;

  isLoadingTure() {
    isLoadingpass = true;
    update();
  }

  isLoadingFalse() {
    isLoadingpass = false;
    update();
  }
}
