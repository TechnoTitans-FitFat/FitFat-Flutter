import 'package:fitfat/core/constants/light_colors.dart';
import 'package:fitfat/core/utils/app_styles.dart';
import 'package:flutter/material.dart';

class TextFieldDialog extends StatelessWidget {
  const TextFieldDialog({
    super.key,
     required this.label,
    required this.hint,
    required this.controller,
    });

  @override
  final String label;
  final String hint;
  final TextEditingController controller;
  Widget build(BuildContext context) {
     return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: AppStyles.textStyle14),
        const SizedBox(height: 8),
        TextField(
          controller: controller,
          cursorColor: AppLightColor.mainColor,
          keyboardType: TextInputType.number,
          decoration: InputDecoration(
            fillColor: AppLightColor.whiteColor,
            filled: true,
            hintText: hint,
            hintStyle: AppStyles.textStyle13,
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(
                color: AppLightColor.whiteColor
              )
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
               borderSide: const BorderSide(
                color: AppLightColor.whiteColor
              )
            ),
          ),
        ),
      ],
    );
  }
}