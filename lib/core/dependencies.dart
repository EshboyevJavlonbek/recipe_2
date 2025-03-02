import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import 'package:recipe_app/core/auth_view_model.dart';
import 'package:recipe_app/core/client.dart';
import 'package:recipe_app/core/l10n/localization_view_model.dart';
import 'package:recipe_app/features/auth/data/repositories/auth_repository.dart';
import 'package:recipe_app/features/categories/data/repositories/category_repository.dart';

List<SingleChildWidget> providers = [
  Provider(
    create: (context) => ApiClient(),
  ),
  Provider(
    create: (context) => AuthRepository(client: context.read()),
  ),
  Provider(
    create: (context) =>
        AuthViewModel(authRepository: context.read<AuthRepository>()),
  ),
  Provider(
    create: (context) => CategoryRepository(
      client: context.read(),
    ),
  ),
  ChangeNotifierProvider(
    create: (context) => LocalizationViewModel(),
  )
];
