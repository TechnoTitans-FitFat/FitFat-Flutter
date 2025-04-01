import 'package:fitfat/core/constants/light_colors.dart';
import 'package:fitfat/core/utils/app_styles.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomCard extends StatelessWidget {
  const CustomCard({
    super.key,
    required this.text,
    required this.height,
    required this.width,
    required this.onTap,
  });
  final String text;
  final double height;
  final double width;
   final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: GestureDetector(
        onTap: onTap,
        child: Card(
          color: AppLightColor.whiteColor,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 15),
            child: Text(
              text,
              style: AppStyles.textStyle12
                  .copyWith(color: AppLightColor.mainColor),
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ),
    );
  }
}
