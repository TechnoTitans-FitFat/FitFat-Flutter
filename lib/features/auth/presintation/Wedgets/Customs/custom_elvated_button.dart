import 'package:fitfat/core/constants/light_colors.dart';
import 'package:fitfat/core/utils/app_styles.dart';
import 'package:flutter/material.dart';

class CustomElvatedButton extends StatelessWidget {
  const CustomElvatedButton(
      {super.key,
      required this.text,
      required this.butttonColor,
      required this.textColor});
  final String text;
  final Color butttonColor;
  final Color textColor;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(backgroundColor: butttonColor),
        child: Text(
          text,
          style: AppStyles.textStyle18.copyWith(color: textColor),
        ));
  }
}
