import 'package:flutter/material.dart';
import 'package:recipe_app/features/recipe_detail/data/models/recipe_detail_model.dart';

import '../../../categories_detail/data/repositories/recipe_repository.dart';

class RecipeDetailViewModel extends ChangeNotifier {
  RecipeDetailViewModel({
    required this.recipeId,
    required this.recipe,
    required RecipeRepository repo,
  }) : _repo = repo {
    load();
  }

  final RecipeRepository _repo;

  final int recipeId;

  bool isLoading = true;

  late final RecipeDetailModel recipe;

  Future<void> load() async {
    isLoading = true;
    notifyListeners();

    recipe = (await _repo.fetchRecipeById(recipeId))!;
    isLoading = false;
    notifyListeners();
  }
}
