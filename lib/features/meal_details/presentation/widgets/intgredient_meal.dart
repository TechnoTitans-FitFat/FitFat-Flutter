import 'package:fitfat/core/constants/light_colors.dart';
import 'package:fitfat/core/utils/app_styles.dart';
import 'package:flutter/material.dart';

class IntgredientMeal extends StatelessWidget {
  const IntgredientMeal({
    super.key, required this.ingredients,
  });
  final List<String> ingredients;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 22),
      child: Column(
        children: [
          Row(
            children: [
              const Icon(
                Icons.circle,
                color: AppLightColor.blackColor,
                size: 8,
              ),
              const SizedBox(width: 10),
              Text(
                ingredients[0],
                style: AppStyles.textStyle15,
              )
            ],
          ),
          Row(
            children: [
              const Icon(
                Icons.circle,
                color: AppLightColor.blackColor,
                size: 8,
              ),
              const SizedBox(width: 10),
              Text(
                ingredients[1],
                style: AppStyles.textStyle15,
              )
            ],
          ),
          Row(
            children: [
              const Icon(
                Icons.circle,
                color: AppLightColor.blackColor,
                size: 8,
              ),
              const SizedBox(width: 10),
              Text(
                ingredients[2],
                style: AppStyles.textStyle15,
              )
            ],
          ),
          Row(
            children: [
              const Icon(
                Icons.circle,
                color: AppLightColor.blackColor,
                size: 8,
              ),
              const SizedBox(width: 10),
              Text(
                ingredients[3],
                style: AppStyles.textStyle15,
              )
            ],
          ),
          Row(
            children: [
              const Icon(
                Icons.circle,
                color: AppLightColor.blackColor,
                size: 8,
              ),
              const SizedBox(width: 10),
              Text(
                ingredients[4],
                style: AppStyles.textStyle15,
              )
            ],
          ),
          Row(
            children: [
              const Icon(
                Icons.circle,
                color: AppLightColor.blackColor,
                size: 8,
              ),
              const SizedBox(width: 10),
              Text(
                ingredients[5],
                style: AppStyles.textStyle15,
              )
            ],
          ),
        ],
      ),
    );
  }
}
