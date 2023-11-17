import 'dart:convert';

import 'package:eatwise/models/recipe.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class DashboardRepository {
  static Future<List<Recipe>> getRecipesAccordingToUserPrefs({
    required List<int> calories,
    required List<int> proteins,
    required List<int> carbohydrates,
    required List<int> fat,
    required List<int> energy,
    required String country,
    String? ingredientNotUsed,
    String? categoryNotUsed,
  }) async {
    List<Recipe> recipe = [];
    final response = await http.get(Uri.parse(
        "https://cosylab.iiitd.edu.in/rdbapi/recipeDB/searchrecipe?country=${country}&ingredientNotUsed=${ingredientNotUsed}&energy=${energy[0]}:${energy[1]}&protein=${proteins[0]}:${proteins[1]}&fat=${fat[0]}:${fat[1]}&advancedSearch=true&categoryNotUsed=$categoryNotUsed"));

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body) as List<dynamic>;
      debugPrint("The length of recipes recieved is ${data.length.toString()}");
      for (int i = 0; i < data.length; i++) {
        recipe.add(Recipe.fromMap(data[i]));
      }
    } else {
      debugPrint(response.statusCode.toString());
      debugPrint(response.body);
    }
    recipe.isNotEmpty
        ? debugPrint(
            "${recipe.first.recipeName.toString()} ${recipe.first.imageUrl.toString()}}")
        : debugPrint("No recipes found");
    return recipe;
  }
}
