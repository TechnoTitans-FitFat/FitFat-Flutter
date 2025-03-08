import 'package:flutter/material.dart';
import '../../../../../core/constants/light_colors.dart';

class CustomTextField extends StatefulWidget {
  const CustomTextField({
    super.key,
    this.hint,
    this.icon,
    this.controller,
    this.onchange,
    this.sufIcon,
    this.sufIconNot,
    this.noti,
  });

  final TextEditingController? controller;
  final IconData? icon;
  final IconData? sufIcon;
  final IconData? sufIconNot;
  final String? hint;
  final Function(String)? onchange;
  final String? noti;

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool passwordVisible = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 50),
      child: TextFormField(
        controller: widget.controller,
        validator: (data) {
          if (data == null || data.isEmpty) {
            return widget.noti;
          }
          return null;
        },
        onChanged: widget.onchange,
        obscureText: widget.sufIcon != null ? !passwordVisible : false, 
        decoration: InputDecoration(
          prefixIcon: widget.icon != null
              ? Icon(widget.icon, color: AppLightColor.greyColor)
              : null,
          suffixIcon: (widget.sufIcon != null && widget.sufIconNot != null)
              ? IconButton(
                  onPressed: () {
                    setState(() {
                      passwordVisible = !passwordVisible;
                    });
                  },
                  icon: Icon(
                    passwordVisible ? widget.sufIcon : widget.sufIconNot,
                    color: AppLightColor.greyColor,
                  ),
                )
              : null, 
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
      borderRadius: BorderRadius.circular(8),
    );
  }
}
