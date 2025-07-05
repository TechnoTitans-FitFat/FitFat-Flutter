import 'package:fitfat/core/extensions/context_color_extension.dart';
import 'package:fitfat/core/utils/app_styles.dart';
import 'package:flutter/material.dart';

class CustomTitle extends StatelessWidget {
  const CustomTitle({
    super.key,
    required this.title,
  });
  final String title;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 8,
      ),
      child: FittedBox(
        fit: BoxFit.scaleDown,
        child: Text(
          title,
          style: AppStyles.textStyle24.copyWith(
            color: context.theme.mainColor,
            fontSize: MediaQuery.of(context).size.width * 0.06,
          ),
        ),
      ),
    );
  }
}
