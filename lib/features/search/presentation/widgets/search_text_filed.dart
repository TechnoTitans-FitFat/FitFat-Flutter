import 'package:fitfat/core/extensions/context_color_extension.dart';
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
      padding: const EdgeInsets.only(top: 35, bottom: 5),
      child: Center(
        child: Container(
          height: 50,
          width: 330,
          decoration: const BoxDecoration(),
          child: TextField(
            onSubmitted: onSubmitted,
            decoration: InputDecoration(
              fillColor: context.theme.whiteColor,
              filled: true,
              hintText: "Search",
              hintStyle: AppStyles.textStyle16.copyWith(
                fontWeight: FontWeight.w400,
                color: context.theme.greyColor,
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(50),
                borderSide: BorderSide(
                  color: context.theme.whiteColor,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(50),
                borderSide:  BorderSide(
                  color: context.theme.mainColor,
                ),
              ),
              disabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(50),
                borderSide: BorderSide(
                  color: context.theme.whiteColor,
                ),
              ),
              prefixIcon: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Image.asset(
                  Assets.icons.searchNormal.path,
                  color: context.theme.greyColor,
                  ),
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
