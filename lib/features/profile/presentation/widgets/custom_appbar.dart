import 'package:fitfat/core/constants/light_colors.dart';
import 'package:fitfat/core/utils/app_styles.dart';
import 'package:fitfat/gen/assets.gen.dart';
import 'package:flutter/material.dart';
class CustomAppbarProfile extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppbarProfile({super.key});
  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: const Color(0xffFBE0E2),
      leading: Padding(
        padding: const EdgeInsets.only(left: 24),
        child: GestureDetector(
            onTap: () {
              Navigator.of(context).pop();
            },
            child: Image.asset(
              Assets.icons.previous.path,
              height: 25,
              width: 25,
              fit: BoxFit.contain,
            )),
      ),
      title: Text(
        "Edit profile",
        textAlign: TextAlign.center,
        style: TextStyle(
            fontSize: AppStyles.textStyle24.fontSize,
            fontWeight: FontWeight.bold,
            color: AppLightColor.mainColor),
      ),
    );
  }
}
