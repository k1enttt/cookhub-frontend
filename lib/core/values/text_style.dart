import 'package:cookhub_frontend/core/values/colors.dart';
import 'package:flutter/material.dart';

class CustomTextStyles {
  static const TextStyle heading2Style = TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.bold,
    fontFamily: 'Poppins',
    height: 1.3,
  );
  static const TextStyle heading3Style = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.bold,
    fontFamily: 'Poppins',
    height: 1.5,
  );
  static const largeBoldStyle = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.bold,
    fontFamily: 'Poppins',
    height: 1.3,
  );
  static const TextStyle mediumStyle = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.bold,
    fontFamily: 'Poppins',
    height: 1.3,
  );
  static const TextStyle normalStyle = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.normal,
    fontFamily: 'Poppins',
    height: 1.3,
    letterSpacing: 0.2,
    color: CustomColor.text,
  );
  static const BigTextButtonStyle = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.bold,
    fontFamily: 'Poppins',
    height: 1.5,
    letterSpacing: 0.2,
    color: CustomColor.text,
  );
}