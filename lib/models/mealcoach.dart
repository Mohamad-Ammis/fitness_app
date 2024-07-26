import 'package:fitnessapp/models/Ingredient.dart';

class Meal {
  int? id;
  String? name;
  String? image;
  String? protein;
  String? calories;
  String? warning;
  String? preparation;
  String? description;
  String? categoryName;
  String? type;
  List<Ingredient>? ingredient;
  bool? isfavorite;

  Meal(
      {this.id,
      this.name,
      this.image,
      this.protein,
      this.calories,
      this.warning,
      this.description,
      this.preparation,
      this.categoryName,
      this.type,
      this.ingredient,
      this.isfavorite});
}