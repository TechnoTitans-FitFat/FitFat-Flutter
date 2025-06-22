import 'package:fitfat/core/constants/light_colors.dart';
import 'package:fitfat/core/utils/app_styles.dart';
import 'package:fitfat/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class SearchTextFiled extends StatelessWidget {
  final void Function(String) onSubmitted; 

  const SearchTextFiled({super.key, required this.onSubmitted});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 35,bottom: 5 ),
      child: Center(
        child: Container(
          height: 50,
          width: 330,
          decoration: const BoxDecoration(),
          child: TextField(
            onSubmitted: onSubmitted, 
            decoration: InputDecoration(
              fillColor: AppLightColor.whiteColor,
              filled: true,
              hintText: "Search",
              hintStyle: AppStyles.textStyle16.copyWith(
                fontWeight: FontWeight.w400,
                color: AppLightColor.whiteColor0,
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(50),
                borderSide: const BorderSide(
                  color: AppLightColor.whiteColor,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(50),
                borderSide: const BorderSide(
                  color: AppLightColor.mainColor,
                ),
              ),
              disabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(50),
                borderSide: const BorderSide(
                  color: AppLightColor.whiteColor,
                ),
              ),
              prefixIcon: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Image.asset(Assets.icons.searchNormal.path),
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(50),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
