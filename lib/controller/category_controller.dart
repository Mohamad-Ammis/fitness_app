import 'package:fitnessapp/constans.dart';
import 'package:fitnessapp/main.dart';
import 'package:fitnessapp/models/meal.dart';
import 'package:fitnessapp/services/api2.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class ControllerCategory extends GetxController {
  List<Meal> categorylist = [];
  Future<List<Meal>?> postCategory({required String categoryName}) async {
    try {
      Map<dynamic, dynamic> jsonData = await Api().post(
          url: "${Constans.baseUrl}admin/meal/showByCategory",
          body: {"categoryName": categoryName},
          token: userInfo?.getString("token"));

      for (var i = 0; i < jsonData["data"].length; i++) {
        categorylist.add(Meal.fromJson(jsonData["data"], i));
      }
      update();
      return categorylist;
    } catch (e) {
      Get.snackbar(
        'Error',
        'No Internet. Please try again later.',
      );
      return null;
    }
  }

  List<Meal> typeList = [];
  Future<List<Meal>?> postType(
      {required String categoryName, required String type}) async {
    try {
      Map<dynamic, dynamic> jsonData = await Api().post(
          url: "${Constans.baseUrl}admin/meal/show",
          body: {"categoryName": categoryName, "type": type},
          token: userInfo?.getString("token"));
      for (var i = 0; i < jsonData["data"].length; i++) {
        typeList.add(Meal.fromJson(jsonData["data"], i));
      }
      update();
      return typeList;
    } catch (e) {
      Get.snackbar(
        'Error',
        'No Internet. Please try again later.',
      );
      return null;
    }
  }

  Future<void> getMealId(int? mealId) async {
    await Api().get(
        url: "${Constans.baseUrl}meal/byId/$mealId",
        token: userInfo?.getString("token"));
        
  }
}
