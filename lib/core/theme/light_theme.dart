import 'package:fitfat/core/extensions/light_theme_extension.dart';
import 'package:flutter/material.dart';

final lightTheme = ThemeData.light().copyWith(
  extensions: [
    lightThemeEx,
  ],
);
