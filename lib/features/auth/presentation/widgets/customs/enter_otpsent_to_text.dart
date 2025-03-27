import 'package:fitfat/core/constants/light_colors.dart';
import 'package:fitfat/core/utils/app_styles.dart';
import 'package:flutter/material.dart';

class EnterOtpsentToText extends StatelessWidget {
  const EnterOtpsentToText({
    super.key,
    required this.email,
  });

  final String email;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          "Enter OTP sent to",
          style: AppStyles.textStyle13.copyWith(
            color: AppLightColor.greyColor,
          ),
        ),
        const SizedBox(width: 5),
        Text(
          email,
          style: AppStyles.textStyle13.copyWith(
            color: AppLightColor.blackColor,
          ),
        )
      ],
    );
  }
}
