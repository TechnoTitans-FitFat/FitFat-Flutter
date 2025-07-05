import 'package:fitfat/core/extensions/context_color_extension.dart';
import 'package:flutter/material.dart';
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
            color: context.theme.greyColor1,
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
              color: context.theme.greyColor,
            ),
            focusColor: context.theme.mainColor,
            hintText: "Enter your password",
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
          obscureText: obscureText,
          validator: validator,
        ),
      ],
    );
  }
}
