import 'package:flutter/material.dart';
import 'package:recipe_app/core/core.dart';
import 'package:recipe_app/features/categories_detail/data/models/recipe_model.dart';

class RecipeItemDescription extends StatelessWidget {
  const RecipeItemDescription({
    super.key,
    required this.recipe,
  });

  final RecipeModel recipe;

  @override
  Widget build(BuildContext context) {
    return Text(
      maxLines: 2,
      overflow: TextOverflow.ellipsis,
      recipe.description,
      style: TextStyle(
        color: AppColors.beigeColor,
        fontSize: 13,
        fontWeight: FontWeight.w300,
        height: 1,
        decoration: TextDecoration.none,
      ),
    );
  }
}
