import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class Recipe {
  int? recipeId;
  String? recipeName;
  int? cookTime; //total_time key is taken
  int? servings;
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
      'recipeId': recipeId,
      'recipeName': recipeName,
      'cookTime': cookTime,
      'servings': servings,
      'isVegan': isVegan,
      'imageUrl': imageUrl,
      'subRegion': subRegion,
      'energy': energy,
      'protein': protein,
      'calories': calories,
      'fat': fat,
      'carbohydrates': carbohydrates,
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
      recipeId: map['recipe_id'] != null ? map['recipe_id'] as int : null,
      recipeName:
          map['recipe_title'] != null ? map['recipe_title'] as String : null,
      cookTime: map['total_time'] != null ? map['total_time'] as int : null,
      servings: map['servings'] != null ? map['servings'] as int : null,
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
      utensils: map['utensils'] != null
          ? formatUtensils(map['utensils'] as String)
          : null,
      ingredients: map['ingredients'] != null
          ? List<String>.from((map['ingredients'] as List<String>))
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Recipe.fromJson(String source) =>
      Recipe.fromMap(json.decode(source) as Map<String, dynamic>);
}
