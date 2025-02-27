import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:recipe_app/core/core.dart';
import 'package:recipe_app/features/categories_detail/data/models/recipe_model.dart';

class RecipeItemRating extends StatelessWidget {
  const RecipeItemRating({
    super.key,
    required this.rating,
  });

  final num rating;

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 10,
      children: [
        Text(
          rating.toString(),
          style: TextStyle(
            color: AppColors.pinkSub,
            fontSize: 12,
            decoration: TextDecoration.none,
          ),
        ),
        SvgPicture.asset("assets/myassets/star.svg"),
      ],
    );
  }
}
