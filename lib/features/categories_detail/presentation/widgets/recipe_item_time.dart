import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:recipe_app/core/core.dart';
import 'package:recipe_app/features/categories_detail/data/models/recipe_model.dart';

class RecipeItemTime extends StatelessWidget {
  const RecipeItemTime({
    super.key,
    required this.timeRequired,
  });

  final int timeRequired;

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 10,
      children: [
        SvgPicture.asset("assets/myassets/clock.svg"),
        Text(
          timeRequired.toString(),
          style: TextStyle(
            color: AppColors.pinkSub,
            fontSize: 12,
            decoration: TextDecoration.none,
          ),
        ),
      ],
    );
  }
}
