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
        Assets.images.img.image(width: MediaQuery.of(context).size.width, fit: BoxFit.cover),
    ],
    ),
    const SingleChildScrollView(
    child: Column(
    children: [
    SizedBox(
    height: 16,
    ),
    AnimatedToggle(),
    ],
    ),
    )
    ],
    );
  }
}
