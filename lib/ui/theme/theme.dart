import 'package:dash_n_go/ui/theme/colors.dart';
import 'package:flutter/material.dart';

class AppTheme {
  static final lightTheme = ThemeData(
    useMaterial3: true,
    primaryColor: AppColors.colorPrimary,
    colorScheme: ColorScheme(
      brightness: Brightness.light,
      primary: AppColors.colorPrimary,
      onPrimary: AppColors.colorOnBackground,
      secondary: AppColors.colorSecondary,
      onSecondary: AppColors.colorOnBackground,
      error: AppColors.colorPink,
      onError: AppColors.colorText,
      surface: AppColors.colorBackground,
      onSurface: AppColors.colorOnBackground,
    ),
    fontFamily: 'Brand-Regular',
    textTheme: const TextTheme(
      bodyMedium: TextStyle(color: AppColors.colorTextDark),
      bodyLarge: TextStyle(color: AppColors.colorTextDark),
      titleMedium: TextStyle(color: AppColors.colorTextDark),
      headlineMedium: TextStyle(
        color: AppColors.colorTextDark,
        fontWeight: FontWeight.bold,
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(4.0),
        borderSide: const BorderSide(color: AppColors.colorOnBackground),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(4.0),
        borderSide: const BorderSide(color: AppColors.colorOnBackground),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(4.0),
        borderSide: const BorderSide(color: AppColors.colorPrimary, width: 2.0),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(4.0),
        borderSide: const BorderSide(color: AppColors.colorPink, width: 2.0),
      ),
    ),
  );

  static final darkTheme = ThemeData(
    useMaterial3: true,
    primaryColor: AppColors.colorPrimaryDark,
    colorScheme: ColorScheme(
      brightness: Brightness.dark,
      primary: AppColors.colorPrimaryDark,
      onPrimary: AppColors.colorOnBackgroundDark,
      secondary: AppColors.colorSecondary,
      onSecondary: AppColors.colorOnBackgroundDark,
      error: AppColors.colorPink,
      onError: AppColors.colorText,
      surface: AppColors.colorBackgroundDark,
      onSurface: AppColors.colorOnBackgroundDark,
    ),
    fontFamily: 'Brand-Regular',
    textTheme: const TextTheme(
      bodyMedium: TextStyle(color: AppColors.colorTextLight),
      bodyLarge: TextStyle(color: AppColors.colorTextLight),
      titleMedium: TextStyle(color: AppColors.colorTextLight),
      headlineMedium: TextStyle(
        color: AppColors.colorTextSemiLight,
        fontWeight: FontWeight.bold,
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(4.0),
        borderSide: const BorderSide(color: AppColors.colorOnBackgroundDark),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(4.0),
        borderSide: const BorderSide(color: AppColors.colorOnBackgroundDark),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(4.0),
        borderSide: const BorderSide(
          color: AppColors.colorPrimaryDark,
          width: 2.0,
        ),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(4.0),
        borderSide: const BorderSide(color: AppColors.colorPink, width: 2.0),
      ),
    ),
  );
}
