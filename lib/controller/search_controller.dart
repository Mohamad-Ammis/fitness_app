import 'package:fitnessapp/constans.dart';
import 'package:fitnessapp/models/meal.dart';
import 'package:fitnessapp/services/api2.dart';
import 'package:get/get.dart';

class ControllerSearch extends GetxController {
  List<Meal> searchlist = [];
  Future<List<Meal>?> postSearch(
      {required String mealName,
      required String start,
      required String limit}) async {
    try {
      Map<dynamic, dynamic> jsonData = await Api().post(
          url: "${Constans.baseUrl}admin/meal/search",
          body: {"search_text": mealName, "start": start, "limit": limit},
          token: Constans.token);

      for (var i = 0; i < jsonData["data"].length; i++) {
        searchlist.add(Meal.fromJson(jsonData["data"], i));
      }
      return searchlist;
    } catch (e) {
      Get.snackbar(
        'Error',
        'No Internet. Please try again later.',
      );
      return null;
    }
  }
}
