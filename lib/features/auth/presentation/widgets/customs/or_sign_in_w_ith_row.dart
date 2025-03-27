import 'package:fitfat/core/constants/light_colors.dart';
import 'package:fitfat/core/utils/app_styles.dart';
import 'package:flutter/material.dart';

class OrSignInWIthRow extends StatelessWidget {
  const OrSignInWIthRow({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
          width: MediaQuery.sizeOf(context).width * 0.2,
          child: const Divider(color: AppLightColor.blackColor_2, height: 8),
        ),
        Padding(
          padding: const EdgeInsets.only(right: 8, left: 8),
          child: Text(
            'Or sign in with',
            style: AppStyles.textStyle13.copyWith(
              color: AppLightColor.blackColor_2,
            ),
          ),
        ),
        SizedBox(
          width: MediaQuery.sizeOf(context).width * 0.2,
          child: const Divider(color: AppLightColor.blackColor_2, height: 8),
        ),
      ],
    );
  }
}
