import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';
import 'package:recipe_app/core/core.dart';
import 'package:recipe_app/core/dependencies.dart';
import 'package:recipe_app/core/l10n/app_localizations.dart';
import 'package:recipe_app/core/l10n/localization_view_model.dart';

import 'core/routes.dart';

void main() => runApp(RecipeApp());


class RecipeApp extends StatelessWidget {
  const RecipeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: providers,
      builder: (context, child) => MaterialApp.router(
        localizationsDelegates: [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
          MyLocalizations.delegate,
        ],
        supportedLocales: [
          Locale("uz"),
          Locale("en"),
        ],
        locale: context.watch<LocalizationViewModel>().currentLocale,
        debugShowCheckedModeBanner: false,
        theme: appThemeData,
        routerConfig: router,
      ),
    );
  }
}
