import 'package:fitfat/core/constants/light_colors.dart';
import 'package:fitfat/core/utils/app_styles.dart';
import 'package:fitfat/gen/assets.gen.dart';
import 'package:flutter/material.dart';

class MealCard extends StatelessWidget {
  const MealCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 10,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: Image.asset(
            Assets.images.main.path,
            height: 150,
            width: 150,
            fit: BoxFit.cover,
          ),
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                //title,
                "Pasta with Egg...",
                style: AppStyles.textStyle16.copyWith(
                  color: AppLightColor.blackColor,
                ),
              ),
              const SizedBox(height: 10),
              Row(
                spacing: 5,
                children: [
                  // if (showType)
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8,
                      vertical: 4,
                    ),
                    decoration: BoxDecoration(
                      color: AppLightColor.mainColor.withOpacity(0.15),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Text(
                      // type ?? '',
                      "Low Carb",
                      style: AppStyles.textStyle12.copyWith(
                        color: AppLightColor.mainColor,
                      ),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 15,
                      vertical: 5,
                    ),
                    decoration: BoxDecoration(
                      color: AppLightColor.mainColor.withOpacity(0.15),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Text(
                      //'$calories cal',
                      "500 cal",
                      style: AppStyles.textStyle12.copyWith(
                        color: AppLightColor.mainColor,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Row(
                children: [
                  const Icon(
                    Icons.star,
                    color: Color(0xffFDE424),
                    size: 18,
                  ),
                  const SizedBox(width: 8),
                  Text(
                    //rating.toStringAsFixed(1),
                    "4.5",
                    style: AppStyles.textStyle16.copyWith(
                      color: AppLightColor.blackColor,
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 15),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Text(
                        //price.toString(),
                        r"20$",
                        style: AppStyles.textStyle16.copyWith(
                          color: AppLightColor.mainColor,
                        ),
                      ),
                      const SizedBox(width: 5),
                      Text(
                        'EGP',
                        style: AppStyles.textStyle16.copyWith(
                          color: AppLightColor.blackColor,
                        ),
                      ),
                    ],
                  ),
                  GestureDetector(
                    //onTap: onFavouriteTap,
                    child: Container(
                      height: 35,
                      width: 35,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Image.asset(
                        Assets.icons.add.path,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
