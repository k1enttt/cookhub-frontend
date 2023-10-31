import 'package:cookhub_frontend/core/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TTextTheme {
  TTextTheme._();

  static TextTheme lightTextTheme = const TextTheme(
    displayLarge: TextStyle(
      fontSize: TSizes.heading_32,
      fontWeight: FontWeight.w600,
    ),
    displayMedium: TextStyle(
      fontSize: TSizes.heading_24,
      fontWeight: FontWeight.w600,
    ),
    displaySmall: TextStyle(
      fontSize: TSizes.heading_20,
      fontWeight: FontWeight.w600,
    ),
    headlineMedium: TextStyle(
      fontSize: TSizes.heading_16,
      fontWeight: FontWeight.w600,
    ),
    headlineSmall: TextStyle(
      fontSize: TSizes.heading_12,
      fontWeight: FontWeight.w600,
    ),
    titleLarge: TextStyle(
      fontSize: TSizes.heading_10,
      fontWeight: FontWeight.w600,
    ),
    bodyLarge: TextStyle(
      fontSize: TSizes.bodyLarge,
      fontWeight: FontWeight.normal,
    ),
    bodyMedium: TextStyle(
      fontSize: TSizes.bodyMedium,
      fontWeight: FontWeight.normal,
    ),
    bodySmall: TextStyle(
      fontSize: TSizes.bodyNormal,
      fontWeight: FontWeight.normal,
    ),
  ).apply(
    displayColor: Colors.white,
    bodyColor: Colors.white,
    fontFamily: GoogleFonts.poppins().fontFamily,
  );
  static TextTheme darkTextTheme = TextTheme();
}
