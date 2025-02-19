import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:recipe_app/core/auth_view_model.dart';
import 'package:recipe_app/core/secure_storage.dart';
import 'package:recipe_app/login/presentation/widgets/login_item.dart';
import 'package:recipe_app/login/presentation/widgets/password_item.dart';
import 'package:recipe_app/onboarding/presentation/widgets/onboarding_elevated_button.dart';

import '../../../core/utils/colors.dart';

class LoginView extends StatelessWidget {
  const LoginView({
    super.key,
    required this.viewModel,
  });

  final AuthViewModel viewModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 40,
        title: Text(
          "Login",
          style: TextStyle(
            color: AppColors.redPinkMain,
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: true,
      ),
      body: ListView(
        children: [
          SizedBox(height: 152),
          Form(
            key: viewModel.formKey,
            child: Center(
              child: Column(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    spacing: 10,
                    children: [
                      Text(
                        "Email",
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      LoginItem(
                        hintText: "example@gmail.com",
                        controller: viewModel.loginController,
                      ),
                      Text(
                        "Password",
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      PasswordItem(
                        controller: viewModel.passwordController,
                      ),
                    ],
                  ),
                  SizedBox(height: 90,),
                  Column(
                    spacing: 10,
                    children: [
                      OnboardingElevatedButton(callback: ()async{
                        if(await viewModel.submitForm() && context.mounted){
                          context.go('/profile');
                        }
                      }, text: "Log in"),
                      OnboardingElevatedButton(callback: ()async{
                        await SecureStorage.deleteToken();
                      }, text: "Sign up"),
                    ],
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
