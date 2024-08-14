import 'dart:convert';

import 'package:fitnessapp/constans.dart';
import 'package:fitnessapp/main.dart';
import 'package:fitnessapp/models/notification_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class NotificationController extends GetxController {
  List<NotificationModel> notificationsList = [];
  bool notificationLoading = false;
  Future getAllNotifications() async {
    debugPrint('{userInfo!.getString: ${userInfo!.getString('token')}');

    notificationLoading = true;
    notificationsList = [];
    update();
    final response = await http.get(
        Uri.parse(
          "${Constans.baseUrl}notifications",
        ),
        headers: {
          'Accept': 'application/json',
          'Authorization': 'Bearer ${userInfo!.getString('token')}'
        });
    notificationLoading = false;
    update();
    var data = jsonDecode(response.body);
    debugPrint('data: ${data}');
    if (response.statusCode == 200) {
      for (var i = 0; i < data.length; i++) {
        notificationsList.add(NotificationModel.fromJson(data[i]));
      }
      return notificationsList;
    }
    return [];
  }
}
