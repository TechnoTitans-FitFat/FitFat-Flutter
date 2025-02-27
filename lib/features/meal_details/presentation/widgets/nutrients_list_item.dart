import 'package:fitfat/core/constants/light_colors.dart';
import 'package:fitfat/core/utils/app_styles.dart';
import 'package:flutter/material.dart';

class NutrientsListItem extends StatelessWidget {
  const NutrientsListItem({super.key, required this.img, required this.title1, required this.title2});

final String img;
final String title1;
final String title2;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: AppLightColor.secondColor,
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Image.asset(
              img,
              height: 30,
              width: 30,
              fit: BoxFit.contain,
            ),
            Text(
              title1,
              style: AppStyles.textStyle16,
            ),
            Text(
              title2,
              style: AppStyles.textStyle16,
            )
          ],
        ),
      ),
    );
  }
}
