import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../features/auth/presentation/pages/complete_your_profile_view.dart';
import '../features/auth/presentation/pages/login_view.dart';
import '../features/auth/presentation/pages/sign_up_view.dart';
import '../features/categories/presentation/manager/category_view_model.dart';
import '../features/categories/presentation/pages/categories_view.dart';
import '../features/onboarding/data/repositories/onboarding_repository.dart';
import '../features/onboarding/presentation/pages/onboarding_view.dart';
import '../features/onboarding/presentation/pages/onboarding_view_model.dart';
import '../features/profile/data/repositories/profile_repository.dart';
import '../features/profile/presentation/pages/profile_view.dart';
import '../features/profile/presentation/pages/profile_view_model.dart';

GoRouter router = GoRouter(
  initialLocation: '/signUp',
  routes: [
    GoRoute(
        path: '/onboarding',
        builder: (context, state) => OnboardingView(
            viewModel: OnboardingViewModel(
                repo: OnboardingRepository(client: context.read())))),
    GoRoute(
        path: '/profile',
        builder: (context, state) => ProfileView(
            viewModel: ProfileViewModel(
                repo: ProfileRepository(client: context.read())))),
    GoRoute(path: '/login', builder: (context, state) => LoginView()),
    GoRoute(path: '/signUp', builder: (context, state) => SignUpView()),
    GoRoute(
        path: '/completeProfile',
        builder: (context, state) => CompleteYourProfileView()),
    GoRoute(
        path: '/categories',
        builder: (context, state) =>
            CategoriesView(vm: CategoryViewModel(catRepo: context.read()))),
  ],
);
