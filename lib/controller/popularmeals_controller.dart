import 'package:fitnessapp/constans.dart';
import 'package:fitnessapp/models/meal.dart';
import 'package:fitnessapp/services/api2.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class ControllerPopular extends GetxController {
  List<Meal> popularList = [];
  Future<List<Meal>?> getPopularMeal() async {
    try {
      Map<dynamic, dynamic> jsonData = await Api().get(
          url: "${Constans.baseUrl}admin/meal/popular", token: Constans.token);

      for (var i = 0; i < jsonData["data"].length; i++) {
        popularList.add(Meal.fromJson(jsonData["data"], i));
      }
      return popularList;
    } catch (e) {
      Get.snackbar(
        'Error',
        'No Internet. Please try again later.',
      );
      return null;
    }
  }
}
