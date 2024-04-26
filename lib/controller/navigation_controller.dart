import 'package:fitnessapp/views/workout_page/gym.dart';
import 'package:fitnessapp/views/workout_page/widgets/workout_page_body.dart';
import 'package:get/get.dart';
class NavigationController extends GetxController{
  int selectedIndex=0;
List screens=[
Home_gym(),
WorkoutPageBody(),
WorkoutPageBody(),
WorkoutPageBody(),
];
}