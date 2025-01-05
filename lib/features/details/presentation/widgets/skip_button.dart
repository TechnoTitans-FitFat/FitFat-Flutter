import 'package:fitfat/core/constants/light_colors.dart';
import 'package:flutter/material.dart';

class SkipButton extends StatelessWidget {
  const SkipButton({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {},
      child: Row(
        children: [
          Text(
            "Skip",
            style: TextStyle(
                color: AppLightColor.greyColor,
                fontWeight: FontWeight.bold,
                fontSize: 16),
          ),

          Icon(
            Icons.arrow_right_alt_outlined,
            color: AppLightColor.greyColor,
          )
        ],
      ),
      style: ElevatedButton.styleFrom(
          backgroundColor: AppLightColor.secondColor,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
              side: BorderSide(color: AppLightColor.greyColor))),
    );
  }
}
