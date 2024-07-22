import 'dart:convert';
// ignore_for_file: avoid_print
import 'package:fitnessapp/constans.dart';
import 'package:http/http.dart' as http;

class Api {
  Future get({required String url, String? token}) async {
    Map<String, String> headers = {};
    if (token != null) {
      headers.addAll({
        "Content-Type": "application/json",
        "Authorization": "Bearer $token",
      });
    } else {
      headers.addAll({"Content-Type": "application/json"});
    }
    try {
      final response = await http.get(Uri.parse(url), headers: headers);
      if (response.statusCode == 200) {
        print(Constans.token);
        return jsonDecode(response.body);
      }
      if (response.statusCode == 500) {
        throw " No Intrnet, Try again";
      } else {
        print(
            'There is problem ${response.body} and The statuscode is invalid : ${response.statusCode}');
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<dynamic> post(
      {required String url, dynamic body, String? token}) async {
    Map<String, String> headers = {};
    if (token != null) {
      headers.addAll(
          {"Authorization": "Bearer $token", "Accept": "application/json"});
    } else {
      headers.addAll({"Accept": "application/json"});
    }
    try {
      http.Response response =
          await http.post(Uri.parse(url), body: body, headers: headers);
      if (response.statusCode == 200) {
        print(Constans.token);
        return jsonDecode(response.body);
      }
      if (response.statusCode == 500) {
        throw " No Intrnet, Try again";
      } else {
        print(
            'There is problem ${response.body} and The statuscode is invalid : ${response.statusCode}');
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<dynamic> delete({required String url, String? token}) async {
    Map<String, String> headers = {};
    if (token != null) {
      headers.addAll(
          {"Authorization": "Bearer $token", "Accept": "application/json"});
    } else {
      headers.addAll({"Accept": "application/json"});
    }
    http.Response response =
        await http.delete(Uri.parse(url), headers: headers);
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      print(
          'There is problem ${response.body} and The statuscode is invalid : ${response.statusCode}');
    }
  }
}
