import 'package:cookhub_frontend/app/modules/account/screens/profile_screen.dart';
import 'package:cookhub_frontend/app/modules/add_recipe/screen/add_recipe_screen.dart';
import 'package:cookhub_frontend/app/modules/explore/screens/explore_screen.dart';
import 'package:cookhub_frontend/app/modules/home/screens/home_page.dart';
import 'package:cookhub_frontend/core/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  // Implement HomeController
  final Rx<int> selectedIndex = 0.obs;
  final screens = [
    const HomePage(),
    const ExploreScreen(),
    const AddRecipeScreen(),
    Container(
      color: ColorSelect.textColor,
    ),
    const ProfileScreen(),
  ];
}
