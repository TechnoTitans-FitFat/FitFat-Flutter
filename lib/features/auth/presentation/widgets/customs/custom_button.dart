import 'package:fitfat/core/constants/light_colors.dart';
import 'package:fitfat/core/utils/app_styles.dart';
import 'package:flutter/material.dart';

class CustomBottom extends StatelessWidget {
  const CustomBottom(
      {super.key, this.ontap, this.text, required this.isLoading});

  final VoidCallback? ontap;
  final String? text;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 50),
      child: GestureDetector(
        onTap: ontap,
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: 55,
          decoration: BoxDecoration(
            color: AppLightColor.mainColor,
            borderRadius: BorderRadius.circular(8),
          ),
          child: isLoading
              ? const Center(
                  child: CircularProgressIndicator(
                    color: AppLightColor.whiteColor,
                  ),
                )
              : Center(
                  child: Text(
                    text!,
                    style: AppStyles.textStyle15.copyWith(
                      color: AppLightColor.whiteColor,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                ),
        ),
      ),
    );
  }
}
