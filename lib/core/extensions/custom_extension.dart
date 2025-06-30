import 'package:flutter/material.dart';

class CustomThemeExtension extends ThemeExtension<CustomThemeExtension> {
  final Color backgroundColor;
  final Color whiteColor;
  final Color whiteColor1;
  final Color mainColor;
  final Color blackColor;
  final Color blackColor2;
  final Color greyColor;
  final Color greyColor1;
  final Color green;
  final Color secondColor;
  final Color transparent;

  CustomThemeExtension({
    required this.backgroundColor,
    required this.whiteColor,
    required this.whiteColor1,
    required this.mainColor,
    required this.blackColor,
    required this.blackColor2,
    required this.greyColor,
    required this.greyColor1,
    required this.green,
    required this.secondColor,
    required this.transparent,
  });

  static CustomThemeExtension fallback() {
    return CustomThemeExtension(
      backgroundColor: const Color(0xffF5F5F5),
      whiteColor: const Color(0xffffffff),
      whiteColor1: const Color(0xffF6FBFB),
      mainColor: const Color(0xffe32636),
      blackColor: const Color(0xff000000),
      blackColor2: const Color.fromARGB(255, 70, 68, 68),
      greyColor: const Color.fromRGBO(0, 0, 0, 0.5),
      greyColor1: const Color.fromRGBO(0, 0, 0, 0.7),
      green: const Color(0xff2fe487),
      secondColor: const Color(0xffFBE0E2),
      transparent: Colors.transparent,
    );
  }

  @override
  CustomThemeExtension copyWith({
    Color? backgroundColor,
    Color? whiteColor,
    Color? whiteColor1,
    Color? mainColor,
    Color? blackColor,
    Color? blackColor2,
    Color? greyColor,
    Color? greyColor1,
    Color? green,
    Color? secondColor,
    Color? transparent,
  }) {
    return CustomThemeExtension(
      backgroundColor: backgroundColor ?? this.backgroundColor,
      whiteColor: whiteColor ?? this.whiteColor,
      whiteColor1: whiteColor1 ?? this.whiteColor1,
      mainColor: mainColor ?? this.mainColor,
      blackColor: blackColor ?? this.blackColor,
      blackColor2: blackColor2 ?? this.blackColor2,
      greyColor: greyColor ?? this.greyColor,
      greyColor1: greyColor1 ?? this.greyColor1,
      green: green ?? this.green,
      secondColor: secondColor ?? this.secondColor,
      transparent: transparent ?? this.transparent,
    );
  }

  @override
  ThemeExtension<CustomThemeExtension> lerp(
      covariant ThemeExtension<CustomThemeExtension>? other, double t) {
    if (other is! CustomThemeExtension) {
      return this;
    }

    return CustomThemeExtension(
      backgroundColor: Color.lerp(backgroundColor, other.backgroundColor, t)!,
      whiteColor: Color.lerp(whiteColor, other.whiteColor, t)!,
      whiteColor1: Color.lerp(whiteColor1, other.whiteColor1, t)!,
      mainColor: Color.lerp(mainColor, other.mainColor, t)!,
      blackColor: Color.lerp(blackColor, other.blackColor, t)!,
      blackColor2: Color.lerp(blackColor2, other.blackColor2, t)!,
      greyColor: Color.lerp(greyColor, other.greyColor, t)!,
      greyColor1: Color.lerp(greyColor1, other.greyColor1, t)!,
      green: Color.lerp(green, other.green, t)!,
      secondColor: Color.lerp(secondColor, other.secondColor, t)!,
      transparent: Color.lerp(transparent, other.transparent, t)!,
    );
  }
}
