import 'package:recipe_app/features/recipe_detail/data/models/ingredients_model.dart';
import 'package:recipe_app/features/recipe_detail/data/models/instructions_model.dart';
import 'package:recipe_app/features/recipe_detail/data/models/recipe_detail_user_model.dart';

class RecipeDetailModel {
  final int id, categoryId, timeRequired;
  final String title, description, photo, videoRecipe;
  final num rating;

  final RecipeDetailUserModel userModel;
  final List<InstructionsModel> instructionsModel;
  final List<IngredientsModel> ingredientsModel;

  RecipeDetailModel({
    required this.id,
    required this.categoryId,
    required this.timeRequired,
    required this.title,
    required this.description,
    required this.photo,
    required this.videoRecipe,
    required this.rating,
    required this.userModel,
    required this.instructionsModel,
    required this.ingredientsModel,
  });

  factory RecipeDetailModel.fromJson(Map<String, dynamic> json) {
    return RecipeDetailModel(
      id: json['id'],
      categoryId: json['categoryId'],
      timeRequired: json['timeRequired'],
      title: json['title'],
      description: json['description'],
      photo: json['photo'],
      videoRecipe: json['videoRecipe'],
      rating: json['rating'],
      userModel: json['userModel'],
      instructionsModel: (json['instructions'] as List<dynamic>).map((instructions)=> InstructionsModel.fromJson(instructions)).toList(),
      ingredientsModel: (json['ingredients'] as List<dynamic>).map((ingredients) => IngredientsModel.fromJson(ingredients)).toList(),
    );
  }
}
