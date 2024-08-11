import 'package:fitnessapp/main.dart';
import 'package:flutter/material.dart';

class Constans {
  static const String fontFamily = 'Work Sans';
  static const String host = '192.168.252.225';
  static const String baseUrl = 'http://$host:8000/api/trainer/';
  static const String mainbaseUrl = 'http://$host:8000/api/';
  static const String mainbaseUrlimage = 'http://$host:8000/';
  static const String apikey =
      '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';

  static const Color primaryColor = Colors.white;
  static const Color secondryColor = Color(0xFFC0D8F2);
  static Color subTitleColor = Colors.white.withOpacity(0.7);
  static Color test = const Color.fromARGB(255, 38, 164, 170);
  static Color test2 = const Color.fromARGB(255, 98, 189, 143);
  static const Color shopColor = Color(0xFF6F89E0);
  static const Color shopLightColor = Color(0xFFCAD5FF);

  static const Color screen = Color(0xfff3f4f6);
  static const Color foodblue = Color.fromARGB(255, 121, 147, 178);
  static String? token = userInfo!.getString("token");
}//Enter code that we have sent to your email your...@domain.com