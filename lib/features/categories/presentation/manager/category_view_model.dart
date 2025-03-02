import 'package:flutter/cupertino.dart';
import 'package:recipe_app/features/categories/data/models/category_model.dart';
import 'package:recipe_app/features/categories/data/repositories/category_repository.dart';

class CategoryViewModel extends ChangeNotifier{
  CategoryViewModel({required CategoryRepository catRepo}): _catRepo = catRepo{
    load();
  }

  final CategoryRepository _catRepo;

  List<CategoryModel> categories = [];
  CategoryModel? mainCategory;

  Future<void> load()async{
    final allCategories = await _catRepo.fetchCategories();
    mainCategory = allCategories.firstWhere((category) => category.isMain);
    categories = allCategories.where((category) => !category.isMain).toList();
    notifyListeners();
  }
}