import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:recipe_app/features/common/presentation/widgets/recipe_icon_button.dart';

import '../../../../core/utils/colors.dart';
class RecipeBottomNavigationBar extends StatelessWidget {
  const RecipeBottomNavigationBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Container(
            width: double.infinity,
            height: 128,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [AppColors.beigeColor, Colors.transparent],
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(bottom: 36),
            child: Container(
              width: 280,
              height: 56,
              decoration: BoxDecoration(
                color: AppColors.redPinkMain,
                borderRadius: BorderRadius.circular(33),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  RecipeIconButton(
                    image: "assets/myassets/home.svg",
                    callback: () {},
                  ),
                  RecipeIconButton(
                    image: "assets/recipe/icon/massages.svg",
                    callback: () {},
                  ),
                  RecipeIconButton(
                    image: "assets/myassets/categories.svg",
                    callback: () {
                      context.go('/categories');
                    },
                  ),
                  RecipeIconButton(
                    image: "assets/recipe/icon/profile.svg",
                    callback: () {},
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}