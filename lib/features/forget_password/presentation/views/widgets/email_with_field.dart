import 'package:fitfat/core/extensions/context_color_extension.dart';
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
            color: context.theme.greyColor1,
            fontWeight: FontWeight.w800,
          ),
        ),
        TextFormField(
          controller: emailController,
          decoration: InputDecoration(
            hintStyle: AppStyles.textStyle12Light.copyWith(
              color: context.theme.greyColor,
            ),
            focusColor: context.theme.mainColor,
            hintText: "Enter your Email Address",
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(
                color: context.theme.mainColor,
              ),
            ),
            border: UnderlineInputBorder(
              borderSide: BorderSide(
                color: context.theme.mainColor,
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
