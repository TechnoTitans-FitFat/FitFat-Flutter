import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton(
      {super.key,
      this.widget,
      this.borderColor,
      this.background,
      this.widgetColor,
      this.onPressed,
      this.flex});

  final String? widget;
  final Color? background;
  final Color? borderColor;
  final Color? widgetColor;
  final VoidCallback? onPressed;
  final int? flex;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: flex ?? 1,
      child: ElevatedButton(
        onPressed: onPressed!,
        style: ElevatedButton.styleFrom(
            backgroundColor: background,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
                side: BorderSide(color: borderColor ?? Colors.red))),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              widget!,
              style: TextStyle(
                  color: widgetColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
