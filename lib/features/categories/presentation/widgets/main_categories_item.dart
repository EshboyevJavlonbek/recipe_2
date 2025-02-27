import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:recipe_app/features/categories/data/models/categories_model.dart';

class MainCategoriesItem extends StatelessWidget {
  const MainCategoriesItem({
    super.key,
    required this.category,
  });

  final CategoriesModel category;

  @override
  Widget build(BuildContext context) {
    final categoriesTitle = Text(
      category.title,
      style: TextStyle(
        color: Colors.white,
        fontSize: 15,
        fontWeight: FontWeight.w500,
      ),
    );
    final categoriesImage = ClipRRect(
      borderRadius: BorderRadius.circular(13),
      child: Image.network(
        category.image,
        width: 356,
        height: 148,
        fit: BoxFit.cover,
      ),
    );
    return Center(
      child: GestureDetector(
        onTap: (){
          GoRouter.of(context).go('/category-detail', extra: category);
        },
        child: Column(
          children: [
            categoriesTitle,
            categoriesImage
          ],
        ),
      ),
    );
  }
}
