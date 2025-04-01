import 'package:fitfat/core/constants/light_colors.dart';
import 'package:fitfat/core/utils/app_styles.dart';
import 'package:flutter/material.dart';

class EmailWithField extends StatelessWidget {
  const EmailWithField({super.key, this.emailController});
  final TextEditingController? emailController;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(
          "Email Address",
          style: AppStyles.textStyle15.copyWith(
            color: AppLightColor.greyColor1,
            fontWeight: FontWeight.w800,
          ),
        ),
        TextFormField(
          controller: emailController,
          decoration: InputDecoration(
            hintStyle: AppStyles.textStyle12Light.copyWith(
              color: AppLightColor.greyColor,
            ),
            focusColor: AppLightColor.mainColor,
            hintText: "Enter your Email Address",
            focusedBorder: const UnderlineInputBorder(
              borderSide: BorderSide(
                color: AppLightColor.mainColor,
              ),
            ),
            border: const UnderlineInputBorder(
              borderSide: BorderSide(
                color: AppLightColor.mainColor,
              ),
            ),
          ),
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please enter your email';
            }
            return null;
          },
        ),
      ],
    );
  }
}
