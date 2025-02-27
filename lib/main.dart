import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:recipe_app/core/core.dart';
import 'package:recipe_app/core/dependencies.dart';
import 'package:recipe_app/features/auth/presentation/pages/complete_your_profile_view.dart';
import 'package:recipe_app/features/auth/presentation/pages/login_view.dart';
import 'package:recipe_app/features/auth/presentation/pages/sign_up_view.dart';
import 'package:recipe_app/features/categories/data/models/categories_model.dart';
import 'package:recipe_app/features/categories_detail/data/repositories/recipe_repository.dart';
import 'package:recipe_app/features/categories_detail/presentation/pages/category_detail_view_model.dart';

import 'features/categories/data/repositories/categories_repository.dart';
import 'features/categories/presentation/pages/categories_view.dart';
import 'features/categories/presentation/pages/categories_view_model.dart';
import 'features/onboarding/data/repositories/onboarding_repository.dart';
import 'features/onboarding/presentation/pages/onboarding_view.dart';
import 'features/onboarding/presentation/pages/onboarding_view_model.dart';
import 'features/profile/data/repositories/profile_repository.dart';
import 'features/profile/presentation/pages/profile_view.dart';
import 'features/profile/presentation/pages/profile_view_model.dart';
import 'features/categories_detail/presentation/pages/category_detail_view.dart';

void main() => runApp(RecipeApp());

GoRouter router = GoRouter(
  initialLocation: '/category-detail',
  routes: [
    GoRoute(
        path: '/onboarding',
        builder: (context, state) => OnboardingView(
            viewModel: OnboardingViewModel(
                repo: OnboardingRepository(client: ApiClient())))),
    GoRoute(
        path: '/profile',
        builder: (context, state) => ProfileView(
            viewModel: ProfileViewModel(
                repo: ProfileRepository(client: ApiClient())))),
    GoRoute(path: '/login', builder: (context, state) => LoginView()),
    GoRoute(path: '/signUp', builder: (context, state) => SignUpView()),
    GoRoute(
        path: '/completeProfile',
        builder: (context, state) => CompleteYourProfileView()),
    GoRoute(
        path: '/categories',
        builder: (context, state) => CategoriesView(
            vm: CategoriesViewModel(
                repo: CategoriesRepository(client: ApiClient())))),
    GoRoute(
      path: '/category-detail',
      builder: (context, state) => CategoryDetailView(
        vm: CategoryDetailViewModel(
          cateRepo: context.read<CategoriesRepository>(),
          recipeRepo: context.read<RecipeRepository>(), selected: state.extra as CategoriesModel,
        ),
      ),
    )
  ],
);

class RecipeApp extends StatelessWidget {
  const RecipeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: providers,
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        theme: appThemeData,
        routerConfig: router,
      ),
    );
  }
}
