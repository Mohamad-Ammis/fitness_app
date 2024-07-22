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

  factory Meal.fromJson(dynamic jsonData, int i) {
    // Check if 'ingredients' array is not empty
    List<Ingredient>? ingredient = [];
    if (jsonData[i]["ingredients"] != null &&
        jsonData[i]["ingredients"].isNotEmpty) {
      for (var j = 0; j < jsonData[i]["ingredients"].length; j++) {
        ingredient.add(Ingredient.fromJson(jsonData[i]["ingredients"][j]));
      }
    }
    return Meal(
        id: jsonData[i]["id"],
        name: jsonData[i]["name"],
        image: jsonData[i]["image"],
        protein: jsonData[i]["protein"],
        calories: jsonData[i]["calories"],
        description: jsonData[i]["description"],
        preparation: jsonData[i]["preparation_method"],
        categoryName: jsonData[i]["categoryName"],
        type: jsonData[i]["type"],
        warning: jsonData[i]["warning"],
        ingredient: ingredient,
        isfavorite: jsonData[i]["isfavorite"]);
  }
  factory Meal.fromJson1(dynamic jsonData) {
    // Check if 'ingredients' array is not empty
    List<Ingredient>? ingredient = [];
    if (jsonData["ingredients"] != null && jsonData["ingredients"].isNotEmpty) {
      for (var j = 0; j < jsonData["ingredients"].length; j++) {
        ingredient.add(Ingredient.fromJson(jsonData["ingredients"][j]));
      }
    }
    return Meal(
        id: jsonData["id"],
        name: jsonData["name"],
        image: jsonData["image"],
        protein: jsonData["protein"],
        calories: jsonData["calories"],
        description: jsonData["description"],
        preparation: jsonData["preparation_method"],
        categoryName: jsonData["categoryName"],
        type: jsonData["type"],
        warning: jsonData["warning"],
        ingredient: ingredient,
        isfavorite: jsonData["isfavorite"]);
  }
}

class Ingredient {
  String? name;
  String? image;

  Ingredient({this.image, this.name});

  factory Ingredient.fromJson(jsonData) {
    return Ingredient(name: jsonData["name"], image: jsonData["image"]);
  }
}
