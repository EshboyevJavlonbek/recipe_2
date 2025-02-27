import 'package:flutter/material.dart';
import 'package:recipe_app/core/core.dart';
import 'package:recipe_app/features/categories_detail/data/models/recipe_model.dart';

class RecipeItemTitle extends StatelessWidget {
  const RecipeItemTitle({
    super.key,
    required this.recipe,
  });

  final RecipeModel recipe;

  @override
  Widget build(BuildContext context) {
    return Text(
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
      recipe.title,
      style: TextStyle(
        color: AppColors.beigeColor,
        fontSize: 12,
        fontWeight: FontWeight.w600,
        decoration: TextDecoration.none,
      ),
    );
  }
}
