import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton(
      {super.key,
      this.widget,
      this.icon,
      this.borderColor,
      this.background,
      this.widgetColor,
      this.size,
      this.onPressed});

  final String? widget;
  final IconData? icon;
  final Color? background;
  final Color? borderColor;
  final Color? widgetColor;
  final double? size;
  final VoidCallback ? onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed!,
      style: ElevatedButton.styleFrom(
          backgroundColor: background,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
              side: BorderSide(color: borderColor!))),
      child: Row(
        children: [
          Text(
            widget!,
            style: TextStyle(
                color: widgetColor, fontWeight: FontWeight.bold, fontSize: 16),
          ),
        ],
      ),
    );
  }
}
