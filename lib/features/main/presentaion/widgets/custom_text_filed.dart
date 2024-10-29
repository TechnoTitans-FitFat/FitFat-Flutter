import 'package:fitfat/core/constants/light_colors.dart';
import 'package:flutter/material.dart';

class CustomTextFiled extends StatelessWidget {
  const CustomTextFiled({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 40),
      child: Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: AppLightColor.blackColor.withOpacity(0.25),
              blurRadius: 3,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: TextField(
          decoration: InputDecoration(
            fillColor: AppLightColor.whiteColor,
            filled: true,
            hintText: "Search",
            hintStyle: const TextStyle(
              color: AppLightColor.greyColor,
              fontSize: 16,
              fontWeight: FontWeight.w400,
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(50),
              borderSide: const BorderSide(
                color: AppLightColor.whiteColor,
              ),
            ),
            disabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(50),
              borderSide: const BorderSide(
                color: AppLightColor.whiteColor,
              ),
            ),
            prefixIcon: const Icon(
              Icons.search,
              color: AppLightColor.greyColor,
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(50),
            ),
          ),
        ),
      ),
    );
  }
}
