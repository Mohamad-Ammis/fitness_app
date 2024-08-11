import 'package:fitnessapp/constans.dart';
import 'package:fitnessapp/main.dart';
import 'package:fitnessapp/models/meal.dart';
import 'package:fitnessapp/services/api2.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class ControllerRecently extends GetxController {
  List<Meal> recentlyList = [];

  Future<List<Meal>?> getRecentlyMeal() async {
    try {
      Map<dynamic, dynamic> jsonData = await Api().get(
          url: "${Constans.baseUrl}admin/meal/latestMeals",
          token: userInfo?.getString("token"));

      jsonData.forEach((key, value) {
        recentlyList.add(Meal.fromJson1(value));
      });

      return recentlyList;
    } catch (e) {
      Get.snackbar(
        'Error',
        'No Internet. Please try again later.',
      );
      return null;
    }
  }
}
