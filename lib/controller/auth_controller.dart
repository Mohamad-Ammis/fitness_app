// ignore_for_file: use_build_context_synchronously

import 'dart:convert';

import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:fitnessapp/constans.dart';
import 'package:fitnessapp/main.dart';
import 'package:fitnessapp/services/api.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class AuthController extends GetxController {
  String email = '';
  String password = '';
  String confirmPassword = '';
  String userName = '';
  Color otpBorderColor = Colors.black;
  Color otpEnabledBorderColor = Colors.transparent;
  bool isLoading = false;
  bool otpReadOnly = false;
  bool otpAutoFocuse = true;
  var autovalidateMode = AutovalidateMode.disabled;
  String verificationCode = '';
  Future<http.Response> logIn(
      String userEmail, String pass, BuildContext context) {
    var data = Api().post(
        url: '${Constans.baseUrl}login',
        body: <String, dynamic>{
          'email': userEmail,
          'password': pass,
        },
        context: context,
        successTitle: 'Congratulations',
        successContentType: ContentType.success,
        successDesc: 'You have been logged in Successfully',
        failureDesc: 'Error in email or password! ');

    return data;
  }

  Future<http.Response> register(String name, String userEmail, String pass,
      String confirmPass, BuildContext context) async {
    var data = Api().post(
        url: '${Constans.baseUrl}register',
        body: <String, dynamic>{
          'name': name,
          'email': userEmail,
          'password': pass,
          'password_confirmation': confirmPass
        },
        context: context,
        successTitle: 'Greate job',
        successContentType: ContentType.help,
        successDesc: 'Check your email to complete register',
        failureDesc: 'Error in email or password! ');
    return data;
  }

  Future<http.Response> registerVerification(
      String code, BuildContext context) async {
    var data = Api().post(
        url: 'http://${Constans.host}:8000/api/verfiy',
        body: <String, dynamic>{'code': code},
        context: context,
        successDesc: 'You have been registered successfully');
    return data;
  }

  Future<http.Response> forgotPassword(
      String userEmail, BuildContext context) async {
    var data = Api().post(
        url: '${Constans.baseUrl}forgotPasswor',
        body: <String, dynamic>{
          'email': userEmail,
        },
        context: context,
        successTitle: 'Good Job',
        successDesc: 'we send verification code to your email ',
        successContentType: ContentType.help);
    return data;
  }

  Future<http.Response> verifyForgotPassword(
      String code, BuildContext context) async {
    var data = Api().post(
        url: '${Constans.baseUrl}forgotPassword/verfiy',
        body: <String, dynamic>{
          'code': code,
        },
        context: context,
        successTitle: 'Well Done',
        successContentType: ContentType.help,
        successDesc: 'Update your password');
    return data;
  }

  Future<http.Response> resetPassword(String userEmail, String code,
      String pass, String confirmPass, BuildContext context) async {
    var data = Api().post(
        url: '${Constans.baseUrl}password/reset',
        body: <String, dynamic>{
          'email': userEmail,
          'code': code,
          'password': pass,
          'password_confirmation': confirmPassword
        },
        context: context,
        successTitle: 'Successfully',
        successDesc: 'Your Password has been updated successfully');
    return data;
  }

  Future<bool> logout() async {
    final response = await http.get(
      Uri.parse('${Constans.baseUrl}logout'),
      headers: <String, String>{
        'Accept': 'application/json',
        'Authorization': 'Bearer ${userInfo!.getString('token')}',
      },
    );
    if (response.statusCode == 200) {
      return true;
    } else {
      debugPrint(jsonDecode(response.body));
      return false;
    }
  }

  Future<bool> resendCode() async {
    final response = await http.post(
        Uri.parse('${Constans.baseUrl}password/resend'),
        headers: <String, String>{
          'Accept': 'application/json',
        },
        body: {
          'email': email
        });
    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }
}
