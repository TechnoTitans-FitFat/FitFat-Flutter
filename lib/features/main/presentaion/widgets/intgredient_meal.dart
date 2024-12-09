import 'package:fitfat/core/constants/light_colors.dart';
import 'package:fitfat/core/utils/app_styles.dart';
import 'package:flutter/material.dart';

class IntgredientMeal extends StatelessWidget {
  const IntgredientMeal({
    super.key,
  });

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
                'Lorem amet consectetur.',
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
                'Dignissim vivamus.',
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
                'Magna cursus.',
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
                'imperdiet varius.',
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
                'aliquet mauris suspendisse.',
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
                'aliquet mauris suspendisse.',
                style: AppStyles.textStyle15,
              )
            ],
          ),
        ],
      ),
    );
  }
}
