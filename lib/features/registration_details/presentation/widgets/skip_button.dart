import 'package:fitfat/core/constants/light_colors.dart';
import 'package:flutter/material.dart';

class SkipButton extends StatelessWidget {
   const SkipButton({super.key,this.onPressed});
  final VoidCallback ? onPressed;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
          backgroundColor: AppLightColor.secondColor,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
              side: const BorderSide(color: AppLightColor.greyColor))),
      child: const Row(
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
    );
  }
}
