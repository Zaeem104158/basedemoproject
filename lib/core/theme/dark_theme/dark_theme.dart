import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../color/app_colors.dart';

final darkTheme = ThemeData(
  scaffoldBackgroundColor: AppColors.darkOnPrimaryColor,
  appBarTheme: AppBarTheme(
    backgroundColor: AppColors.darkPrimaryColor, // Use primaryColor
    //foregroundColor: AppColors.onPrimary, // Text/icon color on AppBar
  ),
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    backgroundColor: AppColors.darkPrimaryColor, // Use surfaceColor
    //selectedItemColor: AppColors.primaryColor, // Highlighted item
    //unselectedItemColor: Colors.grey, // Non-highlighted items
  ),
  colorScheme: ColorScheme.dark(
      primary: AppColors.darkOnPrimaryColor, onPrimary: AppColors.whiteColor),
).copyWith(
  textTheme: GoogleFonts.montserratTextTheme().copyWith(
    displayLarge: GoogleFonts.montserrat(
      fontSize: 48,
      fontWeight: FontWeight.bold,
      color: AppColors.whiteColor, // Adapt for dark theme
    ),
    displayMedium: GoogleFonts.montserrat(
      fontSize: 36,
      fontWeight: FontWeight.bold,
      color: AppColors.whiteColor,
    ),
    displaySmall: GoogleFonts.montserrat(
      fontSize: 28,
      fontWeight: FontWeight.bold,
      color: AppColors.whiteColor,
    ),
    headlineLarge: GoogleFonts.montserrat(
      fontSize: 24,
      fontWeight: FontWeight.w600,
      color: AppColors.whiteColor,
    ),
    headlineMedium: GoogleFonts.montserrat(
      fontSize: 20,
      fontWeight: FontWeight.w600,
      color: AppColors.whiteColor,
    ),
    headlineSmall: GoogleFonts.montserrat(
      fontSize: 18,
      fontWeight: FontWeight.w500,
      color: AppColors.whiteColor,
    ),
    titleLarge: GoogleFonts.montserrat(
      fontSize: 16,
      fontWeight: FontWeight.bold,
      color: AppColors.whiteColor,
    ),
    titleMedium: GoogleFonts.montserrat(
      fontSize: 14,
      fontWeight: FontWeight.w500,
      color: AppColors.whiteColor,
    ),
    titleSmall: GoogleFonts.montserrat(
      fontSize: 12,
      fontWeight: FontWeight.w500,
      color: AppColors.whiteColor,
    ),
    bodyLarge: GoogleFonts.montserrat(
      fontSize: 16,
      color: AppColors.whiteColor,
    ),
    bodyMedium: GoogleFonts.montserrat(
      fontSize: 14,
      color: AppColors.whiteColor,
    ),
    bodySmall: GoogleFonts.montserrat(
      fontSize: 12,
      color: AppColors.whiteColor,
    ),
    labelLarge: GoogleFonts.montserrat(
      fontSize: 14,
      fontWeight: FontWeight.bold,
      color: AppColors.whiteColor,
    ),
    labelMedium: GoogleFonts.montserrat(
      fontSize: 12,
      fontWeight: FontWeight.bold,
      color: AppColors.whiteColor,
    ),
    labelSmall: GoogleFonts.montserrat(
      fontSize: 10,
      fontWeight: FontWeight.bold,
      color: AppColors.whiteColor,
    ),
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: AppColors.darkPrimaryColor,
      foregroundColor: AppColors.backgroundColor,
      disabledBackgroundColor: AppColors.darkOnPrimaryColor.withOpacity(0.5),
      disabledForegroundColor: AppColors.darkOnPrimaryColor.withOpacity(0.2),
    ),
  ),
  textButtonTheme: TextButtonThemeData(
    style: TextButton.styleFrom(
      foregroundColor: AppColors.secondaryColor,
    ),
  ),
  outlinedButtonTheme: OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
      foregroundColor: AppColors.secondaryColor,
      side: const BorderSide(color: AppColors.secondaryColor),
    ),
  ),
);
