import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'color_schemes.dart';
import 'text_styles.dart';

final ThemeData darkTheme = ThemeData(
  primaryColor: AppColors.primaryDark,
  scaffoldBackgroundColor: AppColors.backgroundDark,

  appBarTheme: AppBarTheme(
    backgroundColor: AppColors.primaryDark,
    titleTextStyle: AppTextStyles.heading1.copyWith(color: Colors.white),
    iconTheme: const IconThemeData(color: Colors.white),
    elevation: 0,
  ),

  textTheme: TextTheme(
    displayLarge: AppTextStyles.heading1,
    displayMedium: AppTextStyles.heading2,
    displaySmall: AppTextStyles.heading3,
    bodyLarge: AppTextStyles.body.copyWith(color: AppColors.textDark),
    bodyMedium: AppTextStyles.body.copyWith(color: AppColors.textDark),
    bodySmall: AppTextStyles.subtext.copyWith(color: AppColors.subtextDark),
  ),

  iconTheme: const IconThemeData(
    color: AppColors.iconDark,
    size: 24,
  ),

  cardTheme: CardTheme(
    color: AppColors.cardDark,
    elevation: 2,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(12),
    ),
  ),

  dividerTheme: const DividerThemeData(
    color: AppColors.borderDark,
    thickness: 1,
  ),

  inputDecorationTheme: InputDecorationTheme(
    filled: true,
    fillColor: Colors.grey[850],
    border: OutlineInputBorder(
      borderSide: const BorderSide(color: AppColors.borderDark),
      borderRadius: BorderRadius.circular(8),
    ),
    focusedBorder: OutlineInputBorder(
      borderSide: const BorderSide(color: AppColors.primaryDark, width: 2),
      borderRadius: BorderRadius.circular(8),
    ),
    hintStyle: AppTextStyles.subtext.copyWith(color: AppColors.subtextDark),
    labelStyle: AppTextStyles.body.copyWith(color: AppColors.textDark),
  ),

  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: AppColors.primaryDark,
      foregroundColor: Colors.white,
      textStyle: AppTextStyles.body.copyWith(fontWeight: FontWeight.bold),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
    ),
  ),

  textButtonTheme: TextButtonThemeData(
    style: TextButton.styleFrom(
      foregroundColor: AppColors.primaryDark,
      textStyle: AppTextStyles.body,
    ),
  ),

  floatingActionButtonTheme: const FloatingActionButtonThemeData(
    backgroundColor: AppColors.primaryDark,
    foregroundColor: Colors.white,
  ),

  snackBarTheme: SnackBarThemeData(
    backgroundColor: AppColors.primaryDark,
    contentTextStyle: AppTextStyles.body.copyWith(color: Colors.white),
    behavior: SnackBarBehavior.floating,
  ),

  progressIndicatorTheme: const ProgressIndicatorThemeData(
    color: AppColors.primaryDark,
  ),

  colorScheme: const ColorScheme.light(
    primary: AppColors.primaryDark,
    onPrimary: Colors.white,
    background: AppColors.backgroundDark,
    onBackground: AppColors.textDark,
    surface: AppColors.cardDark,
    onSurface: AppColors.textDark,
    error: AppColors.errorDark,
    onError: Colors.white,
  ),

  navigationBarTheme: NavigationBarThemeData(
    backgroundColor: AppColors.cardDark,
    indicatorColor: AppColors.primaryDark,
    labelTextStyle: MaterialStateProperty.all(
      TextStyle(
          fontSize: 14.sp,
          fontWeight: FontWeight.w500,
          color: AppColors.textDark
      ),
    ),
    iconTheme: MaterialStateProperty.all(
      IconThemeData(
          size: 24.r,
          color: AppColors.iconDark
      ),
    ),
  ),

  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    backgroundColor: AppColors.cardDark,
    selectedItemColor: AppColors.subtextDark,
    unselectedItemColor: AppColors.borderDark,
    selectedLabelStyle: TextStyle(
        fontSize: 14.sp,
        fontWeight: FontWeight.w500,
        color: AppColors.textDark
    ),
    unselectedLabelStyle: TextStyle(
        fontSize: 14.sp,
          fontWeight: FontWeight.w500,
          color: AppColors.textDark
    ),

  ),
);
