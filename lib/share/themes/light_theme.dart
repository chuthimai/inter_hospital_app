import 'package:flutter/material.dart';
import 'color_schemes.dart';
import 'text_styles.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

final ThemeData lightTheme = ThemeData(
  brightness: Brightness.light,
  primaryColor: AppColors.primaryLight,
  scaffoldBackgroundColor: AppColors.backgroundLight,

  appBarTheme: AppBarTheme(
    backgroundColor: AppColors.primaryLight,
    titleTextStyle: AppTextStyles.heading1.copyWith(color: Colors.white),
    iconTheme: const IconThemeData(color: Colors.white),
    elevation: 0,
  ),

  textTheme: TextTheme(
    displayLarge: AppTextStyles.heading1,
    displayMedium: AppTextStyles.heading2,
    displaySmall: AppTextStyles.heading3,
    bodyLarge: AppTextStyles.body.copyWith(color: AppColors.textLight),
    bodyMedium: AppTextStyles.body.copyWith(color: AppColors.textLight),
    bodySmall: AppTextStyles.subtext.copyWith(color: AppColors.subtextLight),
  ),

  iconTheme: const IconThemeData(
    color: AppColors.iconLight,
    size: 24,
  ),

  cardTheme: CardTheme(
    color: AppColors.cardLight,
    elevation: 2,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(12),
    ),
  ),

  dividerTheme: const DividerThemeData(
    color: AppColors.borderLight,
    thickness: 1,
  ),

  inputDecorationTheme: InputDecorationTheme(
    filled: true,
    fillColor: Colors.white,
    border: OutlineInputBorder(
      borderSide: const BorderSide(color: AppColors.borderLight),
      borderRadius: BorderRadius.circular(8),
    ),
    focusedBorder: OutlineInputBorder(
      borderSide: const BorderSide(color: AppColors.primaryLight, width: 2),
      borderRadius: BorderRadius.circular(8),
    ),
    hintStyle: AppTextStyles.subtext.copyWith(color: AppColors.subtextLight),
    labelStyle: AppTextStyles.body.copyWith(color: AppColors.textLight),
  ),

  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: AppColors.primaryLight,
      foregroundColor: Colors.white,
      textStyle: AppTextStyles.body.copyWith(fontWeight: FontWeight.bold),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
    ),
  ),

  textButtonTheme: TextButtonThemeData(
    style: TextButton.styleFrom(
      foregroundColor: AppColors.primaryLight,
      textStyle: AppTextStyles.body,
    ),
  ),

  floatingActionButtonTheme: const FloatingActionButtonThemeData(
    backgroundColor: AppColors.primaryLight,
    foregroundColor: Colors.white,
  ),

  snackBarTheme: SnackBarThemeData(
    backgroundColor: AppColors.cardLight,
    contentTextStyle: AppTextStyles.body.copyWith(color: Colors.blueGrey),
    behavior: SnackBarBehavior.floating,
  ),

  progressIndicatorTheme: const ProgressIndicatorThemeData(
    color: AppColors.primaryLight,
  ),

  colorScheme: const ColorScheme.light(
    primary: AppColors.primaryLight,
    onPrimary: Colors.white,
    background: AppColors.backgroundLight,
    onBackground: AppColors.textLight,
    surface: AppColors.cardLight,
    onSurface: AppColors.textLight,
    error: AppColors.errorLight,
    onError: Colors.white,
  ),

  navigationBarTheme: NavigationBarThemeData(
    backgroundColor: AppColors.cardLight,
    indicatorColor: AppColors.primaryLight,
    labelTextStyle: MaterialStateProperty.all(
      TextStyle(
        fontSize: 14.sp,
        fontWeight: FontWeight.w500,
        color: AppColors.textLight
      ),
    ),
    iconTheme: MaterialStateProperty.all(
      IconThemeData(
          size: 24.r,
          color: AppColors.iconLight
      ),
    ),
  ),

  bottomNavigationBarTheme: const BottomNavigationBarThemeData(
    backgroundColor: AppColors.cardLight,
    selectedItemColor: AppColors.subtextLight,
    unselectedItemColor: AppColors.borderLight,
  ),
);
