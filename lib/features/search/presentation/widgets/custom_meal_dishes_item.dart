import 'package:fitfat/core/constants/light_colors.dart';
import 'package:fitfat/core/utils/app_styles.dart';
import 'package:flutter/material.dart';

class CustomMealDishesItem extends StatelessWidget {
  const CustomMealDishesItem({super.key, required this.height, required this.width, required this.title});

  final double height;
  final double width;
  final String title;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
          height: height,
          width: width,
          child: Card(
            color: AppLightColor.secondColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(14),
              side: const BorderSide(color: Colors.red, width: 1),
            ),
            child: Center(
              child: Text(
                title,
                style:
                    AppStyles.textStyle16.copyWith(fontWeight: FontWeight.w500),
              ),
            ),
          ),
        );
  }
}
