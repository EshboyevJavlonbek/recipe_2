import 'package:flutter/cupertino.dart';
import 'package:recipe_app/features/categories/data/models/categories_model.dart';
import 'package:recipe_app/features/categories/data/repositories/categories_repository.dart';
import 'package:recipe_app/features/categories_detail/data/models/recipe_model.dart';
import 'package:recipe_app/features/categories_detail/data/repositories/recipe_repository.dart';

class CategoryDetailViewModel extends ChangeNotifier {
  CategoryDetailViewModel({
    required CategoriesRepository cateRepo,
    required RecipeRepository recipeRepo,
    required CategoriesModel selected,
  })  : _catRepo = cateRepo,
        _recipeRepo = recipeRepo, _selected = selected {
    load();
  }

  final CategoriesRepository _catRepo;
  final RecipeRepository _recipeRepo;

  List<CategoriesModel> categories = [];
  List<RecipeModel> recipes = [];

  bool isLoading = true;

  late CategoriesModel _selected;

  CategoriesModel get selected => _selected;

  set selected(CategoriesModel model) {
    _selected = model;
    notifyListeners();

    fetchRecipes(_selected.id);
  }

  Future<void> fetchRecipes(int categoryId)async{
    recipes = await _recipeRepo.fetchRecipesByCategory(selected.id);
    notifyListeners();
  }

  Future<void> load() async {
    isLoading = true;
    notifyListeners();
    categories = await _catRepo.fetchCategories();
    recipes = await _recipeRepo.fetchRecipesByCategory(selected.id);
    isLoading = false;
    notifyListeners();
  }
}
