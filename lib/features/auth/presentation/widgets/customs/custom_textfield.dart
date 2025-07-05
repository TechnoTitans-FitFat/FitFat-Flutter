import 'package:fitfat/core/extensions/context_color_extension.dart';
import 'package:fitfat/core/utils/app_styles.dart';
import 'package:flutter/material.dart';

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
  final String? Function(String?)? validator;
  final bool? obscureText;
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
        validator: widget.validator ??
            (data) {
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
        obscureText: widget.obscureText ??
            (widget.sufIcon != null ? !passwordVisible : false),
        keyboardType: widget.keyboardType ?? TextInputType.text,
        decoration: InputDecoration(
          prefixIcon: widget.icon != null
              ? Icon(widget.icon, color: context.theme.greyColor)
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
                    color: context.theme.greyColor,
                  ),
                )
              : null,
          hintText: widget.hint,
          hintStyle: AppStyles.textStyle13.copyWith(
            color: context.theme.greyColor,
            fontWeight: FontWeight.w500,
          ),
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
      borderSide: BorderSide(
          color: isError ? context.theme.mainColor : context.theme.greyColor),
      borderRadius: BorderRadius.circular(8),
    );
  }
}
