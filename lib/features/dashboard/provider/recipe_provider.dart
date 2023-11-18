import 'package:flutter/material.dart';

import '../../../models/recipe.dart';
import '../repository/dashboard_repository.dart';

class RecipeProvider with ChangeNotifier {
  List<Recipe> _recipesByUserPrefs = [];

  Recipe _recipeById = Recipe();

  List<Recipe> get recipesByUserPrefs => _recipesByUserPrefs;
  Recipe get recipeById => _recipeById;

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
}
