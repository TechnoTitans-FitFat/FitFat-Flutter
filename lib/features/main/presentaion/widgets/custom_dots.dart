import 'package:flutter/material.dart';

class CustomDots extends StatelessWidget {
  const CustomDots({
    super.key,
    required this.dotsColor,
  });
  final Color dotsColor;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
      child: Container(
        height: 15,
        width: 15,
        decoration: BoxDecoration(
          color: dotsColor,
          borderRadius: BorderRadius.circular(
            25,
          ),
        ),
      ),
    );
  }
}
