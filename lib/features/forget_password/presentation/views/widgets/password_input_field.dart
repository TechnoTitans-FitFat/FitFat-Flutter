import 'package:flutter/material.dart';
import 'package:fitfat/core/constants/light_colors.dart';
import 'package:fitfat/core/utils/app_styles.dart';

class PasswordInputField extends StatelessWidget {
  final String label;
  final TextEditingController controller;
  final bool obscureText;
  final VoidCallback? toggleVisibility;
  final String? Function(String?)? validator;
  final bool showToggleIcon;

  const PasswordInputField({
    super.key,
    required this.label,
    required this.controller,
    required this.obscureText,
    this.toggleVisibility,
    this.validator,
    this.showToggleIcon = true,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: AppStyles.textStyle15.copyWith(
            color: AppLightColor.greyColor1,
            fontWeight: FontWeight.w800,
          ),
        ),
        TextFormField(
          controller: controller,
          decoration: InputDecoration(
            suffixIcon: showToggleIcon && toggleVisibility != null
                ? IconButton(
                    icon: Icon(
                      obscureText ? Icons.visibility_off : Icons.visibility,
                    ),
                    onPressed: toggleVisibility,
                  )
                : null,
            hintStyle: AppStyles.textStyle12Light.copyWith(
              color: AppLightColor.greyColor,
            ),
            focusColor: AppLightColor.mainColor,
            hintText: "Enter your password",
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
          obscureText: obscureText,
          validator: validator,
        ),
      ],
    );
  }
}
