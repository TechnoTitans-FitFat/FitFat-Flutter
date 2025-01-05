import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  CustomButton(
      {super.key,
      this.widget,
      this.icon,
      this.borderColor,
      this.background,
      this.widgetColor,
      this.size});

  String? widget;
  IconData? icon;
  Color? background;
  Color? borderColor;
  Color? widgetColor;
  double? size;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {},
      child: Row(
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
      style: ElevatedButton.styleFrom(
        backgroundColor: background,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
              side: BorderSide(color: borderColor!))),
    );
  }
}
