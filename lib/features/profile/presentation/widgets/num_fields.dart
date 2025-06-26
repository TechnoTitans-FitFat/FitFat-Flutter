import 'package:fitfat/core/constants/light_colors.dart';
import 'package:flutter/material.dart';

class TextFieldProfile extends StatelessWidget {
  const TextFieldProfile(
      {super.key,
      this.controller,
      this.hint,
      this.lable,
      required this.onChange});

  final String? lable;
  final String? hint;
  final TextEditingController? controller;
  final ValueChanged<String> onChange;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: onChange,
      keyboardType: TextInputType.number,
      controller: controller,
      decoration: InputDecoration(
        hintText: hint!,
        labelText: lable!,
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(16)),
          borderSide: BorderSide(color: AppLightColor.greyColor),
        ),
      ),
    );
  }
}
