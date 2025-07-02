import 'package:fitfat/core/extensions/context_color_extension.dart';
import 'package:fitfat/features/splash/presentation/widgets/splash_body.dart';
import 'package:flutter/material.dart';

class SplashView extends StatelessWidget {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: context.theme.backgroundColor,
      body:const SplashBody()
      );
  }
}
