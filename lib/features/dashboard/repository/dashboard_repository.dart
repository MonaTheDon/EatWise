import 'dart:convert';

import 'package:eatwise/models/entity.dart';
import 'package:eatwise/constants.dart';
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

  static Future<List<Recipe>> getRecipesbyIng(String ingredients) async {
    List<Recipe> recipes = [];
    var ingString = ingredients;
    final response = await http.get(Uri.parse(
        "https://cosylab.iiitd.edu.in/rdbapi/recipeDB/searchRecipeByIngUsed/$ingString"));
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body) as List<dynamic>;
      for (int i = 0; i < data.length; i++) {
        recipes.add(Recipe.fromMap(data[i]));
      }
    } else {
      debugPrint("Response Status ${response.statusCode}");
    }
    return recipes;
  }

  Future<int> getIdOfAnEntity(String recName) async {
    final response = await http.get(
        Uri.parse(
            "https://cosylab.iiitd.edu.in/api/entity/getentities?name=$recName"),
        headers: {
          "Authorization": "Bearer $authToken_FlavorDB",
        });
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body) as List<dynamic>;
      //   for(int i=0;i<data.length;i++){
      //   recipes.add(Recipe.fromMap(data[i]));
      // }
      return data.first['entity_id'];
    } else {
      debugPrint(response.statusCode.toString());
      return -1;
    }
  }

  Future<List<Entity>> getFoodAnalysis(String recName) async {
    List<Entity> entities = [];
    final response1 = await getIdOfAnEntity(recName);
    final response = await http.get(
        Uri.parse(
            "https://cosylab.iiitd.edu.in/api/foodPairingAnalysis/${response1}"),
        headers: {
          "Authorization": "Bearer $authToken_FlavorDB",
        });
    if (response.statusCode == 200) {
      debugPrint(response.body);
      var data = jsonDecode(response.body) as Map<String,dynamic>;
      for (int i = 0; i < data['similar_entities'].length; i++) {
        entities.add(Entity.fromMap(data['similar_entities'][i]));
      }
    } else {
      debugPrint("Response Status ${response.statusCode}");
    }
    return entities;
  }

  static Future<Recipe> getRecipeById({required String recipeId}) async {
    Recipe recipe = Recipe();
    final response = await http.get(Uri.parse(
        "https://cosylab.iiitd.edu.in/rdbapi/recipeDB/getrecipe?recipeId=${recipeId}"));

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body) as Map<String, dynamic>;
      recipe = Recipe.fromMap(data);
    } else {
      debugPrint(response.statusCode.toString());
      debugPrint(response.body);
    }
    recipe.recipeId!.isNotEmpty
        ? debugPrint(
            "${recipe.recipeName.toString()} ${recipe.imageUrl.toString()}}")
        : debugPrint("No recipes found");
    return recipe;
  }

  static Future<List<String>> getIngredientsWithPhrases(int recipeId) async {
    List<String> ingredientPhrases = [];
    final response = await http.get(
        Uri.parse(
            "https://cosylab.iiitd.edu.in/api/recipeDB/getingredientsbyrecipe/$recipeId"),
        headers: {
          "Authorization": "Bearer $authToken",
        });

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body) as List<dynamic>;
      debugPrint("data is $data");
      for (int i = 0; i < data.length; i++) {
        ingredientPhrases.add(data[i]["ingredient_Phrase"]);
      }
    } else {
      debugPrint(response.statusCode.toString());
      debugPrint(response.body);
    }
    ingredientPhrases.isNotEmpty
        ? debugPrint("${ingredientPhrases.first.toString()}")
        : debugPrint("No ingredients found");
    return ingredientPhrases;
  }

  static Future<List<String>> getProcedureForARecipe(int id) async {
    List<String> procedure = [];
    final response = await http.get(
        Uri.parse("https://cosylab.iiitd.edu.in/api/instructions/$id"),
        headers: {
          "Authorization": "Bearer $authToken",
        });
    if (response.statusCode == 200) {
      final data = response.body;
      procedure = data
          .splitMapJoin(
            RegExp(r'\. |; '),
            onMatch: (match) => '\n', // Replace matches with a newline
            onNonMatch: (nonMatch) => nonMatch.trim(), // Trim non-matches
          )
          .split('\n');
    } else {
      debugPrint(response.statusCode.toString());
      debugPrint(response.body);
    }
    return procedure;
  }

  static Future<Recipe> getRecipeOfTheDay() async {
    Recipe recipe = Recipe();
    final response = await http.get(
        Uri.parse("https://cosylab.iiitd.edu.in/api/recipeDB/recipeoftheday"),
        headers: {
          "Authorization": "Bearer $authToken",
        });

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body) as Map<String, dynamic>;
      recipe = Recipe.fromMap(data);
    } else {
      debugPrint(response.statusCode.toString());
      debugPrint(response.body);
    }
    recipe.recipeId!.isNotEmpty
        ? debugPrint(
            "For recipe of the day ${recipe.recipeName.toString()} ${recipe.imageUrl.toString()}}")
        : debugPrint("No recipes found");
    return recipe;
  }
}
