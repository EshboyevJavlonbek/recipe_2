import 'package:flutter/material.dart';

import '../../../core/utils/colors.dart';

class LoginItem extends StatelessWidget {
  const LoginItem({
    super.key,
    required this.hintText,
    required this.controller,
  });

  final TextEditingController controller;
  final String hintText;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 357,
      height: 41,
      child: TextFormField(
        controller: controller,
        style: TextStyle(
          color: AppColors.beigeColor,
        ),
        decoration: InputDecoration(
          filled: true,
          fillColor: AppColors.pink,
          hintText: hintText,
          hintStyle: TextStyle(
            color: AppColors.beigeColor.withValues(alpha: 0.5),
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
          contentPadding: EdgeInsets.symmetric(horizontal: 36),
          border: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(18),
          ),
        ),
      ),
    );
  }
}
