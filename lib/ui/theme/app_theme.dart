import 'package:flutter/material.dart';
import 'package:kopiness/core/theme/app_colors.dart';

class AppTheme {
  static ThemeData light = ThemeData(
    useMaterial3: true,
    primaryColor: AppColors.primary,
    scaffoldBackgroundColor: Colors.white,

    colorScheme: ColorScheme.fromSeed(
      seedColor: AppColors.primary,
      primary: AppColors.primary,
    ),

    textTheme: const TextTheme(bodyMedium: TextStyle(color: Colors.black)),
  );
}
