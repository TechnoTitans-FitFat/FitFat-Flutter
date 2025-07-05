import 'package:fitfat/core/extensions/context_color_extension.dart';
import 'package:fitfat/features/auth/presentation/widgets/customs/custom_animated_toggle.dart';
import 'package:fitfat/gen/assets.gen.dart';
import 'package:flutter/material.dart';

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
            Assets.images.main.image(
              width: MediaQuery.of(context).size.width,
              height: 200,
              fit: BoxFit.cover,
            ),
            Container(
              height: 200,
              width: double.infinity,
              color: context.theme.mainColor.withOpacity(
                0.2,
              ),
            ),
            Container(
              height: 15,
              width: double.infinity,
              decoration: BoxDecoration(
                color: context.theme.whiteColor,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(40),
                  topRight: Radius.circular(40),
                ),
              ),
            ),
          ],
        ),
        const AnimatedToggle()
      ],
    );
  }
}
