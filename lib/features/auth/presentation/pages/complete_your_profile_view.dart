import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:recipe_app/features/auth/presentation/manager/complete_profile_view_model.dart';
import 'package:recipe_app/features/auth/presentation/pages/complete_your_profile_view_body.dart';

class CompleteYourProfileView extends StatelessWidget {
  const CompleteYourProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => CompleteProfileViewModel(repo: context.read()),
      builder: (context, child) => Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            "Profile",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w600,
              decoration: TextDecoration.none,
            ),
          ),
        ),
        body: CompleteYourProfileViewBody(),
      ),
    );
  }
}
