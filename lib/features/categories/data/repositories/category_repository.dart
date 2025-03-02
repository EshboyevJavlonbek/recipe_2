import 'package:recipe_app/core/client.dart';
import 'package:recipe_app/features/categories/data/models/category_model.dart';

class CategoryRepository{
  CategoryRepository({required this.client});

  final ApiClient client;

  List<CategoryModel> categories = [];

  Future<List<CategoryModel>> fetchCategories()async{
    final rawCategories = await client.fetchCategories();
    categories = rawCategories.map((category) => CategoryModel.fromJson(category)).toList();
    return categories;
  }
}