import 'package:flutter/material.dart';
import 'package:recipe_app/login/presentation/widgets/login_item.dart';
import 'package:recipe_app/login/presentation/widgets/mobile_number_field.dart';
import 'package:recipe_app/login/presentation/widgets/password_item.dart';
import 'package:recipe_app/onboarding/presentation/widgets/onboarding_elevated_button.dart';

import '../../../core/utils/colors.dart';

class SignUpView extends StatelessWidget {
  SignUpView({super.key});

  final controller1 = TextEditingController();
  final controller2 = TextEditingController();
  final controller3 = TextEditingController();
  final controller4 = TextEditingController();
  final controller5 = TextEditingController();
  final controller6 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 40,
        title: Text(
          "Sign Up",
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
          SizedBox(height: 120),
          Form(
            child: Center(
              child: Column(
                children: [
                  Column(
                    spacing: 10,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Full Name",
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      LoginItem(
                        hintText: "John Doe",
                        controller: controller1,
                      ),
                      Text(
                        "Email",
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      LoginItem(
                        hintText: "example@gmail.com",
                        controller: controller2,
                      ),
                      Text(
                        "Mobile Number",
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      MobileNumberField(
                          hintText: "+123 456 789", controller: controller3),
                      Text(
                        "Date Of Birth",
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      MobileNumberField(
                        hintText: "DD/MM/YY",
                        controller: controller4,
                      ),
                      Text(
                        "Password",
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      PasswordItem(controller: controller5),
                      Text(
                        "Confirm Password",
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      PasswordItem(controller: controller6),
                    ],
                  ),
                  SizedBox(height: 50),
                  OnboardingElevatedButton(callback: (){}, text: "Sign Up"),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
