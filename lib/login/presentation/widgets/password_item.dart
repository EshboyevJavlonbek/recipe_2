import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../core/utils/colors.dart';

class PasswordItem extends StatefulWidget {
   const PasswordItem({
    super.key,
    required this.controller,
  });

  final TextEditingController controller;

  @override
  State<PasswordItem> createState() => _PasswordItemState();
}

class _PasswordItemState extends State<PasswordItem> {
  bool obscure = true;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 357,
      height: 41,
      child: TextFormField(
        controller: widget.controller,
        obscureText: obscure,
        obscuringCharacter: "●",
        style: TextStyle(
          color: AppColors.beigeColor,
        ),
        decoration: InputDecoration(
          suffixIcon: IconButton(onPressed: (){
            if(obscure == true){
              obscure = false;
              setState(() {});
            }else{
              obscure = true;
              setState(() {});
            }
          }, icon: Icon(CupertinoIcons.eye_slash)),
          filled: true,
          fillColor: AppColors.pink,
          hintText: "● ● ● ● ● ● ●",
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
