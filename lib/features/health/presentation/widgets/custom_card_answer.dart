import 'package:fitfat/core/constants/light_colors.dart';
import 'package:fitfat/core/utils/app_styles.dart';
import 'package:flutter/material.dart';

class CustomCardAnswer extends StatelessWidget {
  const CustomCardAnswer({super.key, required this.title});

  final String title;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 45,
      width: 94,
      child: Card(
              color: AppLightColor.whiteColor,
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