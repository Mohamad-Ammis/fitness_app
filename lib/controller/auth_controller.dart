import 'dart:convert';

import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:fitnessapp/constans.dart';
import 'package:fitnessapp/helper/custom_snack_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class AuthController extends GetxController {
  String email = '';
  String password = '';
  String confirmPassword = '';
  String userName = '';
  Color otpBorderColor=Colors.black;
  bool isLoading=false;
  bool otpReadOnly=false;
  bool otpAutoFocuse=true;
  Future<bool> logIn(
      String userEmail, String pass, BuildContext context) async {
    final response = await http.post(
      Uri.parse('${Constans.baseUrl}login'),
      headers: <String, String>{
        'Content-Type': 'application/json',
      },
      body: jsonEncode(<String, dynamic>{
        'email': userEmail,
        'password': pass,
      }),
    );
    debugPrint('response: ${response.body}');
    if (response.statusCode == 200) {
      ScaffoldMessenger.of(context)
        ..hideCurrentSnackBar()
        ..showSnackBar(CustomSnackBar().customSnackBar('Congratulations',
            'You have been logged in Successfully', ContentType.success));

      return true;
    } else if (response.statusCode == 500) {
      ScaffoldMessenger.of(context)
        ..hideCurrentSnackBar()
        ..showSnackBar(CustomSnackBar().customSnackBar(
            'Oops', 'Error is server please try again!', ContentType.failure));
      return false;
    } else {
      ScaffoldMessenger.of(context)
        ..hideCurrentSnackBar()
        ..showSnackBar(CustomSnackBar().customSnackBar(
            'Oops', 'Error in email or password!', ContentType.failure));
      return false;
    }
  }
  Future<bool> register(String name,
      String userEmail, String pass,String confirmPass,BuildContext context) async {
    final response = await http.post(
      Uri.parse('${Constans.baseUrl}register'),
      headers: <String, String>{
        'Content-Type': 'application/json',
      },
      body: jsonEncode(<String, dynamic>{
        'name':name,
        'email': userEmail,
        'password': pass,
        'password_confirmation':confirmPass
      }),
    );
    var data=jsonDecode(response.body);
    debugPrint('response: ${data}');
    if (response.statusCode == 200) {
      ScaffoldMessenger.of(context)
        ..hideCurrentSnackBar()
        ..showSnackBar(CustomSnackBar().customSnackBar('Greate job',
            'Check your email to complete register', ContentType.help));
      return true;
    } else if (response.statusCode == 500) {
      ScaffoldMessenger.of(context)
        ..hideCurrentSnackBar()
        ..showSnackBar(CustomSnackBar().customSnackBar(
            'Oops', 'Error is server please try again!', ContentType.failure));
      return false;
    } else {
      ScaffoldMessenger.of(context)
        ..hideCurrentSnackBar()
        ..showSnackBar(CustomSnackBar().customSnackBar(
            'Oops', 'Error in email or password!', ContentType.failure));
      return false;
    }
  }
    Future<bool> registerVerification(String code,BuildContext context) async {
    try {
  final response = await http.post(
    Uri.parse('http://${Constans.host}:8000/api/verfiy'),
    headers: <String, String>{
      'Content-Type': 'application/json',
    },
    body: jsonEncode(<String, dynamic>{
      'code':code
    }),
  );
  var data=jsonDecode(response.body);
  debugPrint('response: ${data}');
  debugPrint('status code${response.statusCode}');
  if (response.statusCode == 201) {
    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(CustomSnackBar().customSnackBar('Successfully',
          'You have been registered successfully', ContentType.success));
    return true;
  } else if (response.statusCode == 500) {
    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(CustomSnackBar().customSnackBar(
          'Oops', 'Error is server please try again!', ContentType.failure));
    return false;
  } else {
    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(CustomSnackBar().customSnackBar(
          'Oops', 'Error happened in verification code!', ContentType.failure));
    return false;
  }
} on Exception catch (e) {
  debugPrint('e: ${e}');
  return false;
  
}
  }
}
