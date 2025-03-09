import 'package:dash_n_go/ui/theme/colors.dart';
import 'package:flutter/material.dart';

class AppTheme {
  static final lightTheme = ThemeData(
    primaryColor: AppColors.colorPrimary,
    scaffoldBackgroundColor: Colors.white,
    colorScheme: ColorScheme.fromSeed(seedColor: AppColors.colorPrimary),
    fontFamily: 'Brand-Regular',
  );

  static final darkTheme = ThemeData(
    primaryColor: AppColors.colorPrimaryDark,
    scaffoldBackgroundColor: Colors.black,
    colorScheme: ColorScheme.fromSeed(seedColor: AppColors.colorPrimaryDark),
    fontFamily: 'Brand-Regular',
    textTheme: const TextTheme(
      bodyMedium: TextStyle(color: AppColors.colorTextLight),
      bodyLarge: TextStyle(color: Colors.white),
      titleMedium: TextStyle(color: Colors.white),
    ),
  );
}
