import 'package:cookhub_frontend/core/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  // Implement HomeController
  final Rx<int> selectedIndex = 0.obs;
  final screens = [
    Container(
      color: ColorSelect.primaryColor,
    ),
    Container(
      color: ColorSelect.secondaryColor,
    ),
    Container(
      color: ColorSelect.tertiaryColor,
    ),
    Container(
      color: ColorSelect.textColor,
    ),
    Container(
      color: ColorSelect.gray_400,
    ),
  ];
}
