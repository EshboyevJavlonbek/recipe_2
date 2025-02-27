import 'package:flutter/material.dart';
import 'package:recipe_app/features/categories_detail/presentation/pages/category_detail_view_model.dart';
import 'package:recipe_app/features/categories_detail/presentation/widgets/recipe_app_bar_bottom.dart';
import 'package:recipe_app/features/categories_detail/presentation/widgets/recipe_item.dart';
import 'package:recipe_app/features/profile/presentation/widgets/bottom_nav_bar2.dart';

import '../widgets/category_detail_app_bar.dart';

class CategoryDetailView extends StatelessWidget {
  const CategoryDetailView({
    super.key,
    required this.vm,
  });

  final CategoryDetailViewModel vm;

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: vm,
      builder: (context, index) {
        if (vm.isLoading) {
          return Center(
            child: CircularProgressIndicator(),
          );
        } else {
          return Scaffold(
            appBar: CategoryDetailAppBar(
              title: vm.selected.title,
              toolbarHeight: 72,
              bottom: RecipeAppBarBottom(vm: vm),
            ),
            body: GridView.builder(
              gridDelegate:
                  SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
              itemBuilder: (context, index) {
                return GridView.builder(
                  padding: EdgeInsets.only(
                    top: 36,
                    bottom: 120,
                    right: 16,
                    left: 16,
                  ),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisExtent: 226,
                    mainAxisSpacing: 30,
                  ),
                  itemCount: vm.recipes.length,
                  itemBuilder: (context, index) =>
                      RecipeItem(recipe: vm.recipes[index]),
                );
              },
            ),
            bottomNavigationBar: BottomNavBar2(),
          );
        }
      },
    );
  }
}
