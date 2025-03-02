import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:recipe_app/core/l10n/app_localizations.dart';
import 'package:recipe_app/core/l10n/localization_view_model.dart';
import 'package:recipe_app/core/widgets/recipe_elevated_button2.dart';

import '../../../../core/utils/colors.dart';
import '../manager/sign_up_view_model.dart';
import '../widgets/recipe_date_of_birth.dart';
import '../widgets/recipe_password_form_field.dart';
import '../widgets/recipe_text_form_field.dart';

class SignUpView extends StatelessWidget {
  const SignUpView({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<SignUpViewModel>(
      create: (context) => SignUpViewModel(
        authRepo: context.read(),
      ),
      builder: (context, child) {
        final vm = context.read<SignUpViewModel>();
        return Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: Text("Sign Up"),
            actions: [
              TextButton(
                onPressed: () {
                  context.read<LocalizationViewModel>().currentLocale = Locale("uz");
                },
                child: Text("uz"),
              ),
              TextButton(
                onPressed: () {
                  context.read<LocalizationViewModel>().currentLocale = Locale("en");
                },
                child: Text("en"),
              ),
            ],
          ),
          body: ListView(
            children: [
              SizedBox(height: 20),
              Form(
                key: vm.formKey,
                child: Column(
                  spacing: 10,
                  children: [
                    RecipeTextFormField(
                      title: MyLocalizations.of(context)!.firstName,
                      hintText: "Davlat",
                      validator: (value) => null,
                      controller: vm.firstNameController,
                    ),
                    RecipeTextFormField(
                      title: MyLocalizations.of(context)!.lastName,
                      hintText: "Davlatov",
                      validator: (value) => null,
                      controller: vm.lastNameController,
                    ),
                    RecipeTextFormField(
                      title: MyLocalizations.of(context)!.username,
                      hintText: "username",
                      validator: (value) => null,
                      controller: vm.usernameController,
                    ),
                    RecipeTextFormField(
                      title: MyLocalizations.of(context)!.email,
                      hintText: "example@example.com",
                      validator: (value) => null,
                      controller: vm.emailController,
                    ),
                    RecipeTextFormField(
                      title: MyLocalizations.of(context)!.phoneNumber,
                      hintText: "+998901234567",
                      validator: (value) => null,
                      controller: vm.numberController,
                    ),
                    RecipeDateOfBirthField(
                      title: MyLocalizations.of(context)!.dateOfBirth,
                    ),
                    RecipePasswordFormField(
                      controller: vm.passwordController,
                      title: MyLocalizations.of(context)!.password,
                      validator: (value) => null,
                    ),
                    RecipePasswordFormField(
                      controller: vm.confirmPasswordController,
                      title: MyLocalizations.of(context)!.confirmPassword,
                      validator: (value) {
                        if (vm.passwordController.text !=
                            vm.confirmPasswordController.text) {
                          return "Passwords do not match!";
                        }
                        return null;
                      },
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
              RecipeElevatedButton2(
                text: "Sign Up",
                size: Size(195, 45),
                foregroundColor: Colors.white,
                backgroundColor: AppColors.redPinkMain,
                callback: () async {
                  if (vm.formKey.currentState!.validate()) {
                    if (await vm.signUp() && context.mounted) {
                      await showDialog(
                        context: context,
                        builder: (context) => Center(
                          child: Container(
                            padding: EdgeInsets.all(20),
                            width: 250,
                            height: 286,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(40),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  maxLines: 2,
                                  "Sign Up Succesful!",
                                  style: TextStyle(
                                    color: AppColors.beigeColor,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    decoration: TextDecoration.none,
                                  ),
                                ),
                                Image.asset(
                                  "assets/myassets/profile.png",
                                  width: 82,
                                  height: 82,
                                  fit: BoxFit.cover,
                                ),
                                Text(
                                  maxLines: 4,
                                  "Lorem ipsum dolor sit amet pretium cras id dui pellentesque ornare. Quisque malesuada.",
                                  style: TextStyle(
                                      color: AppColors.beigeColor,
                                      fontSize: 13,
                                      fontWeight: FontWeight.w400,
                                      decoration: TextDecoration.none),
                                )
                              ],
                            ),
                          ),
                        ),
                      );
                    }
                  }
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
