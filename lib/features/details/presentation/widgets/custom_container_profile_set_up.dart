import 'package:fitfat/core/constants/light_colors.dart';
import 'package:flutter/material.dart';

class CustomContainerProfileSetUp extends StatelessWidget {
  const CustomContainerProfileSetUp({
    super.key,
    required this.child,
  });
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(42),
            topRight: Radius.circular(42),
          ),
          color: AppLightColor.whiteColor,
        ),
        child: child,
      ),
    );
  }
}
