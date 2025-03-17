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
    this.validator,
    this.obscureText,
    this.keyboardType,
  });

  final TextEditingController? controller;
  final IconData? icon;
  final IconData? sufIcon;
  final IconData? sufIconNot;
  final String? hint;
  final Function(String)? onchange;
  final String? noti;
  // Add validator parameter
  final String? Function(String?)? validator;
  // Add obscureText option to override default behavior
  final bool? obscureText;
  // Add keyboard type parameter
  final TextInputType? keyboardType;

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool passwordVisible = false;
  bool hasError = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 50),
      child: TextFormField(
        controller: widget.controller,
        // Use custom validator if provided, otherwise use default behavior
        validator: widget.validator ?? (data) {
          if (data == null || data.isEmpty) {
            setState(() {
              hasError = true;
            });
            return widget.noti;
          }
          setState(() {
            hasError = false;
          });
          return null;
        },
        onChanged: widget.onchange,
        // Use custom obscureText if provided, otherwise use default behavior
        obscureText: widget.obscureText ?? 
          (widget.sufIcon != null ? !passwordVisible : false),
        // Use provided keyboard type or default to text
        keyboardType: widget.keyboardType ?? TextInputType.text,
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
          errorBorder: buildBorder(isError: true),
          focusedErrorBorder: buildBorder(isError: true),
        ),
      ),
    );
  }

  OutlineInputBorder buildBorder({bool isError = false}) {
    return OutlineInputBorder(
      borderSide: BorderSide(color: isError ? AppLightColor.mainColor : AppLightColor.greyColor),
      borderRadius: BorderRadius.circular(8),
    );
  }
}