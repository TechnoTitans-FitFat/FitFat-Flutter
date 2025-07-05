import 'package:fitfat/core/extensions/context_color_extension.dart';
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
            color: context.theme.mainColor,
            borderRadius: BorderRadius.circular(8),
          ),
          child: isLoading
              ? Center(
                  child: CircularProgressIndicator(
                    color: context.theme.whiteColor,
                  ),
                )
              : Center(
                  child: Text(
                    text!,
                    style: AppStyles.textStyle15.copyWith(
                      color: context.theme.whiteColor,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                ),
        ),
      ),
    );
  }
}
