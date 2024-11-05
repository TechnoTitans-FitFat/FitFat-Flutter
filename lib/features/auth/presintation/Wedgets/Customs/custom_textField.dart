import 'package:fitfat/core/constants/light_colors.dart';
import 'package:flutter/material.dart';

class CustomTextField extends StatefulWidget {
  CustomTextField(
      {super.key,
      this.hint,
      this.icon,
      this.onchange,
      this.sufIcon,
      this.sufIconNot,
      this.noti});

  IconData? icon;
  IconData? sufIcon;
  IconData? sufIconNot;
  String? hint;
  Function(String)? onchange;
  String? noti;

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool passwordVisible = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 50,
      ),
      child: TextFormField(
        validator: (data) {
          if (data!.isEmpty) {
            return widget.noti;
          }
          return null;
        },
        onChanged: widget.onchange,
        obscureText: passwordVisible,
        decoration: InputDecoration(
          prefixIcon: Icon(widget.icon, color: AppLightColor.greyColor),
          suffixIcon: IconButton(
              onPressed: () {
                setState(
                  () {
                    passwordVisible = !passwordVisible;
                  },
                );
              },
              icon: Icon(
                passwordVisible ? widget.sufIcon : widget.sufIconNot,
                color: AppLightColor.greyColor,
              )),
          hintText: widget.hint,
          hintStyle: const TextStyle(color: AppLightColor.greyColor),
          focusedBorder: buildBorder(),
          enabledBorder: buildBorder(),
        ),
      ),
    );
  }

  OutlineInputBorder buildBorder() {
    return OutlineInputBorder(
        borderSide: const BorderSide(color: AppLightColor.greyColor),
        borderRadius: BorderRadius.circular(8));
  }
}
