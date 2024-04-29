import 'dart:convert';

import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:fitnessapp/helper/custom_snack_bar.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Api {
  Future<http.Response> post(
      {required String url,
      required Map<String, dynamic> body,
      String? token,
      String? successTitle,
      String? successDesc,
      String? failureDesc,
      ContentType? successContentType,
      required BuildContext context}) async {
    final response = await http.post(
      Uri.parse(url),
      headers: token != null
          ? <String, String>{
              'Content-Type': 'application/json',
              'Authorization': 'Bearer $token'
            }
          : <String, String>{
              'Content-Type': 'application/json',
            },
      body: jsonEncode(body),
    );
    
    var respnseDecode=jsonDecode(response.body);
    debugPrint('response: $respnseDecode');
    debugPrint('response: ${response.statusCode}');
    var data=response;
    if (response.statusCode == 200||response.statusCode==201) {
      ScaffoldMessenger.of(context)
        ..hideCurrentSnackBar()
        ..showSnackBar(CustomSnackBar().customSnackBar(
            successTitle ?? 'Congratulations',
            successDesc ?? 'You have been logged in Successfully',
            successContentType ?? ContentType.success));

      return data;
    } else if (response.statusCode == 500) {
      ScaffoldMessenger.of(context)
        ..hideCurrentSnackBar()
        ..showSnackBar(CustomSnackBar().customSnackBar(
            'Oops', 'Error is server please try again!', ContentType.failure));
      return data;
    } else {
      ScaffoldMessenger.of(context)
        ..hideCurrentSnackBar()
        ..showSnackBar(CustomSnackBar().customSnackBar('Oops',
            failureDesc ?? 'Some thing went wrong!', ContentType.failure));
      return data;
    }
  }
}
