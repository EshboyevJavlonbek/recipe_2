import 'package:flutter/material.dart';
import 'package:recipe_app/features/categories_detail/presentation/pages/category_detail_view_model.dart';
import 'package:recipe_app/features/categories_detail/presentation/widgets/recipe_app_bar_bottom_item.dart';

class RecipeAppBarBottom extends StatelessWidget
    implements PreferredSizeWidget {
  const RecipeAppBarBottom({
    super.key,
    required this.vm,
  });

  @override
  Size get preferredSize => Size(double.infinity, 60);

  final CategoryDetailViewModel vm;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        spacing: 10,
        children: [
          for (var category in vm.categories)
            RecipeAppBarBottomItem(
              title: category.title,
              callback: () => vm.selected = category,
              isSelected: category.id == vm.selected.id,
            )
        ],
      ),
    );
  }
}
