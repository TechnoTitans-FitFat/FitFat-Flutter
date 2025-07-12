import 'package:fitfat/core/extensions/context_color_extension.dart';
import 'package:fitfat/core/utils/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomCardCategory extends StatelessWidget {
  const CustomCardCategory({
    super.key,
    required this.text,
    required this.img,
    this.color,
  });
  final String text;
  final String img;
  final Color? color;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Container(
        decoration: BoxDecoration(
          color: context.theme.whiteColor,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.25),
              blurRadius: 3,
              offset: const Offset(0, 3),
            ),
          ],
          borderRadius: const BorderRadius.all(
            Radius.circular(
              15,
            ),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SvgPicture.asset(
                img,
                height: 70,
                width: 70,
                color: color,
              ),
              const SizedBox(
                height: 4,
              ),
              FittedBox(
                fit: BoxFit.scaleDown,
                child: Text(
                  text,
                  style: AppStyles.textStyle16.copyWith(
                    color: context.theme.mainColor,
                    fontSize: MediaQuery.of(context).size.width * 0.04,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
