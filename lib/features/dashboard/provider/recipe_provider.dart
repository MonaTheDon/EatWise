import 'package:flutter/material.dart';

import '../../../models/recipe.dart';
import '../repository/dashboard_repository.dart';

class RecipeProvider with ChangeNotifier {
  List<Recipe> _recipesByUserPrefs = [];
  List<Recipe> _recipeWithIng = [];
  List<Recipe> _favouriteRecipes = [];

  Recipe _recipeById = Recipe();
  Recipe _recipeOfTheDay = Recipe();

  List<Recipe> get recipeWithIng => _recipeWithIng;
  List<Recipe> get recipesByUserPrefs => _recipesByUserPrefs;
  List<Recipe> get favouriteRecipes => _favouriteRecipes;

  Recipe get recipeById => _recipeById;
  Recipe get recipeOfTheDay => _recipeOfTheDay;

  Future<void> getRecipesByUserPrefs({
    required List<int> calories,
    required List<int> proteins,
    required List<int> carbohydrates,
    required List<int> fat,
    required List<int> energy,
    required String country,
    String? ingredientNotUsed,
    String? categoryNotUsed,
  }) async {
    _recipesByUserPrefs =
        await DashboardRepository.getRecipesAccordingToUserPrefs(
      calories: calories,
      proteins: proteins,
      carbohydrates: carbohydrates,
      fat: fat,
      energy: energy,
      country: country,
      ingredientNotUsed: ingredientNotUsed,
      categoryNotUsed: categoryNotUsed,
    );
    notifyListeners();
  }

  Future<void> getRecipesbyIng(String ingredients) async {
    _recipeWithIng = await DashboardRepository.getRecipesbyIng(ingredients);
    notifyListeners();
  }

  Future<void> getRecipeOfTheDay() async {
    _recipeOfTheDay = await DashboardRepository.getRecipeOfTheDay();
    notifyListeners();
  }

  Future<void> addRecipeToFav(Recipe recipe, String uid) async {
    await DashboardRepository.addRecipeToFavourites(recipe, uid);
    _favouriteRecipes.add(recipe);
    notifyListeners();
  }

  Future<void> removeRecipeFromFav(Recipe recipe, String uid) async {
    await DashboardRepository.removeRecipeFromFavourites(recipe, uid);
    _favouriteRecipes.remove(recipe);
    notifyListeners();
  }
}
