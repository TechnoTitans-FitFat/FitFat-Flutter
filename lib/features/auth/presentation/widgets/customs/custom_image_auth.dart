import 'package:fitfat/core/constants/light_colors.dart';
import 'package:fitfat/features/auth/presentation/widgets/customs/custom_animated_toggle.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomImageAuth extends StatelessWidget {
  const CustomImageAuth({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          clipBehavior: Clip.none,
          alignment: Alignment.bottomCenter,
          children: [
            SvgPicture.asset(
              'imges/shrimp.svg',
              width: MediaQuery.of(context).size.width,
              fit: BoxFit.cover,
            ),
          ],
        ),
          Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                color: AppLightColor.whiteColor),
            child: const SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                    height: 16,
                  ),
                  AnimatedToggle(),
                ],
              ),
            ),
          )
      ],
    );
  }
}
