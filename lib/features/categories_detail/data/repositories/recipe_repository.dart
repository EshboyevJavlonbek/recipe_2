import 'package:recipe_app/core/client.dart';
import 'package:recipe_app/features/categories_detail/data/models/recipe_model.dart';

import '../../../recipe_detail/data/models/recipe_detail_model.dart';

class RecipeRepository{
  RecipeRepository({required this.client});

  final ApiClient client;

  Map<int, List<RecipeModel>> recipesByCategory = {};

  Future<List<RecipeModel>> fetchRecipesByCategory(int categoryId) async{
    if (recipesByCategory.containsKey(categoryId) && recipesByCategory[categoryId] != null) {
      return recipesByCategory[categoryId]!;
    }

    var rawRecipes = await client.fetchRecipes(categoryId);
    final recipes = rawRecipes.map((recipe) => RecipeModel.fromJson(recipe)).toList();
    recipesByCategory[categoryId] = recipes;
    return recipes;
  }

  RecipeDetailModel? recipe;

  Future<RecipeDetailModel?> fetchRecipeById(int recipeId) async{
    final rawRecipe = await client.fetchCategoryDetail(recipeId);
    recipe = RecipeDetailModel.fromJson(rawRecipe);
    return recipe;
  }
}