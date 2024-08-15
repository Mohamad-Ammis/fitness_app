import 'dart:convert';
import 'dart:io';
// ignore_for_file: avoid_print
import 'package:fitnessapp/constans.dart';
import 'package:fitnessapp/controller/datacont.dart';
import 'package:fitnessapp/main.dart';
import 'package:fitnessapp/services/api2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';

class Controller extends GetxController {
  Datacontroller cont = Get.put(Datacontroller(), permanent: true);
  final picker = ImagePicker();
  File? image;
  List<int> imageBytes = [];
  String? base64String;
  Future getImage() async {
    final pickedImage = await picker.pickImage(source: ImageSource.gallery);
    if (pickedImage != null) {
      image = File(pickedImage.path);
      imageBytes = await image!.readAsBytes();
      base64String = base64Encode(imageBytes);
    } else {
      "No pic ";
    }
    update();
  }

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

  String? name = "";
  String? bio = "";
  String? height;
  String? weight;
  String currentpassword = "";
  String newpassword = "";
  String confimnewpassword = "";

  GlobalKey<FormState> formKeypass = GlobalKey();
  GlobalKey<FormState> formKeyAll = GlobalKey();

  TextEditingController currentPass = TextEditingController();
  TextEditingController confimPass = TextEditingController();
  TextEditingController newPass = TextEditingController();
  TextEditingController heightCon = TextEditingController();
  TextEditingController weightCon = TextEditingController();
  TextEditingController nameCon = TextEditingController();
  TextEditingController bioCon = TextEditingController();

  Future<int> postUserInfo() async {
    var headers = {
      'Accept': 'application/json',
      'Authorization': 'Bearer ${userInfo?.getString("token")}'
    };
    try {
      var request =
          http.MultipartRequest('POST', Uri.parse('${Constans.baseUrl}info'));

      if (nameCon.text.isNotEmpty) {
        request.fields['name'] = nameCon.text;

        userInfo?.setString('name', nameCon.text);
      }
      if (bioCon.text.isNotEmpty) {
        request.fields['bio'] = bioCon.text;
      }
      if (heightCon.text.isNotEmpty) {
        request.fields['tall'] = heightCon.text;
      }
      if (weightCon.text.isNotEmpty) {
        request.fields['weight'] = weightCon.text;
      }
      // request.fields['level'] = "beginner";

      if (image != null) {
        request.files
            .add(await http.MultipartFile.fromPath('image', image!.path));
        if (base64String != null) {
          userInfo?.setString('image', base64String!);
          cont.setmemoryimage(base64String!);

          update();
        }
      }
      if (days.isNotEmpty) {
        for (int i = 0; i < days.length; i++) {
          request.fields["training_days[${i + 1}]"] = days[i].toString();
        }
      }

      request.headers.addAll(headers);

      http.StreamedResponse response = await request.send();
      if (response.statusCode == 200) {
        print(response.stream.toString());
        print(response.reasonPhrase);
        return 200;
      } else if (response.statusCode == 422) {
        print(response.stream.toString());
        print(response.reasonPhrase);

        Get.snackbar(
          'Error',
          'Data not fetched',
        );
      } else if (response.statusCode == 500) {
        print(response.stream.toString());
        print(response.reasonPhrase);
        throw " No Intrnet, Try again";
      } else {}
      update();
      return response.statusCode;
    } catch (e) {
      rethrow;
    }
  }

  Future<int> postPass(
      String oldpass, String newpass, String confnewpass) async {
    Map<String, String> headers = {};

    headers.addAll({
      "Authorization": "Bearer ${userInfo?.getString("token")}",
      "Accept": "application/json"
    });

    try {
      http.Response response =
          await http.post(Uri.parse("${Constans.baseUrl}password"),
              body: {
                'old_password': oldpass,
                'password': newpass,
                'password_confirmation': confnewpass
              },
              headers: headers);

      if (response.statusCode == 200) {
        print(response.body);
        print(response.statusCode);
        return 200;
      } else if (response.statusCode == 401) {
        print(response.body);
        print(response.statusCode);
        Get.snackbar(
          'Error',
          'Your old password does not match with our records',
        );
      } else if (response.statusCode == 500) {
        print(response.body);
        print(response.statusCode);
        throw " No Intrnet, Try again";
      } else {
        print(
            'There is problem ${response.body} and The statuscode is invalid : ${response.statusCode}');
      }
      update();
      return response.statusCode;
    } catch (e) {
      rethrow;
    }
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

  int exercices = 0;
  int calories = 0;
  int minutes = 0;

  Future<void> getReportInfo() async {
    Map<String, dynamic> jsonData = await Api().get(
        url: "${Constans.baseUrl}report/getDailyReport",
        token: userInfo?.getString("token"));
    exercices = jsonData["Number_of_exercises"];
    calories = jsonData["calories"];
    minutes = jsonData["time"];
  }
}
