import 'package:fitfat/core/cubit/theme/theme_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ThemeCubit extends Cubit<ThemeState> {
  ThemeCubit() : super(ThemeInitial());

  // Improved static method to get ThemeCubit
  static ThemeCubit of(BuildContext context) {
    return BlocProvider.of<ThemeCubit>(context);
  }

  ThemeMode _themeMode = ThemeMode.light;
  ThemeMode get themeMode => _themeMode;

  void toggleTheme() {
    _themeMode =
        _themeMode == ThemeMode.light ? ThemeMode.dark : ThemeMode.light;
    emit(ThemeChangedState());
  }

  bool get isDarkMode => _themeMode == ThemeMode.dark;
}
