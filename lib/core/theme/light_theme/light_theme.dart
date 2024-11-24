import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../color/app_colors.dart';

final lightTheme = ThemeData(
  scaffoldBackgroundColor: AppColors.whiteColor,
  appBarTheme: const AppBarTheme(
    backgroundColor: AppColors.primaryColor, // Use primaryColor
    //foregroundColor: AppColors.onPrimary, // Text/icon color on AppBar
  ),
  bottomNavigationBarTheme: const BottomNavigationBarThemeData(
    backgroundColor: AppColors.surfaceColor, // Use surfaceColor
    //selectedItemColor: AppColors.primaryColor, // Highlighted item
    //unselectedItemColor: Colors.grey, // Non-highlighted items
  ),
  colorScheme: const ColorScheme.light(
    primary: AppColors.primaryColor,
  ),
).copyWith(
  textTheme: GoogleFonts.montserratTextTheme().copyWith(
    displayLarge: GoogleFonts.montserrat(
      fontSize: 48,
      fontWeight: FontWeight.bold,
      color: AppColors.blackColor, // Adapt for light theme
    ),
    displayMedium: GoogleFonts.montserrat(
      fontSize: 36,
      fontWeight: FontWeight.bold,
      color: AppColors.blackColor,
    ),
    displaySmall: GoogleFonts.montserrat(
      fontSize: 28,
      fontWeight: FontWeight.bold,
      color: AppColors.blackColor,
    ),
    headlineLarge: GoogleFonts.montserrat(
      fontSize: 24,
      fontWeight: FontWeight.w600,
      color: AppColors.blackColor,
    ),
    headlineMedium: GoogleFonts.montserrat(
      fontSize: 20,
      fontWeight: FontWeight.w600,
      color: AppColors.blackColor,
    ),
    headlineSmall: GoogleFonts.montserrat(
      fontSize: 18,
      fontWeight: FontWeight.w500,
      color: AppColors.blackColor,
    ),
    titleLarge: GoogleFonts.montserrat(
      fontSize: 16,
      fontWeight: FontWeight.bold,
      color: AppColors.blackColor,
    ),
    titleMedium: GoogleFonts.montserrat(
      fontSize: 14,
      fontWeight: FontWeight.w500,
      color: AppColors.blackColor,
    ),
    titleSmall: GoogleFonts.montserrat(
      fontSize: 12,
      fontWeight: FontWeight.w500,
      color: AppColors.blackColor,
    ),
    bodyLarge: GoogleFonts.montserrat(
      fontSize: 16,
      color: AppColors.blackColor,
    ),
    bodyMedium: GoogleFonts.montserrat(
      fontSize: 14,
      color: AppColors.blackColor,
    ),
    bodySmall: GoogleFonts.montserrat(
      fontSize: 12,
      color: AppColors.blackColor,
    ),
    labelLarge: GoogleFonts.montserrat(
      fontSize: 14,
      fontWeight: FontWeight.bold,
      color: AppColors.blackColor,
    ),
    labelMedium: GoogleFonts.montserrat(
      fontSize: 12,
      fontWeight: FontWeight.bold,
      color: AppColors.blackColor,
    ),
    labelSmall: GoogleFonts.montserrat(
      fontSize: 10,
      fontWeight: FontWeight.bold,
      color: AppColors.blackColor,
    ),
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: AppColors.primaryColor,
      foregroundColor: AppColors.backgroundColor, // Text color
    ),
  ),
  textButtonTheme: TextButtonThemeData(
    style: TextButton.styleFrom(
      foregroundColor: AppColors.primaryColor,
    ),
  ),
  outlinedButtonTheme: OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
      foregroundColor: AppColors.primaryColor,
      side: const BorderSide(color: AppColors.primaryColor),
    ),
  ),
);
