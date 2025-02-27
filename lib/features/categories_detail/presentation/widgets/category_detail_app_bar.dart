import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:recipe_app/features/categories_detail/presentation/widgets/recipe_icon_button.dart';

class CategoryDetailAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  const CategoryDetailAppBar({
    super.key,
    required this.title,
    required this.toolbarHeight,
    this.bottom,
  });

  final double toolbarHeight;

  final String title;
  final PreferredSizeWidget? bottom;

  @override
  Size get preferredSize {
    final double? bottomHeight = bottom?.preferredSize.height;
    final height = bottomHeight == null ? toolbarHeight :  bottomHeight + toolbarHeight;
    return Size(double.infinity, height);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 36, vertical: 10),
      child: AppBar(
        toolbarHeight: toolbarHeight,
        leading: SvgPicture.asset(
          "assets/myassets/back.svg",
          fit: BoxFit.none,
        ),
        title: Text(
          title,
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: true,
        actions: [
          Row(
            spacing: 3,
            children: [
              RecipeIconButton(
                image: "assets/myassets/notification.svg",
                callback: () {},
                iconHeight: 17,
                iconWidth: 12,
              ),
              RecipeIconButton(
                image: "assets/myassets/search.svg",
                callback: () {},
                iconHeight: 17,
                iconWidth: 12,
              ),
            ],
          ),
        ],
        bottom: bottom,
      ),
    );
  }
}
