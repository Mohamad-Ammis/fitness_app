import 'dart:convert';
import 'package:fitnessapp/controller/datacont.dart';
import 'package:fitnessapp/models/ranex.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class Gymcontroller extends GetxController {
  final controller = Get.put(Datacontroller(), permanent: true);
  List<dynamic> articals = [];
  List<dynamic> category = [];
  List<dynamic> randexercise = [];
  List<Randomex> randomexercise = [];
  bool load = false;

  Future<void> getartical() async {
    final String url = '${controller.baseurl}articl/allArticls';
    try {
      final res = await http.get(Uri.parse(url), headers: {
        'Accept': 'application/json',
      });
      if (res.statusCode == 200) {
        final resdata = json.decode(res.body);
        articals = resdata as List<dynamic>;
      } else {
        throw "Something wrong , please try again";
      }
    } catch (errore) {
      throw '$errore';
    }
  }

  Future<void> getCat() async {
    final String url = '${controller.baseurl}category/show';
    try {
      final res = await http.get(Uri.parse(url), headers: {
        'Accept': 'application/json',
      });
      if (res.statusCode == 200) {
        final resdata = json.decode(res.body);
        category = resdata["data"] as List<dynamic>;
      } else {
        throw "Something wrong , please try again";
      }
    } catch (errore) {
      throw '$errore';
    }
  }

  Future<void> getrandomexercise() async {
    final String url = '${controller.baseurl}trainer/exerciseType/getType';
    try {
      final res = await http.get(Uri.parse(url), headers: {
        'Accept': 'application/json',
        'Authorization': 'Bearer ${controller.token}',
      });
      if (res.statusCode == 200) {
        final resdata = json.decode(res.body);
        randexercise = resdata["data"] as List<dynamic>;
        for (int i = 0; i < randexercise.length; i++) {
          Randomex test = Randomex(
              title: randexercise[i]["name"],
              des: randexercise[i]["description"],
              img: randexercise[i]["image"],
              id: randexercise[i]["id"].toString());
          randomexercise.add(test);
        }
        load = true;
      } else {
        throw "Something wrong , please try again";
      }
    } catch (errore) {
      throw '$errore';
    }
  }
}
