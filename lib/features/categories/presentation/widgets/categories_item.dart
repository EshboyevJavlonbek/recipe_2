import 'package:flutter/material.dart';
import 'package:recipe_app/features/categories/data/models/categories_model.dart';

class CategoriesItem extends StatelessWidget {
  const CategoriesItem({
    super.key,
    required this.category,
  });

  final CategoriesModel category;

  @override
  Widget build(BuildContext context) {
    final categoriesImage = ClipRRect(
      borderRadius: BorderRadius.circular(13),
      child: Image.network(
        category.image,
        width: 159,
        height: 145,
        fit: BoxFit.cover,
      ),
    );
    final categoriesTitle = Text(
      category.title,
      style: TextStyle(
        color: Colors.white,
        fontSize: 15,
        fontWeight: FontWeight.w500,
      ),
    );
    return Center(
      child: GestureDetector(
        onTap: (){},
        child: Column(
          spacing: 10,
          children: [
            categoriesImage,
            categoriesTitle,
          ],
        ),
      ),
    );
  }
}
