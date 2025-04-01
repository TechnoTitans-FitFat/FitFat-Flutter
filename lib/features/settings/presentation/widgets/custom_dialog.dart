import 'package:fitfat/core/constants/light_colors.dart';
import 'package:fitfat/core/utils/app_styles.dart';
import 'package:flutter/material.dart';

class CustomDialog extends StatelessWidget {
  const CustomDialog({
    super.key,
    required this.title,
    this.onPressed,
    required this.action,
    required this.subtitle,
  });
  final String title;
  final String action;
  final String subtitle;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: AppLightColor.backgroundColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      title: Text(
        title,
        style: AppStyles.textStyle18.copyWith(
          color: AppLightColor.mainColor,
        ),
      ),
      content: Text(
        subtitle,
        style: AppStyles.textStyle15.copyWith(
          color: AppLightColor.blackColor,
        ),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: Text(
            "Cancel",
            style: AppStyles.textStyle15.copyWith(
              color: AppLightColor.greyColor,
            ),
          ),
        ),
        TextButton(
          onPressed: onPressed,
          child: Text(
            action,
            style: AppStyles.textStyle15.copyWith(
              color: AppLightColor.mainColor,
            ),
          ),
        ),
      ],
    );
  }
}
