import 'package:flutter/material.dart';
import 'package:recipe_app/core/core.dart';
import 'package:recipe_app/features/categories_detail/data/models/recipe_model.dart';
import 'package:recipe_app/features/categories_detail/presentation/widgets/recipe_item_description.dart';
import 'package:recipe_app/features/categories_detail/presentation/widgets/recipe_item_rating.dart';
import 'package:recipe_app/features/categories_detail/presentation/widgets/recipe_item_time.dart';
import 'package:recipe_app/features/categories_detail/presentation/widgets/recipe_item_title.dart';

class RecipeItemInfo extends StatelessWidget {
  const RecipeItemInfo({
    super.key,
    required this.recipe,
  });

  final RecipeModel recipe;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        vertical: 4,
        horizontal: 15,
      ),
      width: 158.5,
      height: 76,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(
          bottom: Radius.circular(14),
        ),
        border: Border.all(
          width: 1,
          color: AppColors.pinkSub,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          RecipeItemTitle(recipe: recipe),
          RecipeItemDescription(recipe: recipe),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              RecipeItemRating(
                rating: recipe.rating,
              ),
              RecipeItemTime(
                timeRequired: recipe.timeRequired,
              )
            ],
          )
        ],
      ),
    );
  }
}
