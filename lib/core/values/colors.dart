import 'package:flutter/material.dart';

int _hexColor(String color) {
  String newColor = '0xff$color';
  newColor = newColor.replaceAll('#', '');
  int finalColor = int.parse(newColor);
  return finalColor;
}

class ColorSelect {
  static Color primaryColor = Color(_hexColor('#F58549'));
  static Color secondaryColor = Color(_hexColor('#88CC60'));
  static Color tertiaryColor = Color(_hexColor('#93DED3'));
  static Color textColor = Color(_hexColor('#05162A'));
  static Color gray_100 = Color(_hexColor('#8A939C'));
  static Color gray_200 = Color(_hexColor('#B4BAC1'));
  static Color gray_300 = Color(_hexColor('#E0E2E6'));
  static Color gray_400 = Color(_hexColor('#F5F5F6'));
}
