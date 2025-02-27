import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/utils/colors.dart';

class RecipeIconButton extends StatelessWidget {
  const RecipeIconButton({
    super.key,
    required this.image,
    required this.callback,
    this.containerWidth = 28,
    this.containerHeight = 28,
    required this.iconWidth,
    required this.iconHeight,
    this.iconColor = AppColors.pinkSub,
    this.containerColor = AppColors.pink,
  });

  final String image;
  final VoidCallback callback;

  final double containerWidth, containerHeight;
  final double iconWidth, iconHeight;
  final Color iconColor, containerColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      width: containerWidth,
      height: containerHeight,
      decoration: BoxDecoration(
        color: containerColor,
        borderRadius: BorderRadius.circular(14),
      ),
      child: IconButton(
        icon: SvgPicture.asset(
          image,
          width: iconWidth,
          height: iconHeight,
          colorFilter: ColorFilter.mode(iconColor, BlendMode.srcIn),
        ),
        onPressed: callback,
      ),
    );
  }
}
