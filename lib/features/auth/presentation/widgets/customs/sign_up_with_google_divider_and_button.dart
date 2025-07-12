import 'package:fitfat/core/extensions/context_color_extension.dart';
import 'package:fitfat/core/utils/app_styles.dart';
import 'package:fitfat/features/auth/presentation/widgets/customs/or_sign_in_w_ith_row.dart';
import 'package:fitfat/features/auth/presentation/widgets/customs/sign_up_with_google_button.dart';
import 'package:flutter/material.dart';

class SignUpWithGoogleDividerAndButton extends StatelessWidget {
  final TabController tabController;

  const SignUpWithGoogleDividerAndButton(
      {super.key, required this.tabController});

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 10,
      children: [
        // const OrSignInWIthRow(),
        //  const SignUpWithGoogleButton(),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Already have an account?",
              style: AppStyles.textStyle13.copyWith(
                color: context.theme.blackColor,
              ),
            ),
            TextButton(
              onPressed: () {
                tabController.index = 1;
              },
              style: TextButton.styleFrom(
                tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 2),
                minimumSize: Size.zero,
              ),
              child: Text(
                "login",
                style: AppStyles.textStyle13.copyWith(
                  color: context.theme.mainColor,
                ),
              ),
            )
          ],
        ),
      ],
    );
  }
}
