import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class Recipe {
  String? recipeId;
  String? recipeName;
  String? cookTime; //total_time key is taken
  String? servings;
  bool? isVegan;
  String? imageUrl;
  String? subRegion;
  double? energy; //energykcal key is taken
  double? protein;
  double? calories;
  double? fat;
  double? carbohydrates; //carbohydratesbydifference key is taken
  List<String>? utensils;
  List<String>? ingredients;
  Recipe({
    this.recipeId,
    this.recipeName,
    this.cookTime,
    this.servings,
    this.isVegan,
    this.imageUrl,
    this.subRegion,
    this.energy,
    this.protein,
    this.calories,
    this.fat,
    this.carbohydrates,
    this.utensils,
    this.ingredients,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'recipe_id': recipeId,
      'recipe_title': recipeName,
      'total_time': cookTime,
      'servings': servings,
      'vegan': isVegan,
      'img_url': imageUrl,
      'sub_region': subRegion,
      'energykcal': energy,
      'protein': protein,
      'calories': calories,
      'fat': fat,
      'carbohydratesbydifference': carbohydrates,
      'utensils': utensils,
      'ingredients': ingredients,
    };
  }

  static List<String> formatUtensils(String data) {
    List<String> utensils = data.split("||");
    return utensils;
  }

  factory Recipe.fromMap(Map<String, dynamic> map) {
    return Recipe(
      recipeId: map['recipe_id'] != null ? map['recipe_id'].toString() : null,
      recipeName:
          map['recipe_title'] != null ? map['recipe_title'] as String : null,
      cookTime: map['total_time'] != null ? map['total_time'].toString() : null,
      servings: map['servings'] != null ? map['servings'].toString() : null,
      isVegan:
          map['vegan'] != null ? (map['vegan'] == 0.0 ? false : true) : null,
      imageUrl: map['img_url'] != null ? map['img_url'] as String : null,
      subRegion: map['sub_region'] != null ? map['sub_region'] as String : null,
      energy: map['energykcal'] != null ? map['energykcal'] as double : null,
      protein: map['protein'] != null ? map['protein'] as double : null,
      calories: map['calories'] != null ? map['calories'] as double : null,
      fat: map['fat'] != null ? map['fat'] as double : null,
      carbohydrates: map['carbohydratesbydifference'] != null
          ? map['carbohydratesbydifference'] as double
          : null,
      utensils: (map['utensils'] != null &&
              map['utensils'].runtimeType.toString() == "String")
          ? formatUtensils(map['utensils'] as String)
          : map['utensils'] != null
              ? List<String>.from((map['utensils'] as List<dynamic>))
              : null,
      ingredients: map['ingredients'] != null
          ? List<String>.from((map['ingredients'] as List<dynamic>))
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Recipe.fromJson(String source) =>
      Recipe.fromMap(json.decode(source) as Map<String, dynamic>);
}
