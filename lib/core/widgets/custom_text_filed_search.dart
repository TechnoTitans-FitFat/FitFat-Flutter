import 'package:fitfat/core/constants/light_colors.dart';
import 'package:fitfat/core/utils/app_styles.dart';
import 'package:fitfat/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomTextFiledSearch extends StatelessWidget {
  const CustomTextFiledSearch({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 15, bottom: 35),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            height: 50,
            width: 280,
            decoration: const BoxDecoration(),
            child: TextField(
              decoration: InputDecoration(
                fillColor: AppLightColor.whiteColor,
                filled: true,
                hintText: "Search",
                hintStyle: AppStyles.textStyle16.copyWith(
                    fontWeight: FontWeight.w400,
                    color: AppLightColor.whiteColor0),
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
          Container(
              decoration: BoxDecoration(
                color: AppLightColor.mainColor,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.2),
                    spreadRadius: 2,
                    blurRadius: 10,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              height: 50,
              width: 50,
              child: Center(
                  child: SvgPicture.asset(
                    Assets.icons.filter,
                fit: BoxFit.fill,
                height: 27,
                width: 27,
              )))


        ],
      ),
    );
  }
}
