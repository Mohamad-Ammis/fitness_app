import 'package:fitnessapp/constans.dart';
import 'package:fitnessapp/models/meal.dart';
import 'package:fitnessapp/services/api2.dart';
import 'package:get/get.dart';

class ControllerFavorite extends GetxController {
  List<Meal> favoriteList = [];
  Future<void> addToFavorites(int? mealId) async {
    await Api().get(
        url: "${Constans.baseUrl}meal/AddMealToFavoritesList/$mealId",
        token: Constans.token);
  }

  Future<List<Meal>?> getFavoriteMeals() async {
    try {
      Map<dynamic, dynamic> jsonData = await Api().get(
          url: "${Constans.baseUrl}meal/GetFavoritesList",
          token: Constans.token);

      for (var i = 0; i < jsonData["meal"].length; i++) {
        favoriteList.add(Meal.fromJson(jsonData["meal"], i));
      }

      return favoriteList;
    } catch (e) {
      Get.snackbar(
        'Error',
        'No Internet. Please try again later.',
      );
      return [];
    }
  }

  Future<void> removeFavorites(int? mealId) async {
    await Api().delete(
        url: "${Constans.baseUrl}meal/deleteFromFavorite/$mealId",
        token: Constans.token);
  }
}
