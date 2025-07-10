import 'package:fitfat/core/extensions/context_color_extension.dart';
import 'package:fitfat/core/utils/app_styles.dart';
import 'package:flutter/material.dart';

class CustomMealDishesItem extends StatelessWidget {
  const CustomMealDishesItem({
    super.key,
    required this.height,
    required this.width,
    required this.title,
    this.onTap,
  });

  final double height;
  final double width;
  final String title;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: SizedBox(
        height: height,
        width: width,
        child: Card(
          color: context.theme.secondColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(14),
            side: const BorderSide(color: Colors.red, width: 1),
          ),
          child: Center(
            child: Text(
              title,
              style: AppStyles.textStyle16.copyWith(fontWeight: FontWeight.w500),
            ),
          ),
        ),
      ),
    );
  }
}
