import 'package:fitfat/core/extensions/context_color_extension.dart';
import 'package:fitfat/core/utils/app_styles.dart';
import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key, required this.title});

  final String title;
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: context.theme.backgroundColor,
      centerTitle: true,
      title: Text(
        title,
        style: AppStyles.textStyle24.copyWith(
          color: context.theme.mainColor,
        ),
      ),
      leading: Padding(
        padding: const EdgeInsets.all(8),
        child: GestureDetector(
          onTap: () {
            Navigator.of(context).pop();
          },
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              color: context.theme.backgroundColor,
              border: Border.all(color: context.theme.mainColor, width: 2),
            ),
            child: Padding(
              padding: EdgeInsets.only(left: 6),
              child: Icon(
                Icons.arrow_back_ios,
                color: context.theme.mainColor,
                size: 18,
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
