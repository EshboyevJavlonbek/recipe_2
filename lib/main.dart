import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:recipe_app/categories/data/repositories/categories_repository.dart';
import 'package:recipe_app/categories/presentation/pages/categories_view.dart';
import 'package:recipe_app/categories/presentation/pages/categories_view_model.dart';
import 'package:recipe_app/core/auth_view_model.dart';
import 'package:recipe_app/core/data/repository/auth_repository.dart';
import 'package:recipe_app/login/presentation/pages/login_view.dart';
import 'package:recipe_app/login/presentation/pages/sign_up_view.dart';
import 'package:recipe_app/onboarding/data/repositories/onboarding_repository.dart';
import 'package:recipe_app/onboarding/presentation/pages/onboarding_view.dart';
import 'package:recipe_app/onboarding/presentation/pages/onboarding_view_model.dart';
import 'package:recipe_app/profile/data/repositories/profile_repository.dart';
import 'package:recipe_app/profile/presentation/pages/profile_view.dart';
import 'package:recipe_app/profile/presentation/pages/profile_view_model.dart';
import 'package:recipe_app/core/core.dart';
void main() => runApp(RecipeApp());

GoRouter router = GoRouter(
  initialLocation: '/signUp',
  routes: [
    GoRoute(path: '/onboarding', builder: (context, state) => OnboardingView(viewModel: OnboardingViewModel(repo: OnboardingRepository(client: ApiClient())))),
    GoRoute(path: '/login', builder: (context, state) => LoginView(viewModel: AuthViewModel(authRepository: AuthRepository(client: ApiClient())),)),
    GoRoute(path: '/signUp', builder: (context, state) => SignUpView()),
    GoRoute(path: '/profile', builder: (context, state) => ProfileView(viewModel: ProfileViewModel(repo: ProfileRepository(client: ApiClient())))),
    GoRoute(path: '/categories',builder: (context, state) => CategoriesView(vm: CategoriesViewModel(repo: CategoriesRepository(client: ApiClient())))),
  ],
);

class RecipeApp extends StatelessWidget {
  const RecipeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      theme: appThemeData,
      routerConfig: router,
    );
  }
}
