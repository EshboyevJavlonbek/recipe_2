import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:recipe_app/categories/data/repositories/categories_repository.dart';
import 'package:recipe_app/categories/presentation/pages/categories_view.dart';
import 'package:recipe_app/core/client.dart';
import 'package:recipe_app/core/utils/theme.dart';
import 'package:recipe_app/onboarding/data/repositories/onboarding_repository.dart';
import 'package:recipe_app/onboarding/presentation/pages/onboarding_view.dart';
import 'package:recipe_app/profile/data/repositories/profile_repository.dart';
import 'package:recipe_app/profile/presentation/pages/profile_view.dart';

void main() => runApp(RecipeApp());

GoRouter router = GoRouter(
  initialLocation: '/onboarding',
  routes: [
    GoRoute(path: '/categories',builder: (context, state) => CategoriesView(vm: context.read())),
    GoRoute(path: '/onboarding', builder: (context, state) => OnboardingView(viewModel: context.read())),
    GoRoute(path: '/profile', builder: (context, state) => ProfileView(viewModel: context.read())),
  ],
);

class RecipeApp extends StatelessWidget {
  const RecipeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider(create: (context) => ApiClient()),
        Provider(create: (context) => ProfileRepository(client: context.read())),
        Provider(create: (context) => OnboardingRepository(client: context.read())),
        Provider(create: (context) => CategoriesRepository(client: context.read())),
      ],
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        theme: appThemeData,
        routerConfig: router,
      ),
    );
  }
}
